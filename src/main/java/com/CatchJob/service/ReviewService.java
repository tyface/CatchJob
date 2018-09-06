package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Review;

public interface ReviewService {

	// 리뷰 등록
	public boolean insertReview(Review review);
	// 리뷰 하나보기
	public Review selectReview(String reviewIndex);
	//리뷰 삭제
	public boolean deleteReview(Map<String, String> data);
	//질문출력
	List<Map<String, String>> question(Map<String, String> data);
	//수정 삭제 페이지에 리뷰 띄우기	
	public List<Review> reviewListByMember(Map<String, String> map);
	//수정 할 데이터 가져오기
	public Review review(Map<String, String> data);
	/* 관리자 페이지 */
	public int calPageTotalCount(int totalCount, int numOfMsgPage);

	public int getReviewStartPage(int pageNum);

	public int getReviewEndPage(int pageNum);

	public Map<String, Object> getMessageList(Map<String, Object> data);
	//리뷰 수정
	public boolean modifyReview(Review review);
	//리뷰코멘트 VIEW 페이지에서 페이징처리
	public List<Review> getReviewsList(Map<String, Integer> data);
	//Review page data
	public Map<String, Integer> reviewPageData (int currentPage, int entIndex, int questionNum );
	// 페이징 처리할 때 필요한 total rows
	public int getReviewTotalRows(Map<String, Integer> data);
	//리부 등록시, 중복검사
	public boolean duplicationCheck(Map<String, String> data);
	// 리뷰 총 만족도 구하기
	public double getTotalSatisfaction(Map<String, String> data);
	//리뷰 항목별 만독도  
	public List<Map<String, String>> valuesByItem(Map<String, String> data);
	//기업별 , 리뷰 항목 수
	public int numOfValuesByItem(List<Map<String, String>> data);
	//리뷰 수정 관리자 페이지
	boolean modifyReviewByAdmin(Review review);
}
