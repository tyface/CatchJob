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
		Map<String, Object> map = new HashMap<>();

		if(data.get("keyword")!=null) {		
			String keywordOption = (String) data.get("keywordOption");		
			if(keywordOption.equals("domainNameKeyword")) {
				String domainNameKeyword = (String) data.get("keyword");
				map.put("domainNameKeyword", domainNameKeyword);
				viewData.put("keyword", domainNameKeyword);
				viewData.put("keywordOption", "domainNameKeyword");	
				totalCount  = domainDao.selectCount(map); 
			}else if(keywordOption.equals("domainAddressKeyword")) {
				String domainAddressKeyword = (String) data.get("keyword");
				map.put("domainAddressKeyword", domainAddressKeyword);
				viewData.put("keyword", domainAddressKeyword);
				viewData.put("keywordOption", "domainAddressKeyword");
				totalCount  = domainDao.selectCount(map); 
			} 				
		}		
			
		totalCount  = domainDao.selectCount(map); 
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