package com.CatchJob.service;

import java.util.List;
import com.CatchJob.model.Review;

public interface ReviewService {

	// 리뷰 등록(기업 식별번호, 회원 식별번호, 질문 식별번호, 리뷰 내용, 기업 평가 점수, 리뷰 상태(1:사용), 작성일)
	public boolean insertReview(Review review);

	// 리뷰 수정
	public boolean updateReview(Review review);

	// 리뷰 삭제 - 리뷰 상태 (1:사용 -> 2:삭제) 수정
	public boolean deleteReview(int reviewIndex);

	// 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectReviewList();

}
