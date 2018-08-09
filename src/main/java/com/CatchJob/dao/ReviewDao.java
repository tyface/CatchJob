package com.CatchJob.dao;

//기업정보, 그래프 출력(ENTERPRISE_TB, NPN_DTLS_TB 이용)
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Review;

@Repository
public interface ReviewDao {
/*
	

	// 리뷰 수정
	public int updateReview(Review review);

	// 기업 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectListByEntIndex(Map<String, String> data);

	// 회원 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
	public List<Review> selectListByMberIndex(Map<String, String> data);
	
	// 리뷰 질문 출력
	public List<String> selectAllQuestion();
	*/
	// 리뷰 등록(
	public int insertReview(Review review);
	//질문출력
	public List<Map<String, String>> question();
	//리뷰 보기	
	public List<Review> reviewList(int entIndex);
	//질문별로 리뷰 보기
	public List<Review> reviewListByQNum(Map<String, String> data);
}
