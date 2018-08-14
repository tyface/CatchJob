package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Interview;

public interface InterviewService {
	
	// 면접후기 추가
		public boolean  insertInterview(Interview interview);
		// 면접후기 수정
		public boolean  updateInterview(Interview interview);
		//면접후기 삭제
		public boolean deleteInterview(Map<String, String> data);
		//면접정보 가져오기
		public Interview selectListByIndex(Map<String, String> data);
		// 면접후기 VIEW
		public List<Interview>  selectListByEntIdx(int entIndex);
		//계정에서 인터뷰 정보 출력할때 필요..
		public List<Interview>  selectListByMemberIdx(int mberIndex);
		// 면접후기 Pie Chart
		public List<Map<String,String>> interviewPieChart (int entIndex);

}
