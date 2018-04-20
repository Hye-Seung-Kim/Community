package com.hstravel.actionhistory.dao;

import java.util.List;

import com.hstravel.actionhistory.vo.ActionHistorySearchVO;
import com.hstravel.actionhistory.vo.ActionHistoryVO;

public interface ActionHistoryDao {
	
	public int insertActionHistory(ActionHistoryVO actionHistoryVO);
	
	public int selectAllActionHistoryCount(ActionHistorySearchVO actionHistorySearchVO);
	
	public List<ActionHistoryVO>  selectAllActionHistory(ActionHistorySearchVO actionHistorySearchVO);
	
}
