package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.AdminDao;
import com.CatchJob.model.Admin;

@Service
public class AdminServiceImp implements AdminService {	
	private static final int NUM_OF_NAVI_PAGE = 5;

	@Autowired
	AdminDao adminDao;

	@Override
	public List<Admin> getListAdmins(Map<String, String> map) {
		return adminDao.selectListAdmin(map);
	}

	@Override
	public Admin getAdmin(int adminIndex) {
		return adminDao.selectOne(adminIndex);
	}

	@Override
	public boolean login(String adminId, String adminPw) {
		Admin admin = adminDao.selectById(adminId);
		if (admin != null) {
			if (admin.getAdminPw().equals(adminPw)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public Admin getAdminById(String adminId) {
		return adminDao.selectById(adminId);
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		// Admin 수정
		int rowCount = adminDao.updateOne(admin);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}	
	
	/* 페이징 처리 */
	public Map<String, Object> getMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		totalCount  = adminDao.selectCount(); 		
		int firstRow = 0;
		int endRow =0;
		int numOfMsgPage = (int) data.get("numOfMsgPage");
		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
		int pageNumber = (int) data.get("pageNumber");
		
		if(pageNumber > pageTotalCount) {
			pageNumber = pageTotalCount;
		}
			
		firstRow = (pageNumber-1)*numOfMsgPage +1;
		endRow = pageNumber*numOfMsgPage;
		
		Map<String, String> map = new HashMap<>();
		map.put("firstRow", String.valueOf(firstRow));
		map.put("endRow",  String.valueOf(endRow));
		
		viewData.put("currentPage", pageNumber);
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);
		
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("boardList", adminDao.selectListAdminByKeyword(map));
			viewData.put("keyword", keyword);			
		} else {
			viewData.put("boardList", adminDao.selectListAdmin(map));
		}
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
