package com.hstravel.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hstravel.member.vo.MemberVO;

public class MemberDaoImplForOracle 
				extends SqlSessionDaoSupport
				implements MemberDao{

	
	public int insertMember(MemberVO memberVO) {
		
		return getSqlSession().insert("MemberDao.insertMember", memberVO);
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectMember", memberVO);
	}

	@Override
	public int deleteMember(int id) {
		return getSqlSession().delete("MemberDao.deleteMember", id);
	}

	@Override
	public int selectCountMemberEmail(String email) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberEmail", email);
	}

	@Override
	public int selectCountMemberNickname(String nickname) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberNickname", nickname );
	}
}
