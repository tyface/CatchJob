package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.AdminDao;
import com.CatchJob.model.Admin;

@Service
public class AdminServiceImp implements AdminService {
	@Autowired
	AdminDao adminDao;

	@Override
	public List<Admin> getListAdmins(Map<String, String> map) {
		return adminDao.selectListAdmin(map);
	}

	@Override
	public Admin getAdmin(int adminIndex) {
		return adminDao.selectOne(adminIndex);
	}

	@Override
	public boolean login(String adminId, String adminPw) {
		Admin admin = adminDao.selectById(adminId);
		if (admin != null) {
			if (admin.getAdminPw().equals(adminPw)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public Admin getAdminById(String adminId) {
		return adminDao.selectById(adminId);
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		// Admin 수정
		int rowCount = adminDao.updateOne(admin);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	

}
