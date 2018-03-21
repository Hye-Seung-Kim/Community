package com.ktds.community.dao;

import java.util.List;

import com.ktds.community.vo.CommunityVO;

public interface CommunityDao {

	public List<CommunityVO> selectAll();
	
	//하나만 가져오는, 한 개만 가지고 와라
	public CommunityVO selectOne(int id);
	
	public int selectMyCommunitiesCount(int userId);
	
	public List<CommunityVO> selectMyCommunities(int userId);
	
	public int insertCommunity(CommunityVO communityVO);
	
	public int incrementViewCount(int id);
	
	public int incrementRecommendCount(int id);
	
	public int deleteCommunity(int id);
	
	public int deleteCommunities(List<Integer> ids, int userId);
	
	public int deleteMyCommunities(int userId);
	
	public int updateCommunity(CommunityVO communityVO);
}
