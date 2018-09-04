package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.UniversalDomain;

public interface UniversalDomainService {

	public boolean registDomain(UniversalDomain domain);

	public boolean modifyDomain(UniversalDomain domain);

	public UniversalDomain findUniDomain(String domainIndex);

	public boolean deleteDomain(int domainIndex);

	public List<UniversalDomain> getAllUniDomains();
	//페이징
	public Map<String, Object> getMessageList(Map<String, Object> data);

	public int calPageTotalCount(int totalCount, int numOfMsgPage);

	public int getStartPage(int pageNum);

	public int getEndPage(int pageNum);

}
