/*package com.CatchJob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Review;
import com.CatchJob.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 등록
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String insertReview(Review review) {

		if (reviewService.insertReview(review)) {
			// 리뷰 등록 성공
			return null;
		} else {
			return null;
		}
	}

	// 리뷰 수정
//	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String updateReview(Review review) {

		if (reviewService.updateReview(review)) {
			// 리뷰 수정 성공
			return null;
		} else {
			return null;
		}
	}

	// 리뷰 삭제 - 리뷰 상태 (1:사용 -> 2:삭제) 수정
//	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String deleteReview(int reviewIndex) {

		if (reviewService.deleteReview(reviewIndex)) {
			// 리뷰 상태 (1:사용 -> 2:삭제) 수정 성공
			return null;
		} else {
			return null;
		}
	}

	// 리뷰 출력 - 질문 식별번호에 관련된 리뷰 출력
//	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String selectReviewList(Model model) {
		model.addAttribute("reviewList", reviewService.selectReviewList());
		return null;
	}
}
*/