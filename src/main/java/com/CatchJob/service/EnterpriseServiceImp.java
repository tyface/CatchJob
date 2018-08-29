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

	// @Override
	// public Enterprise getEntInfo(int entIndex) {
	// // TODO Auto-generated method stub
	// return null;
	// }
	// 기업식별 번호로 기업 정보 가져오기
	@Override
	public Map<String, String> getEntInfo(Map<String, String> data) {
		Map<String, String> entInfo = entDao.selectEntInfo(data);
		return entInfo;
	}

	// 그래프 - 인원
	@Override
	public List<Map<String, String>> empCountGraph(int ent_idx) {
		return entDao.selectGraphInf(ent_idx);
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
	public Map<String, String> selectEntPeopleInfo(int entIndex) {
		return entDao.selectEntPeopleInfo(entIndex);
	}

	@Override
	public List<Enterprise> getFollowsEntList(int memberIndex) {
		
		List<Enterprise> entList = entDao.selectListEntByMember(memberIndex);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}
		return entList;
	}
	//최근 기업 정보 보기 //TODO 서비스랑 dao, mapper 분리하기 //RecentSerciveImp
	@Override
	public List<Enterprise> getRecentEntList(Map<String, Integer> mapData) {
		int PAGE_NUM = mapData.get("PAGE_NUM");
		int START_ROW = Constants.Recent.NUM_OF_RECENT_PER_PAGE * ( PAGE_NUM - 1 ) ;
		mapData.put("NUM_OF_RECENT_PER_PAGE", Constants.Recent.NUM_OF_RECENT_PER_PAGE);
		mapData.put("START_ROW", START_ROW);
		System.out.println("서비스 메타데이터: "+mapData);
		List<Enterprise> entList = entDao.selectListEntRecent(mapData);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}
		return entList;
	}
	 //TODO 옮길것
	@Override
	public Map<String, Integer> recentPageData(int currentPage,int memberIndex) {
		Map<String, Integer> recentPageData = new HashMap<String,Integer>();
		Map<String, String> data = new HashMap<String, String>();
		//data.put("ENT_IDX", Integer.toString(entIndex));
		recentPageData.put("currentPage", currentPage);	
		recentPageData.put("pageTotalCount", getrecentTotalRows(memberIndex));
		recentPageData.put("startPage", getRecentStartPage(currentPage));
		recentPageData.put("endPage", getRecentEndPage(currentPage));
		recentPageData.put("msgPerPage", Constants.Interview.NUM_OF_ITVW_PER_PAGE);
		System.out.println("recentPageData: "+recentPageData);
		return recentPageData;
	}
	 //TODO 옮길것
	@Override
	public int getrecentTotalRows(int memberIndex) {
		//data.put("INTRVW_FL", "1");
		int pageTotalCount = 0;
		int totalRows = entDao.selectRecentTotalRows(memberIndex);
		System.out.println("totalRows: "+totalRows);
		if (totalRows != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalRows / Constants.Interview.NUM_OF_ITVW_PER_PAGE));
		}
		return pageTotalCount;
		
	}
	 //TODO 옮길것
	public int getRecentStartPage(int pageNum) {
		int startPage = ((pageNum - 1) / Constants.Recent.NUM_OF_NAVI_PAGE) * Constants.Recent.NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}
	 //TODO 옮길것
	public int getRecentEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / Constants.Recent.NUM_OF_NAVI_PAGE) + 1) * Constants.Recent.NUM_OF_NAVI_PAGE;
		return endPage;
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
