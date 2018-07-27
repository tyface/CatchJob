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

	public int deleteOne(int mIndex);

	public Member selectOne(int mIndex);

	public List<Member> selectAll();

	public void updateLastDate();

	public Member selectById(String mId);

	public int updateUserFlag(Member member);

}
