package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.EnterpriseDao;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.NationalPension;

@Service
public class EnterpriseServiceImp implements EnterpriseService {


	@Autowired
	private EnterpriseDao entDao;
	
	@Override
	public List<Enterprise> searchEntList(Map<String, String> data) {
		return entDao.selectListEnt(data);
	}

	@Override
	public Enterprise getEntInfo(int entIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NationalPension empCountGraph(int entIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NationalPension avgPayGraph(int entIndex) {
		// TODO Auto-generated method stub
		return null;
	}



}
