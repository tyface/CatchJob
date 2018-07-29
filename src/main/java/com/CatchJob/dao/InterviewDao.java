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

	// 회원 면접후기 찾기
	public List<Interview> selectListByMberIndex(Map<String, String> map);

	// 기업 면접후기 찾기
	public List<Interview> selectListByEntIndex(Map<String, String> map);

	// 면접후기 삭제
	// public int deleteInterview(int mberIndex, int EntIndex); TODO 사용안함

}
