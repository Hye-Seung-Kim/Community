package com.hstravel.community.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.hstravel.community.dao.CommunityDao;
import com.hstravel.community.vo.CommunitySearchVO;
import com.hstravel.community.vo.CommunityVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

public class CommunityServiceImpl implements CommunityService {

	private CommunityDao communityDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	@Override
	public PageExplorer getAll(CommunitySearchVO communitySearchVO) {
		
		Pager pager = PagerFactory.getPager(Pager.ORACLE, 
											communitySearchVO.getPageNo() + "", 
											communityDao.selectCountAll(communitySearchVO));
		PageExplorer pageExplorer = pager.makePageExplorer(
							ClassicPageExplorer.class, communitySearchVO);
		
		pageExplorer.setList( communityDao.selectAll(communitySearchVO) );
		
		return pageExplorer;
	}
	
	@Override
	public boolean createCommunity(CommunityVO communityVO) {

		String body = communityVO.getBody();
		// \n --> <br/>
		body = body.replace("\n", "<br/>"); //body에서 고쳐라 하는 부분
		communityVO.setBody(body); //기능을 한 후 다시 넣어줄것
		
		int insertCount = communityDao.insertCommunity(communityVO);
		return insertCount > 0;
	}

	@Override
	public CommunityVO getOne(int id) {
		
		//if ( communityDao.incrementViewCount(id) > 0 ) {
			return communityDao.selectOne(id);
		//}
		//return null;
	}

	@Override
	public boolean incrementVC(int id) {
		return communityDao.incrementViewCount(id) > 0;
		
	}

	@Override
	public void incrementRC(int id) {
		
		communityDao.incrementRecommendCount(id);
		
	}

	@Override
	public boolean removeCommunity(int id) {
		return communityDao.deleteCommunity(id) > 0;
		
	}

	@Override
	public boolean updateCommunity(CommunityVO communityVO) {
		return communityDao.updateCommunity(communityVO) > 0;
	}

	@Override
	public int readMyCommunitiesCount(int userId) {
		return communityDao.selectMyCommunitiesCount(userId);
	}

	@Override
	public List<CommunityVO> readMyCommunities(int userId) {
		return communityDao.selectMyCommunities(userId);
	}

	

	@Override
	public boolean deleteCommunities(List<Integer> ids, int userId) {
		
		return communityDao.deleteCommunities(ids, userId) > 0;
	}

	@Override
	public List<CommunityVO> readImages() {
		// TODO Auto-generated method stub
		return communityDao.selectImages();
	}

	@Override
	public List<Integer> readTop5() {
		return communityDao.selectTop5();
	}

	
	
	
	
	
	/*//금지어 지정
	public boolean filter(String str) {
		
		List<String> blackList = new ArrayList<String>();
		blackList.add("욕");
		blackList.add("씨");
		blackList.add("발");
		blackList.add("1식");
		blackList.add("종간나세끼");
		blackList.add("2식");
		
		// str ==> 남편은 2식이에요.
		//String[] splitString = str.split(" ");
		
		//for ( String word : splitString ) {
			
			for ( String blackString : blackList ) {
				if ( blackString.contains(word) ) {
					return true;
				}
			}
			
		//}
		
		return false;
		
	}*/
	
	
}
