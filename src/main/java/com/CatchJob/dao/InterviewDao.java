package com.CatchJob.dao;

import java.util.List;

import com.CatchJob.model.Interview;

public interface InterviewDao {

	// 면접후기 추가
	public int insertInterview(Interview interview);

	// 면접후기 수정
	public int updateInterview(Interview interview);

	// 회원 면접후기 찾기
	public List<Interview> selectListByMberIndex(int mberIndex);

	// 기업 면접후기 찾기
	public List<Interview> selectListByEntIndex(int EntIndex);

	// 면접후기 삭제
	// public int deleteInterview(int mberIndex, int EntIndex); TODO 사용안함

}
