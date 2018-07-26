package com.CatchJob.dao;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.CatchJob.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface MemberDao {

	public int insertOne(Member member);

	public int updateOne(Member member);

	public Member selectOne(int mIndex);

	public List<Member> selectAll();

	public String selectLastDate(int mIndex);
	
	public void updateLastDate(Member member);
	
	public Member selectById(String mId);
}
