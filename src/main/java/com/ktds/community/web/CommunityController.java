package com.ktds.community.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.community.service.CommunityService;
import com.ktds.community.util.DownloadUtil;
import com.ktds.community.vo.CommunityVO;
import com.ktds.member.constants.Member;
import com.ktds.member.vo.MemberVO;

@Controller
public class CommunityController {
 
	
	private CommunityService communityService;
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService; //=> 500에러로 이건 주석 처리.
	}
	
	/*페이지의 목적: 보여주기, 처리하기 인데 지금 하려는건 보여주기! 뷰*/
	@RequestMapping("/")
	public ModelAndView viewListPage() {
		
	
		ModelAndView view = new ModelAndView();
		// /WEB-INF/view/community/list.jsp
		view.setViewName("community/list");
		
		List<CommunityVO> communityList = communityService.getAll();
		view.addObject("communityList", communityList);
		
		return view;
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String viewWritePage() {
		
		return "community/write";
	}
	
	//파라미터의 네임들을 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView doWrite(@ModelAttribute("writeForm") 
								@Valid
								CommunityVO communityVO, Errors errors, 
								HttpSession session, HttpServletRequest request) {
		
		
		
		ModelAndView view = new ModelAndView();
		if( errors.hasErrors() ) {
			view.setViewName("community/write");
			view.addObject("communityVO", communityVO);
			return view;
		}
		
		//작성자의 IP를 얻어오는 코드
		String requestorIp = request.getRemoteAddr();
		communityVO.setRequestIp(requestorIp);
		 
		
		/*if ( communityVO.getTitle() == null || communityVO.getTitle().length() == 0) {
			session.setAttribute("status", "errorTitle");
			return "redirect:/write";
		}
		
		if ( communityVO.getBody() == null || communityVO.getBody().length() == 0) {
			session.setAttribute("status", "errorBody");
			return "redirect:/write";
		}*/

		
		communityVO.save();
		
		boolean isSuccess = communityService.createCommunity(communityVO);
		
		if ( isSuccess ) {
			return new ModelAndView("redirect:/"); //만약 성공했다면 리다이렉트하면서 끝남
		}
		
		return  new ModelAndView("redirect:/write");//실패했다면 라이트로 다시 돌아가
		
	}

	
	@RequestMapping("/view/{id}")
	public ModelAndView viewViewPage(@PathVariable int id) {
		//보여주기만 할거니깐 viewViewPage!
		//접속한 사람만 보여줄거기 때문에 session 부름, 받아올거기 때문에 PathVariable받아옴
		//주의할 점: /view /{id} => {}의 내부 글과 @PathVariable int id => int뒤의 값이 같아야 함.
		
	
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/community/view");
		
		//id로 게시글 얻어오기
		CommunityVO community = communityService.getOne(id);
		view.addObject("community", community);
		
		return view;
		
	}

	
	@RequestMapping("/read/{id}")
	public String incrementViewConuntFunc(@PathVariable int id) {
		if( communityService.incrementVC(id) ) {
			// 조회수 증가
			return "redirect:/view/"+ id ; 
		}
		return "redirect:/";
	}
	
