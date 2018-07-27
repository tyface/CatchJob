package com.CatchJob.dao;

//기업정보, 그래프 출력(ENTERPRISE_TB, NPN_DTLS_TB 이용)
import java.util.List;

import com.CatchJob.model.Review;

public interface ReviewDao {

	// 리뷰 등록(기업 식별번호, 회원 식별번호, 질문 식별번호, 리뷰 내용, 기업 평가 점수, 리뷰 상태(1:사용), 작성일)
	public int insertReview(Review review);

	// 리뷰 수정
	public int updateReview(Review review);

	// 리뷰 삭제 - 리뷰 상태 수정(1:사용 -> 2:삭제)
	public int updateReviewStatus(Review review);

	// 기업 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectListByEntIndex(int entIndex);

	// 회원 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectListByMberIndex(int mberIndex);
	
	// 리뷰 질문 출력
	public List<String> selectAllQuestion();
	
}
