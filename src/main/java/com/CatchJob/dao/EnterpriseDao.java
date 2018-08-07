package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Interview;
import com.CatchJob.model.Review;

@Repository
public interface EnterpriseDao {

	// 기업이름으로 찾기
	public List<Enterprise> selectListEnt(Map<String, String> data);
	
	// 기업 찾기
//	public Enterprise selectEnt(int entIndex);

	public List<Map<String,String>> selectListEmpCntRank(int viewCount);
	
	// 기업식별 번호로  기업 정보 가져오기 
	public Map<String,String> selectEntInfo(int entIndex);
	//기업정보의 입사 퇴사 구하기 (최근 12개월 동안의  인원수 합)
	public Map<String,String> selectEntPeopleInfo(int entIndex);
	// 기업정보의 그래프 만들기 위해 필요한 데이터 
	public  List<Map<String,String>>  selectGraphInf(int entIndex);
	
	// public int insertEnt(Enterprise ent); TODO 기업정보를 따로 추가할경우가 아직 없음
	// public int updateEnt(Enterprise ent); TODO 기업정보를 따로 수정할경우가 아직 없음
	// public int deleteEnt(Enterprise ent); TODO 기업정보를 따로 삭제할경우가 아직 없음
	
	
	// 면접후기 추가
	public int insertInterview(Interview interview);
	// 면접후기 수정
	public int updateInterview(Interview interview);
	// 면접후기 찾기, 파라미터로 기업식별번호와 회원식별번호 보내주기!
	public Map<String,String> selectListByIndex(Map<String, Object> data);
	// 면접후기 VIEW
	public List<Interview>  selectListByEntIdx(int entIndex);
	// 면접후기 Pie Chart
	public List<Map<String,String>> interviewPieChart (int entIndex);
	
	//리뷰 보기	
	public List<Review> reviewList(Map<String, String> data);
}
