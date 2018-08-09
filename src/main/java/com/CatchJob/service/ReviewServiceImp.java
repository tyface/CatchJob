package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int result = reviewDao.insertReview(review);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	@Override
	public List<Map<String, String>> question() {
		return reviewDao.question();
	}
	@Override
	public List<Review> reviewList(int entIndex) {
		List<Review> reviewList = reviewDao.reviewList(entIndex);
		return reviewList;
	}
	//질문별로 리뷰 보기
	@Override
	public List<Review> reviewListByQNum(Map<String, String> data) {
		
		return reviewDao.reviewListByQNum(data);
	}

}
