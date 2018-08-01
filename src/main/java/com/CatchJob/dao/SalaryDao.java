package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface SalaryDao {
	
	public List<Map<String,String>> selectListSalayRank(int viewCount);
}
