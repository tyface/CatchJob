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
	public List<Interview>  selectListByMemberIdx(Map<String, String> data);
	//바 형태의 면접후기 모양.
	public Float getDiffChart (Map<String, String> data);
	// 면접후기 면접결과 chart
	public List<Map<String,String>> getResultChart (Map<String, String> data);
	// 면접후기 면접경험 chart
	public List<Map<String,String>> getExperienceChart (Map<String, String> data);
	//면접후기 작성버튼 클릭시에 이미 작성했는지 검사
	public boolean interviewDuplicationCheck(Map<String, String> data);
	//view page, 면접후기 리스트 페이징처리
	public List<Interview> getInterviewList (Map<String, Integer> data);
	//interview page data
	public Map<String, Integer> interviewPageData (int currentPage, int entIndex);
	//interview total rows
	public int getInterviewTotalRows(Map<String, String> data);
	
	public Map<String, Object> getMessageList(Map<String, Object> data);

	public int calPageTotalCount(int totalCount, int numOfMsgPage);

	public Interview getInterview(int intrvwIndex);
	
	public boolean modifyInterviewByAdmin(Interview interview);
	
	public boolean modifyInterviewFlagByAdmin(Interview interview);
}
