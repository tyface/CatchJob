package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.UniversalDomainDao;
import com.CatchJob.model.UniversalDomain;

@Service
public class UniversalDomainServiceImp implements UniversalDomainService {
	@Autowired
	UniversalDomainDao domainDao;

	@Override
	public List<UniversalDomain> getAllUniDomains() {
		return domainDao.selectListAll();
	};

	public UniversalDomain findUniDomain(String domain) {
		return domainDao.selectDomain(domain);
	}

	@Override
	public boolean insertDomain(UniversalDomain domain) {
		int rowCount = domainDao.insertDomain(domain);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean modifyDomain(UniversalDomain domain) {
		int rowCount = domainDao.updateDomain(domain);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteDomain(int domainIndex) {
		int rowCount = domainDao.deleteDomain(domainIndex);
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
		Map<String, String> map = new HashMap<>();
				
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			
			String keywordOption = (String) data.get("keywordOption");		
			if(keywordOption.equals("domainNameKeyword")) {
				String domainNameKeyword = (String) data.get("keyword");
				map.put("domainNameKeyword", domainNameKeyword);
				viewData.put("keyword", domainNameKeyword);
				viewData.put("keywordOption", "domainNameKeyword");	
				System.out.println("domainAddressKeyword!!!!!!!!!!!!!!!!"+ domainNameKeyword);
			}else if(keywordOption.equals("domainAddressKeyword")) {
				String domainAddressKeyword = (String) data.get("keyword");
				map.put("domainAddressKeyword", domainAddressKeyword);
				viewData.put("keyword", domainAddressKeyword);
				viewData.put("keywordOption", "domainAddressKeyword");
				System.out.println("domainAddressKeyword!!!!!!!!!!!!!!!!"+ domainAddressKeyword);
			} 				
		}		
			
		totalCount  = domainDao.selectCount(map); 		
		
		int firstRow = 0;     
		int endRow =0;
		int numOfMsgPage = (int) data.get("numOfMsgPage");
		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
		int pageNumber = (int) data.get("pageNumber");
		
		System.out.println("ㅁ문제인 아이"+ totalCount);
	
		if(pageNumber > pageTotalCount) {
			pageNumber = pageTotalCount;
		}
		
		firstRow = (pageNumber-1)*numOfMsgPage +1;  
		endRow = pageNumber*numOfMsgPage;  

		map.put("firstRow", String.valueOf(firstRow));
		map.put("endRow",  String.valueOf(endRow));

		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", domainDao.selectListDomain(map));

		
		System.out.println(viewData.get("currentPage"));
		System.out.println(viewData.get("pageTotalCount"));
		System.out.println(viewData.get("startPage"));
		System.out.println(viewData.get("endPage"));
		System.out.println(viewData.get("msgPerPage"));
		
		
		System.out.println(domainDao.selectListDomain(map));
		
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