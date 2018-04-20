package com.hstravel.actionhistory.service;

import com.hstravel.actionhistory.vo.ActionHistorySearchVO;
import com.hstravel.actionhistory.vo.ActionHistoryVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface ActionHistoryService {
	
	public boolean createActionHistory(ActionHistoryVO actionHistoryVO);
	
	public PageExplorer readAllActionHistory(ActionHistorySearchVO actionHistorySearchVO);
	
	
}
