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

	// 회원 찾기
	public Member selectOne(int mberIndex);

	// 회원 아이디 찾기
	public Member selectById(String mberId);
	
	//api 인증 아이디 찾기
	public Member selectOauthId(Map<String, String> mapData);
	
	//페이징 처리
	public int selectCount();
	
	public List<Member> selectListMember(Map<String, String> mapData);
	//검색
	public List<Member> selectListMemberByKeyword(Map<String, String> map);
	
}
