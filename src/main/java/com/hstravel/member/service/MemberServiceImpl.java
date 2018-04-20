package com.hstravel.member.service;

import com.hstravel.community.dao.CommunityDao;
import com.hstravel.member.dao.MemberDao;
import com.hstravel.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	private CommunityDao communityDao;
	
	public CommunityDao getCommunityDao() {
		return communityDao;
	}

	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public boolean createMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO) > 0;
	}

	@Override
	public MemberVO readMember(MemberVO memberVO) {
	      
	    return memberDao.selectMember(memberVO);
	 }

	 @Override
	 public boolean removeMember(int id, String deleteFlag) {
	      
	    if( deleteFlag.equals("y")) {
	         
	    	communityDao.deleteMyCommunities(id);
	     }
	    return memberDao.deleteMember(id) > 0;
	      
	 }

	@Override
	public boolean readCountMemberEmail(String email) {
		return memberDao.selectCountMemberEmail(email) > 0;
	}

	@Override
	public boolean readCountMemberNickname(String nickname) {
		return memberDao.selectCountMemberNickname(nickname) > 0;
	}
	
}

