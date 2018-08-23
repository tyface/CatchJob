package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.UniversalDomain;

@Repository
public interface UniversalDomainDao {
	
	public int insertDomain(UniversalDomain domain);

	public int updateDomain(UniversalDomain domain);

	public int deleteDomain(int domainIndex);	
	
	public List<UniversalDomain> selectListAll();
	
	public UniversalDomain selectDomain(String domain);
	
	public List<UniversalDomain> selectListDomain(Map<String, String> map);
	 
	public int selectCount(String keyword);
	
}
