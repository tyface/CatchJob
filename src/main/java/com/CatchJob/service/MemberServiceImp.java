package com.CatchJob.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<Member> getAllMembers() {
		return memberDao.selectAll();
	}

	@Override
	public boolean login(String mberId, String mberPw) {
		Member member = memberDao.selectById(Constants.Member.MBERID);
		/*// 탈퇴회원 경우 로그인 금지
		if (member.getMberFlag().equals("2")) {
			return false;
		}*/
		System.out.println("1");
		if (member != null) {
			// 아이디 있음
			System.out.println("2");
			if (member.getMberPw().equals(Constants.Member.MBERPW)) {
				// 방문일 갱신
				System.out.println("3");
				Date date = new Date();
				member.setLastDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(date));
				memberDao.updateLastDate(member);
				System.out.println("4");
				return true;
			} else {
				return false;
			}
		} else {
			// 아이디 없음 : 로그인 실패
			System.out.println("5");
			return false;
		}
	}

	@Override
	public Member getMemberById(String mberId) {
		return memberDao.selectById(Constants.Member.MBERID);
	}

	@Override
	public boolean join(Member member) {
		int rowCount = memberDao.insertOne(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteMember(Member member) {
		// 회원탈퇴
		member.setMberFlag("2");
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

	@Override
	public Member selectMember(int mberIndex) {
		return memberDao.selectOne(mberIndex);
	}

}
