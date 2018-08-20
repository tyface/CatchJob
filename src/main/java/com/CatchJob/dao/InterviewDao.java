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
	public List<Interview> selectListByMemberIdx(int memberIndex);
	// 면접후기 Pie Chart
	public List<Map<String,String>> interviewPieChart (int entIndex);
	// 면접후기 작성버튼 클릭시에 이미 작성했는지 검사 (true:1, false:0)
	public int interviewDuplicationCheck(Map<String, String> data);
	// view page, 페이징 처리
	public List<Interview> selectInterviewList (Map<String, Integer> data);
	//interview total rows
	public int selectInterviewTotalRows(int entIndex);

}
