package com.hstravel.reply.service;

import java.util.List;

import com.hstravel.reply.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readAllReplies(int communityId);
	public ReplyVO readOneReply(int replyId);
	public boolean createReply(ReplyVO replyVO);
	
}
