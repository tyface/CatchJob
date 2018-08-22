package com.CatchJob.service;

import java.util.List;

import com.CatchJob.model.UniversalDomain;

public interface UniversalDomainService {
	
	public List<UniversalDomain> getAllUniDomains();
	
	public UniversalDomain findUniDomain(String domain);
}
