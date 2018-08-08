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

	// 회원 찾기
	public Member selectOne(int mberIndex);

	// 회원 리스트 출력(페이지 번호를 부여해서 페이지당 Member를 출력하는 용도)
	public List<Member> selectListMember(Map<String, String> map);
	
	// 회원 리스트 출력(임시)
	public List<Member> selectListMemberTemp();
	
	// 회원 아이디 찾기
	public Member selectById(String mberId);

}
