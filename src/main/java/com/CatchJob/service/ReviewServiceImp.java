package com.CatchJob.service;

import java.util.HashMap;
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

}
