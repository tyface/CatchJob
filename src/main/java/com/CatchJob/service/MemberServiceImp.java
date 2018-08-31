package com.CatchJob.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.AuthorityDao;
import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;

@Service
public class MemberServiceImp implements MemberService {
		
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AuthorityDao authDao;
/*	사용안함
	@Override
	public List<Member> getListMembers(Map<String, String> map) {
		return memberDao.selectListMember(map);
	}*/

	@Override
	public boolean login(String mberId, String mberPw) {
		Member member = memberDao.selectById(mberId);
		boolean result = false;

		if (member == null || member.getMberFlag().equals("2")) {//탈퇴회원 경우 로그인 금지
			result = false;
		} else if(member.getMberPw().equals(mberPw)){
			visitUpdate(member.getMberIndex()); //마지막 방문날짜 업데이트
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean join(Member member) {
		int rowCount = memberDao.insertMember(member);
		Map<String, Object> data=new HashMap<>();
		data.put("mberIndex", member.getMberIndex());
		data.put("mberId", member.getMberId());
		authDao.insertAuthority(data);
		
		if (rowCount > 0) {
			return true;
		} else {
			//"이미 가입된 이메일입니다"	
			return false;
		}
	}
	
	@Override
	public boolean modify(Member member) {
		int rowCount = memberDao.updateMember(member);
		
		if (rowCount > 0) {		
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean memberTypeModify(Member member) {
		int rowCount = memberDao.updateMemberType(member);
		
		if (rowCount > 0) {		
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean passwordModify(Member member) {
		int rowCount = memberDao.updateMemberPassword(member);
		
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean visitUpdate(int memberIndex) {
		int rowCount = memberDao.updateLastDate(memberIndex);
		
		if (rowCount > 0) {
			return true;
		} else {
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
	public boolean socialJoin(Member member) {
		int result = memberDao.updateOauthId(member);
		if (result > 0) {
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
	
	@Override
	public Member getMemberByOauthId(String mberId ,String oauthId) {
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("mberId", mberId);
		mapData.put("oauthId", oauthId);
		return memberDao.selectByOauthId(mapData);				
	}
	
	/* 페이징 처리 */
	public Map<String, Object> getMemberMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
		
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("keyword", keyword);
			totalCount  = memberDao.selectMemberCount(keyword); 
		} else {
			map.put("keyword", "");
			totalCount  = memberDao.selectMemberCount(""); 
		}		
		if(totalCount==0) {
			totalCount = 1;
		}
		int numOfMsgPage = (int) data.get("numOfMsgPage");
		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
		int pageNumber = (int) data.get("pageNumber");
	
		if(pageNumber > pageTotalCount) {
			pageNumber = pageTotalCount;
		}

		int startRow = numOfMsgPage * ( pageNumber - 1 ) ;
		map.put("NUM_OF_MSG_PER_PAGE", numOfMsgPage);
		map.put("START_ROW", startRow);
	

		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", memberDao.selectMemberList(map));
		System.out.println(memberDao.selectMemberList(map));
		return viewData;
	}
	
	public Map<String, Object> getAdminMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
		
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("keyword", keyword);
			totalCount  = memberDao.selectAdminCount(keyword); 
		} else {
			map.put("keyword", "");
			totalCount  = memberDao.selectAdminCount(""); 
		}		
		if(totalCount==0) {
			totalCount = 1;
		}
		int numOfMsgPage = (int) data.get("numOfMsgPage");
		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
		int pageNumber = (int) data.get("pageNumber");
	
		if(pageNumber > pageTotalCount) {
			pageNumber = pageTotalCount;
		}

		int startRow = numOfMsgPage * ( pageNumber - 1 ) ;
		map.put("NUM_OF_MSG_PER_PAGE", numOfMsgPage);
		map.put("START_ROW", startRow);
	

		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", memberDao.selectAdminList(map));
		System.out.println(memberDao.selectAdminList(map));
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
		int startPage = ((pageNum - 1) / Constants.Admin.NUM_OF_NAVI_PAGE) * Constants.Admin.NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}

	public int getEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / Constants.Admin.NUM_OF_NAVI_PAGE) + 1) * Constants.Admin.NUM_OF_NAVI_PAGE;
		return endPage;
	}


	
}
