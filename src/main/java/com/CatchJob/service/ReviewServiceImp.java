package com.CatchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.ReviewDao;
import com.CatchJob.model.Review;

@Service
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public boolean insertReview(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

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
	}

}
