package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Admin;

@Repository
public interface AdminDao {
	// admin 수정
	public int updateOne(Admin admin);
	
	// admin 찾기
	public Admin selectOne(int adminIndex);

	// admin 리스트 출력
	public List<Admin> selectListAdmin(Map<String, String> map);
	
	// admin 아이디 찾기
	public Admin selectById(String adminId);	
}
