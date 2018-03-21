package com.ktds.community.service;

import java.util.List;

import com.ktds.community.vo.CommunityVO;

public interface CommunityService {

	public List<CommunityVO> getAll();
	
	public CommunityVO getOne(int id);
	
	public int readMyCommunitiesCount(int userId);
	
	public List<CommunityVO> readMyCommunities(int userId);
	
	public boolean createCommunity(CommunityVO communityVO);

	public boolean deleteCommunities(List<Integer> ids, int userId);
	
	//public boolean incrementViewCount(int id);
	
	public boolean incrementVC(int id);
	
	public void incrementRC(int id);

	public boolean removeCommunity(int id);
	
	public boolean updateCommunity(CommunityVO communityVO);
}

