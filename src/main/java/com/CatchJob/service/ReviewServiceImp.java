package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.ReviewDao;
import com.CatchJob.model.Review;

@Service
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public boolean insertReview(Review review) {		
		try {		
			review.setReviewFlag("1");
			
			Map<String, String> data = new HashMap<String, String>();
			data.put("ENT_IDX", Integer.toString(review.getEntIndex()));
			data.put("MBER_IDX", Integer.toString(review.getMberIndex()));
			data.put("QESTN_NO", Integer.toString(review.getQuestionNum()));
			data.put("REVW_FL", "1");
			
			if(duplicationCheck(data)) {
				reviewDao.insertReview(review);
				reviewDao.updateEvaluationAvg(review.getEntIndex());
				return true;
			}else {
				return false;
			}
			
			
		}catch(Exception  e) {
			e.printStackTrace();
			return false;
		}
		
	}
	//리부 등록시, 중복검사
	@Override
	public boolean duplicationCheck(Map<String, String> data) {
		int result = reviewDao.reviewDuplicationCheck(data);
		//System.out.println("서비스:duplicationCheck:   "+result);
		if (result > 0 ) {//글 등록할 수 없음
			return false;
		} else {//글 등록할 수 있음
			return true;
		}
	}
	
	public Review selectReview(String reviewIndex) {
		Review review = reviewDao.selectReview(reviewIndex);
		return review;
	}
	//리뷰 삭제	
	@Override
	public boolean deleteReview(Map<String, String> data) {
		data.put("REVW_FL", "2");
		int result = reviewDao.deleteReview(data);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	@Override
	public List<Map<String, String>> question(Map<String, String> data) {
		data.put("REVW_FL", "1");
		System.out.println("야야아: "+reviewDao.question(data));
		//List<Map<String, String>> result = reviewDao.question(data);
		
		return reviewDao.question(data);
	}
	
	//수정 삭제 페이지에 리뷰 띄우기		
	@Override
	public List<Review> reviewListByMember(Map<String, String> map) {
		map.put("REVW_FL", "1");
		List<Review> result = reviewDao.reviewListByMember(map);
		for(Review list: result) {
			list.setRegDate(list.getRegDate().substring(0, 10));
		}
		return result;
	}
	
	//수정 할 데이터 가져오기
	@Override
	public Review review(Map<String, String> data) {
		data.put("REVW_FL", "1");
		return reviewDao.selectOneReview(data);
	}

	//리뷰코멘트 VIEW 페이지에서 페이징처리
	@Override
	public List<Review> getReviewsList(Map<String, Integer> dataRvw) {
		dataRvw.put("REVW_FL", 1);
		int pageNum = dataRvw.get("PAGE_NUM");
		int startRow = Constants.Review.NUM_OF_RVW_PER_PAGE * ( pageNum - 1 ) ;
		dataRvw.put("NUM_OF_RVW_PER_PAGE",Constants.Review.NUM_OF_RVW_PER_PAGE);
		dataRvw.put("START_ROW", startRow);
		return reviewDao.selectReviewsList(dataRvw);
	}
	
	@Override
	public Map<String, Integer> reviewPageData(int currentPage, int entIndex, int questionNum ) {
		Map<String, Integer> reviewPageData = new HashMap<String,Integer>();
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("QESTN_NO", questionNum);
		data.put("ENT_IDX", entIndex);
		
		reviewPageData.put("currentPage", currentPage);	
		reviewPageData.put("pageTotalCount", getReviewTotalRows(data));
		reviewPageData.put("startPage", getReviewStartPage(currentPage));
		reviewPageData.put("endPage", getReviewEndPage(currentPage));
		reviewPageData.put("msgPerPage", Constants.Review.NUM_OF_RVW_PER_PAGE);
		return reviewPageData;
	}
	// 페이징 처리할 때 필요한 total rows
	@Override
	public int getReviewTotalRows(Map<String, Integer> data) {
		data.put("REVW_FL", 1);
		int pageTotalCount = 0;
		if (reviewDao.selectReviewTotalRows(data) != 0) {
			pageTotalCount = (int) Math.ceil(((double) reviewDao.selectReviewTotalRows(data) / Constants.Review.NUM_OF_RVW_PER_PAGE));
		}
		return pageTotalCount;
	}
	

	public int getReviewStartPage(int pageNum) {
		int startPage = ((pageNum - 1) / Constants.Review.NUM_OF_NAVI_PAGE) * Constants.Review.NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}

	public int getReviewEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / Constants.Review.NUM_OF_NAVI_PAGE) + 1) * Constants.Review.NUM_OF_NAVI_PAGE;
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
				totalCount  = reviewDao.selectCountByKeyword(map); 	
			}else if(keywordOption.equals("entIndexKeyword")) {
				String entIndexKeyword = (String) data.get("keyword");
				map.put("entIndexKeyword", entIndexKeyword);
				viewData.put("keyword", entIndexKeyword);
				viewData.put("keywordOption", "entIndexKeyword");
				totalCount  = reviewDao.selectCountByKeyword(map); 	
			} else if(keywordOption.equals("questionNumKeyword")){
				String questionNumKeyword = (String) data.get("keyword");
				map.put("questionNumKeyword", questionNumKeyword);
				viewData.put("keyword", questionNumKeyword);
				viewData.put("keywordOption", "questionNumKeyword");
				totalCount  = reviewDao.selectCountByKeyword(map); 	
			}				
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
		viewData.put("startPage", getReviewStartPage(pageNumber));
		viewData.put("endPage", getReviewEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", reviewDao.selectReviewList(map));
		
		System.out.println(reviewDao.selectReviewList(map));
		
		return viewData;
	}

	@Override
	public boolean modifyReview(Review review) {
		int result = reviewDao.updateReview(review);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	
	// 리뷰 총 만족도 구하기
	@Override
	public double getTotalSatisfaction(Map<String, String> data) {
		data.put("REVW_FL", "1");
		try {
			return reviewDao.totalSatisfactionValue(data);			
		}catch(Exception e) {
			return 0.0;
		}
	}
	//리뷰 항목별 만독도  
	@Override
	public List<Map<String, String>> valuesByItem(Map<String, String> data) {
		data.put("REVW_FL", "1");
		List<Map<String, String>> valuesByItem = reviewDao.valuesByItem(data);
	//	Map<String, String> test =  valuesByItem.get(0);
		
	//	System.out.println("fff: "+ String.valueOf(test.get("COUNT")));
		
		//valuesByItem.add(numOfValuesByItem(valuesByItem));
		return valuesByItem;
	}
	//기업별 , 리뷰 항목 수
	@Override
	public int numOfValuesByItem(List<Map<String, String>> data){
		//data.get(0).get("EVALUATION_NUM");
		System.out.println("서비스 평가 점수 떠야함 0점  : "+String.valueOf(data.get(0).get("COUNT")));
		int numOfValuesByItem = 0;
		for(Map<String, String> map : data) {
			numOfValuesByItem += Integer.parseInt(String.valueOf(map.get("COUNT")));
		}
		
		return numOfValuesByItem;
	}
	
	
	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
		int pageTotalCount = 0;
		if (totalCount != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
		}
		return pageTotalCount;
	}
}