/*	@RequestMapping("/read/{id}")
	public String viewReadPage(HttpSession session, @PathVariable int id) {
		
		if( session.getAttribute(Member.USER) == null ) {
			return "redirect:/login";
		}
		
		// 조회수 증가
		if ( communityService.incrementViewCount(id))
		
		
		return "redirect:/";
	}*/
	
	
	
	
	@RequestMapping("/recommend/{id}")
	public String recommendCount(@PathVariable int id) {
		communityService.incrementRC(id);
		
		//추천후 다시 돌아감
		return "redirect:/view/" + id;
	}
	
	@RequestMapping("/get/{id}")
	public void download(@PathVariable int id,
						 HttpServletRequest request,
						 HttpServletResponse response) {
		CommunityVO community = communityService.getOne(id);
		String filename = community.getDisplayFilename();
		
		DownloadUtil download = new DownloadUtil("d:/uploadFiles/"+ filename);
		
		try {
			download.download(request, response, filename);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
			//throw : 새로운 예외를 발생시켜 주는 것
		}
	}
	
	
	@RequestMapping("/delete/{id}")
	public String deletePage(@PathVariable int id, HttpSession session) { //이름 상관X. Dao, Service 이름 맞추기만 하면됨
	
		MemberVO member = (MemberVO) session.getAttribute(Member.USER); // session 쓰기위해 위의 ,HttpSession session 해줌
		CommunityVO community = communityService.getOne(id);
		
		boolean isMyCommunity = member.getId() == community.getUserId();
		
/*		if( isMyCommunity && communityService.deleteCommunity(id)) {
			return "redirect:/";
		}
		return"/WEB-INF/view/error/404";*/
		
		
		boolean isdelete =  communityService.removeCommunity(id);
		
		if ( isdelete ) {
			return "redirect:/";
		}
		return "redirect:/view/" + id;
	}
	
	@RequestMapping(value= "/modify/{id}", method = RequestMethod.GET)
	public ModelAndView viewModifyPage(@PathVariable int id, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		CommunityVO community = communityService.getOne(id);
		
		int userId = member.getId();
		
		if( userId != community.getUserId() ) {
			return new ModelAndView("/WEB-INF/view/error/404");
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("community/write");
		view.addObject("communityVO", community);
		view.addObject("mode", "modify");
		return view;
	}
	
	@RequestMapping(value="/modify/{id}", method = RequestMethod.POST)
	public String doModifyAction(@PathVariable int id, 
								 HttpSession session,
								 HttpServletRequest request,
								 @ModelAttribute("writeForm") @Valid CommunityVO communityVO, 
								 Errors errors){
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		CommunityVO originalVO = communityService.getOne(id);
		
		if ( member.getId() != originalVO.getUserId() ) {
			return "error/404";
		}
		
		if ( errors.hasErrors() ) {
			return "redirect:/modify/" + id;
		}
		
		CommunityVO newCommunity = new CommunityVO();
		newCommunity.setId( originalVO.getId() );
		newCommunity.setUserId( member.getId() );
		
		boolean isModify = false;
		
		// 1. IP 변경 확인
		String ip = request.getRemoteAddr();
		if ( !ip.equals( originalVO.getRequestIp() ) ) { //다르다면!
			newCommunity.setRequestIp(ip); //달라진 것만 넣어줌
			isModify = true;
		}
		
		
		// 2. 제목 변경확인
		if ( !originalVO.getTitle().equals( communityVO.getTitle() ) ) {
			newCommunity.setTitle( communityVO.getTitle() );
			isModify = true;
		}
		
		// 3. 내용 변경확인
		if ( !originalVO.getBody().equals( communityVO.getBody() ) ) {
			newCommunity.setBody( communityVO.getBody() );
			isModify = true;
		}
		
		// 4. 파일 변경확인
		
		if ( communityVO.getDisplayFilename().length() > 0 ) {
			File file =
					new File("d:/uploadFiles/" + communityVO.getDisplayFilename());
			file.delete();
			communityVO.setDisplayFilename("");
		}
		else {
			communityVO.setDisplayFilename( originalVO.getDisplayFilename());
		}
		
		
		communityVO.save();
		if ( !originalVO.getDisplayFilename().equals( communityVO.getDisplayFilename() ) ) {
			newCommunity.setDisplayFilename( communityVO.getDisplayFilename() );
			isModify = true;
		}
		
		// 5. 변경이 없는지 확인
		// isModify가 false이면 변경된게 하나도 없다는 뜻
		if ( isModify ) {
			//  6. UPDATE 하는 Service Code 호출
			communityService.updateCommunity(newCommunity);
		}
		
		return "redirect:/view/" + id;
	}
	
	
}
