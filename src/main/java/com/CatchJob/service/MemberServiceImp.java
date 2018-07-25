package com.CatchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<Member> getAllMembers() {
		// 멤버 전체 출력
		return memberDao.selectAll();
	}

	@Override
	public boolean login(String mId, String mPw) {
		Member member = memberDao.selectById(mId);
		// 탈퇴회원 경우 로그인 금지
		if (member.getUserFlag().equals("탈퇴")) {
			return false;
		}

		if (member != null) {
			// 아이디 있음
			if (member.getmPw().equals(mPw)) {
				// 방문일 갱신
				memberDao.updateLastDate();
				return true;
			} else {
				return false;
			}
		} else {
			// 아이디 없음 : 로그인 실패
			return false;
		}
	}

	@Override
	public Member getMemberById(String mId) {
		// 멤버 하나 출력

		return memberDao.selectById(mId);
	}

	@Override
	public boolean join(Member member) {
		// 회원가입
		int rowCount = memberDao.insertOne(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteMember(Member member) {
		// 회원탈퇴
		member.setUserFlag("탈퇴");
		int rowCount = memberDao.updateOne(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateMember(Member member) {
		// 회원 수정
		int rowCount = memberDao.updateOne(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

}
