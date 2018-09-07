package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.InterviewDao;
import com.CatchJob.model.Interview;

@Service
public class InterviewServiceImp implements InterviewService{

	@Autowired
	private InterviewDao itvwDao;

	@Override
	public boolean insertInterview(Interview interview) {
		interview.setIntrvwFlag("1");
		try{
			itvwDao.insertInterview(interview);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateInterview(Interview interview) {
		int result = itvwDao.updateInterview(interview);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteInterview(Map<String, String> data) {
		data.put("INTRVW_FL", "2");
		int result = itvwDao.deleteInterview(data);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	// 면접정보 가져오기- 회원이 면접후기 수정할 때 필요 
	@Override
	public Interview selectListByIndex(Map<String, String> data) {  
		data.put("INTRVW_FL", "1");
		System.out.println("serivedeeereee:"+data+itvwDao.selectListByIndex(data));
		return itvwDao.selectListByIndex(data);
	}

	@Override
	public List<Map<String,String>> interviewPieChart(Map<String, String> data) {	
		data.put("INTRVW_FL", "1");
		return itvwDao.interviewPieChart(data);
	}

	@Override
	public List<Interview> selectListByMemberIdx(Map<String, String> data) {
		data.put("INTRVW_FL", "1");
		List<Interview> result = itvwDao.selectListByMemberIdx(data);
		for(Interview list: result) {
			list.setRegDate(list.getRegDate().substring(0, 10));
		}
		return result;
	}
	//면접 후기 작성시, 중복확인 메서드 
	@Override
	public boolean interviewDuplicationCheck(Map<String, String> data) {
		data.put("INTRVW_FL", "1");
		int result = itvwDao.interviewDuplicationCheck(data);
		if (result > 0) {//이미 등록하셨습니다.
			return true;
		} else {//등록 가능
			return false;
		}
		
	}
	//view page, 면접후기 리스트 페이징처리
	@Override
	public List<Interview> getInterviewList(Map<String, Integer> dataItvw) {
		dataItvw.put("INTRVW_FL", 1);
		int PAGE_NUM = dataItvw.get("PAGE_NUM");
		int START_ROW = Constants.Interview.NUM_OF_ITVW_PER_PAGE * ( PAGE_NUM - 1 ) ;
		dataItvw.put("NUM_OF_ITVW_PER_PAGE", Constants.Interview.NUM_OF_ITVW_PER_PAGE);
		dataItvw.put("START_ROW", START_ROW);
		List<Interview> interviewList = itvwDao.selectInterviewList(dataItvw);
		
		for(int i = 0 ; i<interviewList.size();i++) {			
			switch (interviewList.get(i).getIntrvwDifficulty()) {
			case "5":
				interviewList.get(i).setIntrvwDifficulty("매우 어려움");
				break;
			case "4":
				interviewList.get(i).setIntrvwDifficulty("어려움");
				break;
			case "3":
				interviewList.get(i).setIntrvwDifficulty("보통");
				break;
			case "2":
				interviewList.get(i).setIntrvwDifficulty("쉬움");
				break;
			case "1":
				interviewList.get(i).setIntrvwDifficulty("매우 쉬움");
				break;
			}
		}
		/* 면접 경로 */		
		for(int i = 0 ; i<interviewList.size();i++) {			
			switch (interviewList.get(i).getIntrvwRoute()) {
			case "1":
				interviewList.get(i).setIntrvwRoute("공채");
				break;
			case "2":
				interviewList.get(i).setIntrvwRoute("온라인 지원");
				break;
			case "3":
				interviewList.get(i).setIntrvwRoute("직원 추천");
				break;
			case "4":
				interviewList.get(i).setIntrvwRoute("헤드헌터");
				break;
			case "5":
				interviewList.get(i).setIntrvwRoute("학교 취업지원센터");
				break;	
			case "6":
				interviewList.get(i).setIntrvwRoute("기타");
				break;	
			}
		}
		/* 면접 결과 */		
		for(int i = 0 ; i<interviewList.size();i++) {	
			try {
				switch (interviewList.get(i).getIntrvwResult()) {
				case "1":
					interviewList.get(i).setIntrvwResult("합격");
					break;
				case "2":
					interviewList.get(i).setIntrvwResult("불합격");
					break;
				case "3":
					interviewList.get(i).setIntrvwResult("대기중");
					break;
				case "4":
					interviewList.get(i).setIntrvwRoute("합격했으나 취업하지 않음");
					break;
				}
			}catch(NullPointerException e) {
				e.printStackTrace();
			}
		}
		/* 면접  경험*/		
		for(int i = 0 ; i<interviewList.size();i++) {	
			try {
				switch (interviewList.get(i).getIntrvwExperience()) {
				case "1":
					interviewList.get(i).setIntrvwExperience("부정적");
					break;
				case "2":
					interviewList.get(i).setIntrvwExperience("보통");
					break;
				case "3":
					interviewList.get(i).setIntrvwExperience("긍정적");
					break;	
				}
			}catch(NullPointerException e) {
				e.printStackTrace();
			}
		}
		return interviewList;
	}
	@Override
	public Map<String, Integer> interviewPageData(int currentPage,int entIndex) {
		Map<String, Integer> interviewPageData = new HashMap<String,Integer>();
		Map<String, String> data = new HashMap<String, String>();
		data.put("ENT_IDX", Integer.toString(entIndex));
		interviewPageData.put("currentPage", currentPage);	
		interviewPageData.put("pageTotalCount", getInterviewTotalRows(data));
		interviewPageData.put("startPage", getInterviewStartPage(currentPage));
		interviewPageData.put("endPage", getInterviewEndPage(currentPage));
		interviewPageData.put("msgPerPage", Constants.Interview.NUM_OF_ITVW_PER_PAGE);
		return interviewPageData;
	}
	//interview total rows
	@Override
	public int getInterviewTotalRows(Map<String, String> data) {
		data.put("INTRVW_FL", "1");
		int pageTotalCount = 0;
		int totalRows = itvwDao.selectInterviewTotalRows(data);
		if (totalRows != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalRows / Constants.Interview.NUM_OF_ITVW_PER_PAGE));
		}
		return pageTotalCount;
		
	}
	
	public int getInterviewStartPage(int pageNum) {
		int startPage = ((pageNum - 1) / Constants.Interview.NUM_OF_NAVI_PAGE) * Constants.Interview.NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}

	public int getInterviewEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / Constants.Interview.NUM_OF_NAVI_PAGE) + 1) * Constants.Interview.NUM_OF_NAVI_PAGE;
		return endPage;
	}
	
	/* 관리자 페이징 처리 */
	public Map<String, Object> getMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
				
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keywordOption = (String) data.get("keywordOption");
			if(keywordOption.equals("entNameKeyword")) {
				String entNameKeyword = (String) data.get("keyword");
				map.put("entNameKeyword", entNameKeyword);
				viewData.put("keyword", entNameKeyword);
				viewData.put("keywordOption", "entNameKeyword");	
				totalCount  = itvwDao.selectCountByKeyword(map); 	
			}else if(keywordOption.equals("entIndexKeyword")) {
				String entIndexKeyword = (String) data.get("keyword");
				map.put("entIndexKeyword", entIndexKeyword);
				viewData.put("keyword", entIndexKeyword);
				viewData.put("keywordOption", "entIndexKeyword");
				totalCount  = itvwDao.selectCountByKeyword(map); 	
			} else if(keywordOption.equals("intrvwDifficultyKeyword")){
				String intrvwDifficultyKeyword = (String) data.get("keyword");
				map.put("intrvwDifficultyKeyword", intrvwDifficultyKeyword);
				viewData.put("keyword", intrvwDifficultyKeyword);
				viewData.put("keywordOption", "intrvwDifficultyKeyword");
				totalCount  = itvwDao.selectCountByKeyword(map); 	
			}else if(keywordOption.equals("")) {
				totalCount  = itvwDao.selectCountByKeyword(map); 	
			}				
		} else {
			totalCount  = itvwDao.selectCountByKeyword(map); 	
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

		int startRow = numOfMsgPage * (pageNumber - 1);
		map.put("NUM_OF_MSG_PER_PAGE", numOfMsgPage);
		map.put("START_ROW", startRow);

		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getInterviewStartPage(pageNumber));
		viewData.put("endPage", getInterviewEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", itvwDao.selectInterviewListByAdmin(map));
		
		System.out.println(itvwDao.selectInterviewListByAdmin(map));
		
		return viewData;
	}
	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
		int pageTotalCount = 0;
		if (totalCount != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
		}
		return pageTotalCount;
	}
	
	public Interview getInterview(int intrvwIndex) {
		return itvwDao.selectInterview(intrvwIndex);
	}
	
	@Override
	public boolean modifyInterviewByAdmin(Interview interview) {
		int result = itvwDao.updateInterviewByAdmin(interview);
		if(result > 0) {		
			return true;
		}else {			
			return false;
		}
	}

}
