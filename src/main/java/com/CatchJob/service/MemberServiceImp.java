package com.CatchJob.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<Member> getListMembers(Map<String, String> map) {
		return memberDao.selectListMember(map);
	}

	@Override
	public boolean login(String mberId, String mberPw) {
		Member member = memberDao.selectById(mberId);
		//탈퇴회원 경우 로그인 금지
		if (member.getMberFlag().equals("2")) {
			return false;
		}
		
		if (member != null) {
			if (member.getMberPw().equals(mberPw)) {
				// 방문일 갱신
				Date date = new Date();
				member.setLastDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(date));
				memberDao.updateMember(member);
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public boolean join(Member member) {
		int rowCount = memberDao.insertMember(member);
		if (rowCount > 0) {
			return true;
		} else {
			//"이미 가입된 이메일입니다"	
			return false;
		}
	}

	public boolean deleteMember(Member member) {
		// 회원탈퇴
		member.setMberFlag("2");
		int rowCount = memberDao.updateMember(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateMember(Member member) {
		// 회원 수정
		int rowCount = memberDao.updateMember(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Member getMember(int mberIndex) {
		return memberDao.selectOne(mberIndex);
	}

	@Override
	public Member getMemberById(String mberId) {
		return memberDao.selectById(mberId);				
	}

}
