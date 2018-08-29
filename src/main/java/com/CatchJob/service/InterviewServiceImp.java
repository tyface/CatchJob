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
//		int result = itvwDao.insertInterview(interview);
//		if (result > 0) {
//			return true;
//		} else {
//			return false;
//		}
		try{
			itvwDao.insertInterview(interview);
			return true;
		}catch(Exception e) {
			System.out.println(e);
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
		return itvwDao.selectListByMemberIdx(data);
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
		//받아온 페이지 ...
		//Constants.Config.RANK_VIEW_COUNT //화면에 표시할 row 수
		//dataItvw.put("ENT_IDX", entIndex);
		dataItvw.put("INTRVW_FL", 1);
		int PAGE_NUM = dataItvw.get("PAGE_NUM");
		int START_ROW = Constants.Interview.NUM_OF_ITVW_PER_PAGE * ( PAGE_NUM - 1 ) ;
		dataItvw.put("NUM_OF_ITVW_PER_PAGE", Constants.Interview.NUM_OF_ITVW_PER_PAGE);
		dataItvw.put("START_ROW", START_ROW);
		List<Interview> interviewList = itvwDao.selectInterviewList(dataItvw);
		
		for(int i = 0 ; i<interviewList.size();i++) {			
			switch (interviewList.get(i).getIntrvwDifficulty()) {
			case "1":
				interviewList.get(i).setIntrvwDifficulty("매우 어려움");
				break;
			case "2":
				interviewList.get(i).setIntrvwDifficulty("어려움");
				break;
			case "3":
				interviewList.get(i).setIntrvwDifficulty("보통");
				break;
			case "4":
				interviewList.get(i).setIntrvwDifficulty("쉬움");
				break;
			case "5":
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
			//default : interviewList.get(i).setIntrvwRoute("기타");;
			//break;
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
				System.out.println("널값임..");
				//interviewList.get(i).setIntrvwRoute("0");
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
				//default : interviewList.get(i).setIntrvwExperience("긍정적");;
				//break;
				}
			}catch(NullPointerException e) {
				System.out.println("널값임..");
				//interviewList.get(i).setIntrvwExperience("0");
			}
		}
		
		//System.out.println("인터뷰 서비스: "+interviewList);
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

}
