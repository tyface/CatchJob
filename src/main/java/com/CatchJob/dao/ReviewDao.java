package com.CatchJob.dao;

//기업정보, 그래프 출력(ENTERPRISE_TB, NPN_DTLS_TB 이용)
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Admin;
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
	// 리뷰 수정
	public int updateReview(Review review);
	//리뷰 삭제 
	public int deleteReview(Map<String, String> data);
	//질문출력
	public List<Map<String, String>> question(Map<String, String> data);
	
	//리뷰 보기	
//	public List<Review> reviewList(int entIndex);
	//수정 삭제 페이지에 리뷰 띄우기	
	public List<Review> reviewListByMember(Map<String, String> map);
	//수정 할 데이터 가져오기
	public Review selectOneReview(Map<String, String> data);
	
	//질문별로 리뷰 보기
//	public List<Review> reviewListByQNum(Map<String, String> data);
	
	//관리자 페이지 페이징 처리+검색
	public int selectCountByKeyword(Map<String, String> map);

	public List<Review> selectReviewList(Map<String, String> map);
	
	public int updateReviewList(List<String> array);

//	리뷰코멘트 VIEW 페이지에서 페이징처리
	public int selectCount();
	
	public List<Review> selectReviewsList(Map<String, Integer> data);
	// 페이징 처리할 때 필요한 total rows
	public int selectReviewTotalRows(Map<String, Integer> data);
	// 리뷰 작성시, 중복 검사
	public int reviewDuplicationCheck(Map<String, String> data);
}
