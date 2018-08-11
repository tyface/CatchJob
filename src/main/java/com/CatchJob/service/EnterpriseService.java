package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Interview;
import com.CatchJob.model.Review;

public interface EnterpriseService {
	// 검색한 기업 리스트 출력
	public List<Enterprise> getEntList(Map<String, String> data);

	// 기업정보 : 검색 후 기업 선택(출력 : 주소, 인원, 업력, 입사, 퇴사, 총매출액, 1인당 매출액, 매출액 대비 입금금액, 올해입사자
	// 평균연봉, 평균연봉..)
//	public Enterprise getEntInfo(int entIndex);

	
	// 기업식별 번호로  기업 정보 가져오기 
	public Map<String,String> getEntInfo(int entIndex);
	//기업정보의 입사 퇴사 구하기 (최근 12개월 동안의  인원수 합)
	public Map<String,String> selectEntPeopleInfo(int entIndex);
	// 그래프 - 인원
	public List<Map<String,String>> empCountGraph(int entIndex);

	// 그래프 - 평균급여
	public List<Map<String,String>> avgPayGraph(int entIndex);
	
	
	
	
	
	public List<Map<String, String>> getEmpCntList();
	
	
	 
	
	
	
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
