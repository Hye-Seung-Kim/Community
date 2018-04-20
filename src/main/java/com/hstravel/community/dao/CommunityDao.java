package com.hstravel.community.dao;

import java.util.List;

import com.hstravel.community.vo.CommunitySearchVO;
import com.hstravel.community.vo.CommunityVO;

public interface CommunityDao {

	public int selectCountAll(CommunitySearchVO communitySearchVO);
	
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO);
	
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

	public List<CommunityVO> selectImages();
	
	public List<Integer> selectTop5();
}
