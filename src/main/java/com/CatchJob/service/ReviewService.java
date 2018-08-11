package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Review;

public interface ReviewService {

/*	

	// 리뷰 수정
	public boolean updateReview(Review review);

	// 리뷰 삭제 - 리뷰 상태 (1:사용 -> 2:삭제) 수정
	public boolean deleteReview(int reviewIndex);

	// 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectReviewList();
*/
	// 리뷰 등록
	public boolean insertReview(Review review);
	//질문출력
	public List<Map<String, String>> question();
	//리뷰 보기
	public List<Review> reviewList(int entIndex);
	//수정 삭제 페이지에 리뷰 띄우기	
	public List<Review> reviewListByMember(int memberIndex);
/*	//질문별로 리뷰 보기
	public List<Review> reviewListByQNum(Map<String, String> data);*/
}
