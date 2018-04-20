package com.hstravel.reply.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hstravel.reply.vo.ReplyVO;


public class ReplyDaoImpForOracle extends SqlSessionDaoSupport implements ReplyDao{

	public List<ReplyVO> selectAllReplies(int communityId) {
		return getSqlSession().selectList("ReplyDao.selectAllReplies", communityId);
	}

	@Override
	public ReplyVO selectOneReply(int replyId) {
		return getSqlSession().selectOne("ReplyDao.selectOneReply", replyId);
	}
	
	public int insertReply(ReplyVO replyVO) {
		int sequence = getSqlSession().selectOne("ReplyDao.nextValue");
		replyVO.setId(sequence);
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

}
