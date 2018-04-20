package com.hstravel.member.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hstravel.community.service.CommunityService;
import com.hstravel.community.vo.CommunityVO;
import com.hstravel.member.constants.Member;
import com.hstravel.member.service.MemberService;
import com.hstravel.member.vo.MemberVO;

@Controller
public class MypageController {
	
	private MemberService memberService;
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	private CommunityService communityService;
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	@RequestMapping("/mypage/communities")
	public ModelAndView viewMyCommunities(HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		List<CommunityVO> myCommunities = 
				communityService.readMyCommunities(member.getId());
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/mypage/myCommunities");
		view.addObject("myCommunities", myCommunities);
		
		return view;
		
	}
	
	
	@RequestMapping("/mypage/communities/delete")
	public String doDeleteMyCommunitiesAction(
			HttpSession session, @RequestParam List<Integer> delete) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		communityService.deleteCommunities(delete, member.getId());
		/*for( int index : delete ) {
			System.out.println(index);
		}
		*/
		
		return "redirect:/mypage/communities";
	}
	
}
