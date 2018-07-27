package com.CatchJob.dao;

import java.util.List;

import com.CatchJob.model.Member;

public interface MemberDao {

	public int insertOne(Member member);

	public int updateOne(Member member);

	public int deleteOne(int mIndex);

	public Member selectOne(int mIndex);

	public List<Member> selectAll();
	//마지막 방문일 
	public String selectLastDate(int mIndex);
	public void updateLastDate(Member member);

	public Member selectById(String mberId);

}
