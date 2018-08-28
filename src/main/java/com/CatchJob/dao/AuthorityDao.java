package com.CatchJob.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityDao {
	//멤버아이디 입력 시 권한 리스트 반환
	public List<String> selectUserAuthorities(String mberid);
}
