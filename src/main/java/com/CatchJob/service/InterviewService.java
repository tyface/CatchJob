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
		//계정에서 인터뷰 정보 출력할때 필요..
		public List<Interview>  selectListByMemberIdx(int mberIndex);
		// 면접후기 Pie Chart
		public List<Map<String,String>> interviewPieChart (int entIndex);
		//면접후기 작성버튼 클릭시에 이미 작성했는지 검사
		public boolean interviewDuplicationCheck(Map<String, String> data);
		//view page, 면접후기 리스트 페이징처리
		public List<Interview> getInterviewList (Map<String, Integer> data);
		//interview page data
		public Map<String, Object> interviewPageData (int currentPage, int entIndex);
		//interview total rows
		public int getInterviewTotalRows(int entIndex);
}
