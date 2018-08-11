package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Admin;

public interface AdminService {
	
	public List<Admin> getListAdmins(Map<String, String> map);
	public Admin getAdmin(int adminIndex);
	public boolean login(String adminId, String adminPw);
	public Admin getAdminById(String adminId);
	public boolean updateAdmin(Admin admin);

}
