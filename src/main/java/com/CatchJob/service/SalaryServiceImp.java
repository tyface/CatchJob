package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.SalaryDao;

@Service
public class SalaryServiceImp implements SalaryService {

	@Autowired
	SalaryDao salaryDao;

	@Override
	public List<Map<String, String>> getSalayRankList() {
		return salaryDao.selectListSalayRank(Constants.Config.RANK_VIEW_COUNT);
	}

}
