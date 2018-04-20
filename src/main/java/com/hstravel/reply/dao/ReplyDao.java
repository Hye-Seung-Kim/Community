package com.hstravel.reply.dao;

import java.util.List;

import com.hstravel.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public List<ReplyVO> selectAllReplies(int communityId);
	
	// reply 1개 불러오기
	public ReplyVO selectOneReply(int replyId);
	
	public int insertReply(ReplyVO replyVO);

	
}
