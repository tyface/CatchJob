package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Enterprise;

public interface EnterpriseService {
	// 검색한 기업 리스트 출력 (&팔로잉된 기업 1로 표시)
	public List<Enterprise> getEntList(Map<String, String> data);

	// 기업정보 : 검색 후 기업 선택(출력 : 주소, 인원, 업력, 입사, 퇴사, 총매출액, 1인당 매출액, 매출액 대비 입금금액, 올해입사자
	// 평균연봉, 평균연봉..)
//	public Enterprise getEntInfo(int entIndex);

	
	// 기업식별 번호로  기업 정보 가져오기 
	public Map<String,String> getEntInfo(Map<String, String> data);
	//기업정보의 입사 퇴사 구하기 (최근 12개월 동안의  인원수 합)
	public Map<String,String> selectEntPeopleInfo(int entIndex);
	// 그래프 - 인원
	public List<Map<String,String>> empCountGraph(int entIndex);

	// 그래프 - 평균급여
	public List<Map<String,String>> avgPayGraph(int entIndex);
	
	public List<Map<String, String>> getEmpCntList();
	
	
	//팔로잉 기업 보기
	public List<Enterprise> getFollowsEntList(int memberIndex);

	
	
	
	
	
	
	
	

}
