package com.ktds.member.web;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.community.service.CommunityService;
import com.ktds.member.constants.Member;
import com.ktds.member.service.MemberService;
import com.ktds.member.vo.MemberVO;

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
			return "redirect:/";
		}
		return "member/login";
	}
	//2. 이후 applicationCopntext.xml가서 빈 컨트롤러 등록! 등록해야 동작함
	
	
	
	@RequestMapping(value="/regist", method = RequestMethod.GET)
	public String viewRegistPage() {
		return "member/regist";
	}
	
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public ModelAndView doRegistAction(@ModelAttribute("registForm")
								 @Valid MemberVO memberVO, Errors errors) {
		if( errors.hasErrors() ) {
			/*ModelAndView view = new ModelAndView();
			view.setViewName("member/regist");
			등등 => 안해도 @registForm으로 됨*/
			
			return new ModelAndView("member/regist");
		}
		
		if ( memberService.createMember(memberVO)) {
			return new ModelAndView("redirect:/login");
		}
		
		
		return new ModelAndView("redirect/regist");
	}		
	
	
	//3. login 제대로 했는지 확인
	@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String doLoginAction(MemberVO memberVO, HttpServletRequest request) {
		//session 보존방법 1. 리퀘스트객체 꺼내오기
		HttpSession session = request.getSession();
				
		
		
		/*if( memberVO.getEmail() == null || memberVO.getEmail().length() == 0 ) {
			session.setAttribute("status", "emptyId");
			return "redirect:/login";
		}
		
		if( memberVO.getPassword() == null || memberVO.getPassword().length() == 0 ) {
			session.setAttribute("status", "emptyPassword");
			return "redirect:/login";
		}*/
		
		
		//password가 1234가 맞는지 검증하는 작업
		
		
		//FIXME DB에 존재하지 않을경우로 변경
		MemberVO loginMember = memberService.readMember(memberVO);
		//db에서 memberVO가 가지고있는걸 조회해서 가져옴
		if ( loginMember != null ) {
			session.setAttribute(Member.USER, loginMember);
			return "redirect:/";
		} //이제 admin 1234말고 멤버 통해서만 로그인 가능함.
		
		/*if( memberVO.getEmail().equals("admin") &&
				memberVO.getPassword().equals("1234") ) {
			
			memberVO.setNickname("관리자");
			session.setAttribute(Member.USER, memberVO);//login 관련키는 __유저__로 고정:"__USER__"
			session.removeAttribute("status");
			
			return "redirect:/";
		}

		session.setAttribute("status", "fail");*/
		return "redirect:/login";
	}
	
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session) {
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
}

