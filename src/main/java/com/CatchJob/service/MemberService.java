package com.CatchJob.service;

import java.util.List;

import com.CatchJob.model.Member;

public interface MemberService {
	public List<Member> getAllMembers();

	public boolean login(String mId, String mPw);

	public Member getMemberById(String mId);

	public boolean join(Member member);

	public boolean updateMember(Member member);

}
