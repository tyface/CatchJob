package com.CatchJob.dao;

//기업정보, 그래프 출력(ENTERPRISE_TB, NPN_DTLS_TB 이용)
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Review;

@Repository
public interface ReviewDao {
	// 리뷰 등록(
	public int insertReview(Review review);
	// 리뷰 수정
	public int updateReview(Review review);	
	// 리뷰 수정(관리자 페이지) 
	public int updateReviewByAdmin(Review review); 
	// 리뷰 하나 출력
	public Review selectReview(String reviewIndex);
	// 리뷰 삭제
	public int deleteReview(Map<String, String> data);

	// 질문 출력
	public List<Map<String, String>> question(Map<String, String> data);

	// 리뷰 보기
	// 수정 삭제 페이지에 리뷰 띄우기
	public List<Review> reviewListByMember(Map<String, String> map);

	// 수정 할 데이터 가져오기
	public Review selectOneReview(Map<String, String> data);

	// 관리자 페이지 페이징 처리+검색
	public int selectCountByKeyword(Map<String, Object> map);

	public List<Review> selectReviewList(Map<String, Object> map);

	// 리뷰코멘트 VIEW 페이지에서 페이징처리
	public int selectCount();

	public List<Review> selectReviewsList(Map<String, Integer> data);

	// 페이징 처리할 때 필요한 total rows
	public int selectReviewTotalRows(Map<String, Integer> data);

	// 리뷰 작성시, 중복 검사
	public int reviewDuplicationCheck(Map<String, String> data);

	// 리뷰 총 만족도 구하기
	public double totalSatisfactionValue(Map<String, String> data);

	// 리뷰 항목별 만독도
	public List<Map<String, String>> valuesByItem(Map<String, String> data);
	
	// 해당기업 리뷰점수 최신화
	public int updateEvaluationAvg(int entIndex);
}
