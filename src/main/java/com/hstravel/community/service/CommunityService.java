package com.hstravel.community.service;

import java.util.List;

import com.hstravel.community.vo.CommunitySearchVO;
import com.hstravel.community.vo.CommunityVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface CommunityService {

	public PageExplorer getAll(CommunitySearchVO communitySearchVO);
	
	public CommunityVO getOne(int id);
	
	public List<CommunityVO> readImages();
	
	public int readMyCommunitiesCount(int userId);
	
	public List<CommunityVO> readMyCommunities(int userId);
	
	public boolean createCommunity(CommunityVO communityVO);

	public boolean deleteCommunities(List<Integer> ids, int userId);
	
	//public boolean incrementViewCount(int id);
	
	public boolean incrementVC(int id);
	
	public void incrementRC(int id);

	public boolean removeCommunity(int id);
	
	public boolean updateCommunity(CommunityVO communityVO);
	
	public List<Integer> readTop5();
}

