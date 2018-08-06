package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.RecodeDao;

@Service
public class RecordServiceImp implements RecordService {

	@Autowired
	RecodeDao recordDao;

	@Override
	public boolean regViewRecord(Map<String, String> mapData) {

		if (recordDao.insertViewRecode(mapData) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Map<String, String>> getPopularSearcheList() {
		return recordDao.selectListPopularSearches(Constants.Config.RANK_VIEW_COUNT);
	}

}
