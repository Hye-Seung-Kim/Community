package com.hstravel.member.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hstravel.actionhistory.service.ActionHistoryService;
import com.hstravel.actionhistory.vo.ActionHistory;
import com.hstravel.actionhistory.vo.ActionHistoryVO;
import com.hstravel.community.service.CommunityService;
import com.hstravel.member.constants.Member;
import com.hstravel.member.service.MemberService;
import com.hstravel.member.vo.MemberVO;

//애노테이션 잊지말기!
@Controller
public class MemberController {

	private MemberService memberService;
	private CommunityService communityService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
		   
	
	
	//1. requestmapping으로 url 추가. get방식으로
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLoginPage(HttpSession session) {
		
		//USER객체에 데이터가 들어가 있다면
		if( session.getAttribute("__USER__") != null ) {
			return "redirect:/list";
		}
		return "member/login";
	}
	//2. 이후 applicationCopntext.xml가서 빈 컨트롤러 등록! 등록해야 동작함
	
	
	
	@RequestMapping(value="/regist", method = RequestMethod.GET)
	public String viewRegistPage() {
		return "member/regist";
	}
	
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public String doRegistAction(@ModelAttribute("registForm")
								 @Valid MemberVO memberVO, Errors errors,
								 @RequestAttribute ActionHistoryVO actionHistory) {
		if( errors.hasErrors() ) {
			/*ModelAndView view = new ModelAndView();
			view.setViewName("member/regist");
			등등 => 안해도 @registForm으로 됨*/
			
			return "member/regist";
		}
		
		
		actionHistory.setReqType(ActionHistory.ReqType.MEMBER);
		
		if ( memberService.createMember(memberVO)) {
			// Regist : Email(%s), Nickname(%s), Result(%s)
			String log = String.format(ActionHistory.Log.REGIST,
					memberVO.getEmail(), memberVO.getNickname(), "true");
			actionHistory.setLog(log);
			
			
			return "redirect:/login";
		}
		
		// Regist : Email(%s), Nickname(%s), Result(%s)
		String log = String.format(ActionHistory.Log.REGIST,
				memberVO.getEmail(), memberVO.getNickname(), "false");
		actionHistory.setLog(log);
		
	
		return "member/regist";
		
	}		
	
	
	//3. login 제대로 했는지 확인
	@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String doLoginAction(MemberVO memberVO, HttpServletRequest request, Model model) {
		//session 보존방법 1. 리퀘스트객체 꺼내오기
		HttpSession session = request.getSession();
		
		ActionHistoryVO history =
				(ActionHistoryVO) request.getAttribute("actionHistory");
		history.setReqType(ActionHistory.ReqType.MEMBER);
		
		String log = String.format(ActionHistory.Log.LOGIN, memberVO.getEmail());
		history.setLog(log);
		model.addAttribute("actionHistory", history);

		MemberVO loginMember = memberService.readMember(memberVO);
		if ( loginMember != null ) {
			session.setAttribute(Member.USER, loginMember);
			return "redirect:/list";
		}
		return "redirect:/login";
	}
	
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session,
			@RequestAttribute ActionHistoryVO actionHistory) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		actionHistory.setReqType(ActionHistory.ReqType.MEMBER);
		String log = String.format(ActionHistory.Log.LOGOUT, member.getEmail());
		actionHistory.setLog(log);
		
		// 세션 소멸
		session.invalidate();
		return "redirect:/login";
	}
	
	   @RequestMapping("/delete/process1")
	   public String viewVerifyPage() {
	      return "member/delete/process1";
	   }
	   
	   @RequestMapping("/delete/process2")
	   public ModelAndView viewDeleteMyCommunitiesPage(
	         @RequestParam(required = false , defaultValue = "") String password, HttpSession session){
	      if(password.length() == 0) {
	         return new ModelAndView("error/404");  // 잘못 적었다면 404
	      }

	      MemberVO member = (MemberVO) session.getAttribute(Member.USER);
	      member.setPassword(password);
	      
	      MemberVO verifyMember = memberService.readMember(member);
	      if(verifyMember == null) {
	         return new ModelAndView("redirect:/delete/process1");  // 비번이 아니라면 돌아가라 
	      }
	      
	      // TODO 내가 작성한 게시글의 갯수 가져오기 
	      int myCommunitiesCount = communityService.readMyCommunitiesCount(verifyMember.getId());
	      
	      
	      ModelAndView view = new ModelAndView();
	      view.setViewName("member/delete/process2");
	      view.addObject("myCommunitiesCount", myCommunitiesCount);
	      
	      String uuid = UUID.randomUUID().toString();
	      session.setAttribute("__TOKEN__", uuid);
	      view.addObject("token", uuid);  // 나노세컨으로 난수를 생성
	      
	      
	      return view;
	   }
	   
	   
	   @RequestMapping("/account/delete/{deleteFlag}")
	   public String removeAction(HttpSession session,
	         @RequestParam(required=false, defaultValue="") String token,
	         @PathVariable String deleteFlag) {
	      
	      String sessionToken = (String) session.getAttribute("__TOKEN__");
	      if(sessionToken == null || !sessionToken.equals(token)) {
	         return "error/404";
	      }
	      
	      MemberVO member = (MemberVO) session.getAttribute(Member.USER);
	      if( member == null) {
	         return "redirect:/login";
	      }
	      int id= member.getId();
	      
	      if(memberService.removeMember(id, deleteFlag)){
	         session.invalidate();
	      }
	      
	      
	      
	      return "member/delete/delete";
	   }
	   
	   @RequestMapping("/api/exists/email")
	   @ResponseBody
		public Map<String, Boolean> apiIsExistsEmail(@RequestParam String email){
			boolean isExists = memberService.readCountMemberEmail(email);
			
			Map<String, Boolean> response = new HashMap<String, Boolean>();
			response.put("response", isExists);
			return response;
		}

	   @RequestMapping("/api/exists/nickname")
	   @ResponseBody
		public Map<String, Boolean> apiIsExistsNickname(@RequestParam String nickname){
			boolean isExists = memberService.readCountMemberNickname(nickname);
			
			Map<String, Boolean> response = new HashMap<String, Boolean>();
			response.put("response", isExists);
			return response;
		} 
	   
}

