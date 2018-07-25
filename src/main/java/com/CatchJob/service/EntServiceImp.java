package com.CatchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.EntDao;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.NationalPension;

@Service
public class EntServiceImp implements EntService {

	@Autowired
	private EntDao dao;

	@Override
	public List<Enterprise> searchEntList(String entName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Enterprise selectEnt(int entIndex) {
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
