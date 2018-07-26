package com.CatchJob.service;

import java.util.List;

import com.CatchJob.model.Member;

public interface MemberService {

	public List<Member> getAllMembers();
	
	public Member selectMember(int mberIndex);
	
	public boolean login(String mberId, String mberPw);

	public Member getMemberById(String mberId);

	public boolean join(Member member);
	//회원탈퇴, 수정
	public boolean updateMember(Member member);

}
