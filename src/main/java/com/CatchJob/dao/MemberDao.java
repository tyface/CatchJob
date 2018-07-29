package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Member;

@Repository
public interface MemberDao {

	// 회원 추가
	public int insertMember(Member member);

	// 회원 수정
	public int updateMember(Member member);

	// 회원 삭제
	//public int deleteMember(int mberIndex); 사용안함

	// 회원 찾기
	public Member selectOne(int mberIndex);

	// 회원 리스트 출력
	public List<Member> selectListMember(Map<String, String> map);
	
	// 회원 아이디 찾기
	public Member selectById(String mberId);

}
