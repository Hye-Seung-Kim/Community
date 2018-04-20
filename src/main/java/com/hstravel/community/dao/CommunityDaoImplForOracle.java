package com.hstravel.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hstravel.community.vo.CommunitySearchVO;
import com.hstravel.community.vo.CommunityVO;

public class CommunityDaoImplForOracle extends SqlSessionDaoSupport implements CommunityDao {

	
	@Override
	public int selectCountAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectOne("CommunityDao.selectCountAll", communitySearchVO);
	}
	
	@Override
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectList("CommunityDao.selectAll", communitySearchVO);
	}

	@Override
	public CommunityVO selectOne(int id) {
		return getSqlSession().selectOne("CommunityDao.selectOne", id);
	}

	@Override
	public int insertCommunity(CommunityVO communityVO) {
		return getSqlSession().insert("CommunityDao.insertCommunity", communityVO);
	}

	@Override
	public int incrementViewCount(int id) {
		return getSqlSession().update("CommunityDao.incrementViewCount", id);
	}

	@Override
	public int incrementRecommendCount(int id) {
		return getSqlSession().update("CommunityDao.incrementRecommendCount", id);
	}

	@Override
	public int deleteCommunity(int id) {
		return getSqlSession().delete("CommunityDao.deleteCommunity", id);//인터페이스 이름.현재메소드
	}

	
	@Override
	public int deleteCommunities(List<Integer> ids, int userId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", ids);
		params.put("userId", userId);
		
		return getSqlSession().delete("CommunityDao.deleteCommunities", params);
	}

	@Override
	public int updateCommunity(CommunityVO communityVO) {
		return getSqlSession().update("CommunityDao.updateCommunity", communityVO);
	}

	@Override
	public int selectMyCommunitiesCount(int userId) {
		return getSqlSession().selectOne("CommunityDao.selectMyCommunitiesCount", userId);
	}

	@Override
	public List<CommunityVO> selectMyCommunities(int userId) {
		return getSqlSession().selectList("CommunityDao.selectMyCommunities", userId);
	}

	@Override
	public int deleteMyCommunities(int userId) {
		return getSqlSession().delete("CommunityDao.deleteCommunity", userId);
	}

	@Override
	public List<CommunityVO> selectImages() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("CommunityDao.selectImages");
	}

	@Override
	public List<Integer> selectTop5() {
		return getSqlSession().selectList("CommunityDao.selectTop5");
	}
	
	
	
}
