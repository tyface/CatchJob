package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Admin;
import com.CatchJob.model.Member;

@Repository
public interface AdminDao {
	// admin 수정
	public int updateOne(Admin admin);
	
	// admin 찾기
	public Admin selectOne(int adminIndex);

	// admin 아이디 찾기
	public Admin selectById(String adminId);	
	
	//페이징 처리
	public int selectCount();
	public List<Admin> selectListAdmin(Map<String, String> map);
	
	public List<Admin> selectListAdminByKeyword(Map<String, String> map);
	
}
