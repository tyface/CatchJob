package com.CatchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.UniversalDomainDao;
import com.CatchJob.model.UniversalDomain;

@Service
public class UniversalDomainServiceImp implements UniversalDomainService{
	
	@Autowired
	UniversalDomainDao domainDao;
	
	@Override
	public List<UniversalDomain> getAllUniDomains(){
		return domainDao.selectListAll();
	};
	
	public UniversalDomain findUniDomain(String domain){
		return domainDao.selectDomain(domain);
	};
	
}
