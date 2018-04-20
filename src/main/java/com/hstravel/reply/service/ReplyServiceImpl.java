package com.hstravel.reply.service;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.hstravel.reply.dao.ReplyDao;
import com.hstravel.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	
	private ReplyDao replyDao;
	
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public List<ReplyVO> readAllReplies(int communityId) {
		return replyDao.selectAllReplies(communityId);
	}
	
	@Override
	public ReplyVO readOneReply(int replyId) {
		return replyDao.selectOneReply(replyId);
	}

	@Override
	public boolean createReply(ReplyVO replyVO) {
		return replyDao.insertReply(replyVO) > 0;
	}
}
