package com.CatchJob.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		return memberDao.selectAll();
	}

	@Override
	public boolean login(String mberId, String mberPw) {
		
		
		/*// 탈퇴회원 경우 로그인 금지
		if (member.getMberFlag().equals("2")) {
			return false;
		}*/
		System.out.println("13213123");
	
		Member member = memberDao.selectById(mberId);
		System.out.println("member:"+member);
		if (member != null) {
			// 아이디 있음
			System.out.println("2");
			if (member.getMberPw().equals(mberPw)) {
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
			System.out.println("531232131");
			System.out.println("서비스 진입");
			return false;
		}
	}

	@Override
	public Member getMemberById(String mberId) {
		return memberDao.selectById(mberId);
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
