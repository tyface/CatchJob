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
	// 리뷰 수정
	public boolean updateReview(Review review);
	//리뷰 삭제
	public boolean deleteReview(Map<String, String> data);
	//질문출력
	public List<Map<String, String>> question(int entIndex);
	
	//리뷰 보기
	public List<Review> reviewList(int entIndex);
	//수정 삭제 페이지에 리뷰 띄우기	
	public List<Review> reviewListByMember(int memberIndex);
	//수정 할 데이터 가져오기
	public Review review(Map<String, String> data);
/*	//질문별로 리뷰 보기
	public List<Review> reviewListByQNum(Map<String, String> data);*/
/* 페이징 처리 */
	public int calPageTotalCount(int totalCount, int numOfMsgPage);

	public int getStartPage(int pageNum);

	public int getEndPage(int pageNum);

	public Map<String, Object> getMessageList(Map<String, Object> data);

//	리뷰코멘트 VIEW 페이지에서 페이징처리
	public List<Review> getReviewsList(Map<String, Integer> data);
	//Review page data
	public Map<String, Object> reviewPageData (int currentPage, int entIndex, int questionNum );
	// 페이징 처리할 때 필요한 total rows
	public int getReviewTotalRows(Map<String, Integer> data);


}
