package com.CatchJob.service;

import java.sql.SQLException;
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
	//리뷰코멘트 VIEW 페이지에서 페이징처리
	@Override
	public List<Review> getReviewList(Map<String, Integer> dataRvw) {
		
		int PAGE_NUM = dataRvw.get("PAGE_NUM");
		int START_ROW = Constants.Review.NUM_OF_RVW_PER_PAGE * ( PAGE_NUM - 1 ) ;
		dataRvw.put("NUM_OF_RVW_PER_PAGE", Constants.Review.NUM_OF_RVW_PER_PAGE);
		dataRvw.put("START_ROW", START_ROW);
		return reviewDao.selectReviewList(dataRvw);
	}
	
	@Override
	public Map<String, Object> reviewPageData(int currentPage, int entIndex, int questionNum ) {
		Map<String, Object> reviewPageData = new HashMap<String,Object>();
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("QESTN_NO", questionNum);
		data.put("ENT_IDX", entIndex);
		
		reviewPageData.put("currentPage", currentPage);	
		reviewPageData.put("pageTotalCount", getReviewTotalRows(data));
		reviewPageData.put("startPage", getReviewStartPage(currentPage));
		reviewPageData.put("endPage", getReviewEndPage(currentPage));
		reviewPageData.put("msgPerPage", Constants.Review.NUM_OF_RVW_PER_PAGE);//??이거 맞는지 모르겠음
		return reviewPageData;
	}
	// 페이징 처리할 때 필요한 total rows
	@Override
	public int getReviewTotalRows(Map<String, Integer> data) {
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
}
