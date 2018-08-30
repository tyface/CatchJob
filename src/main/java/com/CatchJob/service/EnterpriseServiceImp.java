package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.EnterpriseDao;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Interview;



@Service
public class EnterpriseServiceImp implements EnterpriseService {

	@Autowired
	private EnterpriseDao entDao;

	@Override
	public List<Enterprise> getEntList(Map<String, String> data) {
		List<Enterprise> entList = entDao.selectListEnt(data);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}

		return entList;
	}

	//기업정보 가져오기
	@Override
	public Map<String, String> getEntInfo(Map<String, String> data) {
		Map<String, String> entInfo = entDao.selectEntInfo(data);
		int payAmtAvg = salaryCalculation(Integer.parseInt(String.valueOf(entInfo.get("PAY_AMT_AVG"))));
		entInfo.replace("PAY_AMT_AVG", Integer.toString(payAmtAvg));
		return entInfo;
	}

	// 그래프 - 인원
	@Override
	public List<Map<String, String>> empCountGraph(int ent_idx) {
		return entDao.selectGraphInfo(ent_idx);
	}

	// 그래프 - 평균급여
	@Override
	public List<Map<String, String>> avgPayGraph(int entIndex) {
		return null;
	}

	@Override
	public List<Map<String, String>> getEmpCntList() {
		return entDao.selectListEmpCntRank(Constants.Config.RANK_VIEW_COUNT);
	}

	// 기업정보의 입사 퇴사 구하기 (최근 12개월 동안의 인원수 합)
	@Override
	public Map<String, String> getEntHRInfo(int entIndex) {
		return entDao.selectEntHRInfo(entIndex);
	}

	@Override
	public List<Enterprise> getFollowsEntList(int memberIndex) {
		
		List<Enterprise> entList = entDao.selectListEntByMember(memberIndex);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}
		return entList;
	}
	//최근 기업 정보 보기 
	@Override
	public List<Enterprise> getRecentEntList(Map<String, Integer> mapData) {
		mapData.put("NUM_OF_RECENT_PER_PAGE", Constants.Recent.NUM_OF_RECENT_PER_PAGE);
		mapData.put("START_ROW", 0);
		List<Enterprise> entList = entDao.selectListEntRecent(mapData);
		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}
		return entList;
	}

	/* 관리자 페이징 처리 */
	public Map<String, Object> getMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, String> map = new HashMap<>();
				
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keywordOption = (String) data.get("keywordOption");	
			if(keywordOption.equals("entNameKeyword")) {
				String entNameKeyword = (String) data.get("keyword");
				map.put("entNameKeyword", entNameKeyword);
				viewData.put("keyword", entNameKeyword);
				viewData.put("keywordOption", "entNameKeyword");			
			}else if(keywordOption.equals("entIndexKeyword")) {
				String entIndexKeyword = (String) data.get("keyword");
				map.put("entIndexKeyword", entIndexKeyword);
				viewData.put("keyword", entIndexKeyword);
				viewData.put("keywordOption", "entIndexKeyword");
			} 		
		}					
		totalCount  = entDao.selectCountByKeyword(map); 		
		
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

		map.put("firstRow", String.valueOf(firstRow));
		map.put("endRow",  String.valueOf(endRow));

		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", entDao.selectEntList(map));
		
		System.out.println(entDao.selectEntList(map));
		
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
	
	@Override
	public boolean modifyEnt(Enterprise ent) {
		int result = entDao.updateEnt(ent);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	
	@Override
	public Enterprise selectEnt(int entIndex) {
		Enterprise ent = entDao.selectEnt(entIndex);
		return ent;
	}
	

	public int salaryCalculation(int payAmtAvg) {
		return (int) (payAmtAvg / Constants.Config.NPN_PERCENT * 12 / 10000);
	}
	
}
