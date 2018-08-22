package com.CatchJob.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.UniversalDomain;

@Repository
public interface UniversalDomainDao {
	
	public List<UniversalDomain> selectListAll();
	
	public UniversalDomain selectDomain(String domain);
}
