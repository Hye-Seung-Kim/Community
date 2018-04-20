package com.hstravel.member.service;

import com.hstravel.member.vo.MemberVO;

public interface MemberService {
	public boolean createMember(MemberVO member);
	public MemberVO readMember(MemberVO member);
	public boolean removeMember(int id, String deleteFlag);
	public boolean readCountMemberEmail(String email);
	public boolean readCountMemberNickname(String nickname);
}
