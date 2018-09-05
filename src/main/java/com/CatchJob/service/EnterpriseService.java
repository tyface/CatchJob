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
	
	// 그래프 - 인원 TODO 사용하는지 확인 후 삭제
	public List<Map<String,String>> empCountGraph(int entIndex);

	// 그래프 - 평균급여
	public List<Map<String,String>> avgPayGraph(int entIndex);
	
	public List<Map<String, String>> getEmpCntList();
	
	

	
//	 최근 본 기업 보기 //RecentSercive
	public List<Enterprise> getRecentEntList(Map<String, Integer> mapData);
	
	//동종산업군, 전체 산업군 평균정보 가져오기
	public Map<String, String> getIndustryAvgInfo(int entIndex);
	
	//관리자 페이지
	public Map<String, Object> getMessageList(Map<String, Object> data);
	
	public int calPageTotalCount(int totalCount, int numOfMsgPage);
	
	public int getStartPage(int pageNum);
	
	public int getEndPage(int pageNum);
	//기업 수정
	public boolean modifyEnt(Enterprise ent);
    //기업 하나 선택 TODO get으로 이름바꾸고 사용하는지 확인할거쇼
	public Enterprise getEnt(int entIndex);
}	
	
	

