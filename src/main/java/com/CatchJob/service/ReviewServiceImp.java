package com.CatchJob.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.ReviewDao;
import com.CatchJob.model.Review;

@Service
public class ReviewServiceImp implements ReviewService {
	private static final int NUM_OF_NAVI_PAGE = 5;
	@Autowired
	private ReviewDao reviewDao;

	/*

	@Override
	public boolean updateReview(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteReview(int reviewIndex) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Review> selectReviewList() {
		// TODO Auto-generated method stub
		return null;
	}*/
	@Override
	public boolean insertReview(Review review) {		
		try {		
			reviewDao.insertReview(review);
			return true;
		}catch(Exception  e) {
			e.printStackTrace();
			return false;
		}
		
	}
	@Override
	public boolean updateReview(Review review) {
		int result = reviewDao.updateReview(review);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	//리뷰 삭제	
	@Override
	public boolean deleteReview(Map<String, String> data) {
		int result = reviewDao.deleteReview(data);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	@Override
	public List<Map<String, String>> question(int entIndex) {

		return reviewDao.question(entIndex);
	}
	
	@Override
	public List<Review> reviewList(int entIndex) {
		List<Review> reviewList = reviewDao.reviewList(entIndex);
		return reviewList;
	}
	/*//질문별로 리뷰 보기
	@Override
	public List<Review> reviewListByQNum(Map<String, String> data) {
		
		return reviewDao.reviewListByQNum(data);
	}*/
	//수정 삭제 페이지에 리뷰 띄우기		
	@Override
	public List<Review> reviewListByMember(int memberIndex) {
		return reviewDao.reviewListByMember(memberIndex);
	}
	//수정 할 데이터 가져오기
	@Override
	public Review review(Map<String, String> data) {
		return reviewDao.review(data);
	}

	/* 페이징 처리 */
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
				map.put("entIndexKeyword", "");
				map.put("questionNumKeyword", "");
				viewData.put("keyword", entNameKeyword);		
				
			}else if(keywordOption.equals("entIndexKeyword")) {
				String entIndexKeyword = (String) data.get("keyword");
				map.put("entIndexKeyword", entIndexKeyword);
				map.put("entNameKeyword", "");
				map.put("questionNumKeyword", "");
				viewData.put("keyword", entIndexKeyword);			
				
			} else if(keywordOption.equals("questionNumKeyword")){
				String questionNumKeyword = (String) data.get("keyword");
				map.put("questionNumKeyword", questionNumKeyword);
				map.put("entIndexKeyword", "");
				map.put("entNameKeyword", "");
				viewData.put("keyword", questionNumKeyword);			
			}				
		} else {
			map.put("questionNumKeyword", "");
			map.put("entIndexKeyword", "");
			map.put("entNameKeyword", "");
			viewData.put("keyword", "");			
		}		
		
		totalCount  = reviewDao.selectCount(); 
		
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
		map.put("entIndex", (String)data.get("entIndex"));
		
		System.out.println("entIndex :"+(String)data.get("entIndex"));
		System.out.println("firstRow :"+firstRow);
		System.out.println("endRow :"+endRow);
		
		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);
		
		viewData.put("boardList", reviewDao.selectReviewList(map));
		
		System.out.println(reviewDao.selectReviewList(map));
		
		
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
