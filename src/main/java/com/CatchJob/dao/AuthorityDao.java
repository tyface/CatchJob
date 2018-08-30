package com.CatchJob.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityDao {
	//멤버아이디 입력 시 권한 리스트 반환 TODO 사용안함
//	public List<String> selectUserAuthorities(String mberId);
	
	//멤버아이디 입력 시 권한 반환 TODO 차후 수정 보완 해야함
	public String selectMemberType(String mberId);
	//기업인증 시 권한 추가
	public int updateAuthority(Map<String, Object> data);
	//회원가입 시 ROLE_USER 부여
	public void insertAuthority(Map<String, Object> data);
}
