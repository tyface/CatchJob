//package com.CatchJob.service;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.CatchJob.commons.Constants;
//import com.CatchJob.dao.MemberDao;
//import com.CatchJob.model.Admin;
//import com.CatchJob.model.Member;
//
//@Service
//public class AdminServiceImp implements AdminService {	
//	@Autowired
//	MemberDao memberDao;
//
//
//	
//	/* 페이징 처리 */
//	public Map<String, Object> getMessageList(Map<String, Object> data) {
//		Map<String, Object> viewData = new HashMap<String,Object>();
//		int totalCount = 0;  	
//		Map<String, Object> map = new HashMap<>();
//		
//		/* 검색 키워드 존재 시*/
//		if(data.get("keyword")!=null) {
//			String keyword = (String) data.get("keyword");
//			map.put("keyword", keyword);		
//			viewData.put("keyword", keyword);
//			totalCount  = memberDao.selectAdminCount(keyword); 
//		} else {	
//			map.put("keyword", "");
//			totalCount  = memberDao.selectAdminCount(""); 
//		}		
//		if(totalCount==0) {
//			totalCount = 1;
//		}
//		
//		int numOfMsgPage = (int) data.get("numOfMsgPage");
//		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
//		int pageNumber = (int) data.get("pageNumber");
//
//		if(pageNumber > pageTotalCount) {
//			pageNumber = pageTotalCount;
//		}
//		
//		viewData.put("currentPage", pageNumber);	
//		viewData.put("pageTotalCount", pageTotalCount);
//		viewData.put("startPage", getStartPage(pageNumber));
//		viewData.put("endPage", getEndPage(pageNumber));
//		viewData.put("msgPerPage", numOfMsgPage);
//		
//		viewData.put("boardList", memberDao.selectAdminList(map));
//		return viewData;
//	}
//	
//	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
//		int pageTotalCount = 0;
//		if (totalCount != 0) {
//			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
//		}
//		return pageTotalCount;
//	}
//
//	public int getStartPage(int pageNum) {
//		int startPage = ((pageNum - 1) / Constants.Admin.NUM_OF_NAVI_PAGE) * Constants.Admin.NUM_OF_NAVI_PAGE + 1;
//		return startPage;
//	}
//
//	public int getEndPage(int pageNum) {
//		int endPage = (((pageNum - 1) / Constants.Admin.NUM_OF_NAVI_PAGE) + 1) * Constants.Admin.NUM_OF_NAVI_PAGE;
//		return endPage;
//	}
//
//	
//
//}
