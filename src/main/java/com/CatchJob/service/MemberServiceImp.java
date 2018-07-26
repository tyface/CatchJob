package com.CatchJob.service;

import java.util.List;

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
		// 탈퇴회원인 경우 로그인 금지
		if (member.getMberFlag().equals("2")) {
			return false;
		}

		if (member != null) {
			if (member.getMberPw().equals(Constants.Member.MBERID)) {
				//방문일 갱신
			/*	Date date = new Date(); 
				member.setLastDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(date));
				memberDao.updateLastDate(member); */
				return true;
			} else {
				return false;
			}
		}
		return false; 
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

	@Override
	public boolean updateMember(Member member) {
		// 회원 탈퇴
		if (member.getMberFlag().equals("2")) {
			return true;
		}
		
		//회원 수정
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