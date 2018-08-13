package com.CatchJob.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;
import com.sun.javafx.css.CssError.StringParsingError;

import jdk.nashorn.internal.parser.Parser;

@Service
public class MemberServiceImp implements MemberService {
	
	private static final int NUM_OF_NAVI_PAGE = 5;

	
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
	
	/* 페이징 처리 */
	public Map<String, Object> getMessageList(int pageNumber, int numOfMsgPage) {
		Map<String, Object> viewData = new HashMap<String,Object>();
	
		int totalCount = 0;  	
		totalCount  = memberDao.selectCount(); 		
		int firstRow = 0;
		int endRow =0;
		firstRow = (pageNumber-1)*numOfMsgPage +1;
		endRow = pageNumber*numOfMsgPage;
		
		Map<String, String> map = new HashMap<>();
		map.put("firstRow", String.valueOf(firstRow));
		map.put("endRow",  String.valueOf(endRow));
		
		viewData.put("currentPage", pageNumber);
		viewData.put("boardList", memberDao.selectListMember(map));
		viewData.put("pageTotalCount", calPageTotalCount(totalCount, numOfMsgPage));
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);
		return viewData;
	}

	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
		int pageTotalCount = 0;
		if (totalCount != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
		}
		return pageTotalCount;
	}

	public int getStartPage(int pageNum) {
		int startPage = ((pageNum - 1) / NUM_OF_NAVI_PAGE) * NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}

	public int getEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / NUM_OF_NAVI_PAGE) + 1) * NUM_OF_NAVI_PAGE;
		return endPage;
	}

	
	
}
