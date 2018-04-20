package com.hstravel.member.dao;

import com.hstravel.member.vo.MemberVO;

public interface MemberDao {
	
		public int insertMember(MemberVO memberVO);
		
		public MemberVO selectMember(MemberVO memberVO);
		
		public int deleteMember(int id);
		
		public int selectCountMemberEmail(String email);
		
		public int selectCountMemberNickname(String nickname);
		
}
