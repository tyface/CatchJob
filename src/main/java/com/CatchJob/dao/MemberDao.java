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
	
	// 기존회원 소셜API연동 가입
	public int updateOauthId(Member member);
	
	// 기존회원 소셜API연동 가입
	public int updateMemberType(Member member);
		
	// 최근방문일 수정
	public int updateLastDate(int mberIndex);
	
	//비밀번호 수정
	public int updateMemberPassword(Member member);
	
	// 회원 찾기
	public Member selectOne(int mberIndex);

	// 회원 아이디 찾기
	public Member selectById(String mberId);
	
	//api 인증 아이디 찾기
	public Member selectByOauthId(Map<String, String> mapData);
	
	//페이징 처리
	public int selectMemberCount(String keyword);
	
	public int selectAdminCount(String keyword);
	
	public List<Member> selectList(Map<String, Object> map);
	
	
}
