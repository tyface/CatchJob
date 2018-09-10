package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Interview;

@Repository
public interface InterviewDao {

	// 면접후기 추가
	public int insertInterview(Interview interview);
	// 면접후기 수정
	public int updateInterview(Interview interview);
	//면접후기 삭제
	public int deleteInterview(Map<String, String> data);
	// 면접후기 찾기, 파라미터로 기업식별번호와 회원식별번호 보내주기!
	public Interview selectListByIndex(Map<String, String> data);
	//계정에서 인터뷰 정보 출력할때 필요..
	public List<Interview> selectListByMemberIdx(Map<String, String> data);
	//바 형태의 면접후기 모양.
	public Float interviewDiffChart (Map<String, String> data);
	// 면접후기 면접결과 chart
	public List<Map<String,String>> interviewResultChart (Map<String, String> data);
	// 면접후기 면접경험 chart
	public List<Map<String,String>> interviewExperienceChart (Map<String, String> data);
	// 면접후기 작성버튼 클릭시에 이미 작성했는지 검사 (true:1, false:0)
	public int interviewDuplicationCheck(Map<String, String> data);
	// view page, 페이징 처리
	public List<Interview> selectInterviewList (Map<String, Integer> data);
	//interview total rows
	public int selectInterviewTotalRows(Map<String, String> data);
	// 관리자 페이지 페이징 처리+검색
	public int selectCountByKeyword(Map<String, Object> map);

	public List<Interview> selectInterviewListByAdmin(Map<String, Object> map);
	// 면접 하나 출력
	public Interview selectInterview(int intrvwIndex);
	// 관리자 페이지 면접 수정
	public int updateInterviewByAdmin(Interview interview);
	
	public int updateInterviewFlagByAdmin(Interview interview);
}
