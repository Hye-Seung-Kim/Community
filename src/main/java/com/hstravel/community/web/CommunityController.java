package com.hstravel.community.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hstravel.actionhistory.vo.ActionHistory;
import com.hstravel.actionhistory.vo.ActionHistoryVO;
import com.hstravel.community.service.CommunityService;
import com.hstravel.community.util.DownloadUtil;
import com.hstravel.community.vo.CommunitySearchVO;
import com.hstravel.community.vo.CommunityVO;
import com.hstravel.member.constants.Member;
import com.hstravel.member.vo.MemberVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class CommunityController {
 
	
	private CommunityService communityService;
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService; //=> 500에러로 이건 주석 처리.
	}
	
	@RequestMapping("/reset")
	public String viewInitListPage(HttpSession session) {
		session.removeAttribute("__SEARCH__");
		return "redirect:/list";
	}

	@RequestMapping("/")
	public ModelAndView list() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("community/main");
//		List<CommunityVO> imageList = communityService.readImages();
		List<CommunityVO> imageList = communityService.readImages();
		//List<Integer> imageList = communityService.readTop5();
		view.addObject("imageList", imageList);
		
		return view;
	}
	
	
	@RequestMapping("/list")
	public ModelAndView viewListPage(CommunitySearchVO communitySearchVO, HttpSession session) {
				if (communitySearchVO.getPageNo() < 0) {
					 communitySearchVO = (CommunitySearchVO) session.getAttribute("__SEARCH__");

					 if (communitySearchVO == null) {
						 communitySearchVO = new CommunitySearchVO();
						 communitySearchVO.setPageNo(0);
					 }
				}
				
				session.setAttribute("__SEARCH__", communitySearchVO);
	
		ModelAndView view = new ModelAndView();
		view.setViewName("community/list");
		
		PageExplorer pageExplorer = communityService.getAll(communitySearchVO);
		view.addObject("pageExplorer", pageExplorer);
		
		return view;
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String viewWritePage() {
		
		return "community/write";
	}
	
	
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
		
		
		String requestorIp = request.getRemoteAddr();
		communityVO.setRequestIp(requestorIp);
		 
		
		
		communityVO.save();
		
		boolean isSuccess = communityService.createCommunity(communityVO);
		
		if ( isSuccess ) {
			return new ModelAndView("redirect:/list");
		}
		
		return  new ModelAndView("redirect:/write");
		
	}

	
	@RequestMapping("/view/{id}")
	public ModelAndView viewViewPage(@PathVariable int id) {
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/community/view");
		
		CommunityVO community = communityService.getOne(id);
		view.addObject("community", community);
		
		return view;
		
	}

	
	@RequestMapping("/read/{id}")
	public String incrementViewConuntFunc(@PathVariable int id) {
		if( communityService.incrementVC(id) ) {
			return "redirect:/view/"+ id ; 
		}
		return "redirect:/list";
	}

	
	
	
	
	@RequestMapping("/recommend/{id}")
	public String recommendCount(@PathVariable int id,
			@RequestAttribute ActionHistoryVO actionHistory) {
		actionHistory.setReqType(ActionHistory.ReqType.COMMUNITY);
		String log = String.format(ActionHistory.Log.RECOMMEND, id);
		actionHistory.setLog(log);
		
		communityService.incrementRC(id);

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
		}
	}
	
	
	@RequestMapping("/delete/{id}")
	public String deletePage(@PathVariable int id, HttpSession session) {
	
		MemberVO member = (MemberVO) session.getAttribute(Member.USER); 
		CommunityVO community = communityService.getOne(id);
		
		boolean isMyCommunity = member.getId() == community.getUserId();
		

		
		boolean isdelete =  communityService.removeCommunity(id);
		
		if ( isdelete ) {
			return "redirect:/list";
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
								 Errors errors,
								 @SessionAttribute("__USER__") MemberVO member,
								 @RequestAttribute ActionHistoryVO actionHistory){
		
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
		
		String asIs = "";
		String toBe = "";
		
		
		String ip = request.getRemoteAddr();
		if ( !ip.equals( originalVO.getRequestIp() ) ) { 
			newCommunity.setRequestIp(ip); 
			isModify = true;
			asIs += "IP : " + originalVO.getRequestIp() + "<br/>";
			toBe += "IP : " + ip + "<br/>";
		}
		
		
		
		if ( !originalVO.getTitle().equals( communityVO.getTitle() ) ) {
			newCommunity.setTitle( communityVO.getTitle() );
			isModify = true;
			asIs += "Title : " + originalVO.getTitle() + "<br/>";
			toBe += "Title : " + communityVO.getTitle() + "<br/>";
 		}
		
		
		if ( !originalVO.getBody().equals( communityVO.getBody() ) ) {
			newCommunity.setBody( communityVO.getBody() );
			isModify = true;
			asIs += "Body : " + originalVO.getBody() + "<br/>";
			toBe += "Body : " + communityVO.getBody() + "<br/>";
		}
		
		
		
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
			asIs += "File : " + originalVO.getDisplayFilename() + "<br/>";
			toBe += "File : " + communityVO.getDisplayFilename() + "<br/>";
		}
		
		actionHistory.setReqType(ActionHistory.ReqType.COMMUNITY);
		String log = String.format(ActionHistory.Log.UPDATE, 
				originalVO.getTitle(),
				originalVO.getBody());
		actionHistory.setLog(log);
		actionHistory.setAsIs(asIs);
		actionHistory.setToBe(toBe);
	
		
		if ( isModify ) {
			
			communityService.updateCommunity(newCommunity);
		}
		
		return "redirect:/view/" + id;
	}
	

	
}
