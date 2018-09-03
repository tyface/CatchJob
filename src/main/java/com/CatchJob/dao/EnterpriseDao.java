package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Enterprise;

@Repository
public interface EnterpriseDao {

	// 기업이름으로 찾기
	public List<Enterprise> selectListEnt(Map<String, String> data);
	
	// 기업 찾기
	//	public Enterprise selectEnt(int entIndex);

	public List<Map<String,String>> selectListEmpCntRank(int viewCount);
	
	// 기업식별 번호로  기업 정보 가져오기 -VIEW page
	public Map<String,String> selectEntInfo(Map<String, String> data);
	
	// 기업정보의 그래프 만들기 위해 필요한 데이터 
	public  List<Map<String,String>>  selectGraphInfo(int entIndex);
	
	
	//팔로잉 기업 보기
	public List<Enterprise> selectListEntByMember(int memberIndex);
	//	//TODO 최근 본 기업 보기 
	public List<Enterprise> selectListEntRecent(Map<String, Integer> mapData);

	//관리자 페이지 페이징 처리+검색
	public int selectCountByKeyword(Map<String, Object> map);

	public List<Enterprise> selectEntList(Map<String, Object> map);
	//기업 수정
	public int updateEnt(Enterprise ent); 
	//기업 하나 선택
	public Enterprise selectEnt(int entIndex); 
	
	//기업 평균정보 가져오기 (최근 12개월)
	public Map<String,String> selectEntBaseInfo(int entIndex);
	
	//동종 산업군 평균정보 가져오기 (최근 12개월)
	public Map<String, String> selectPeerIndustryAvgInfo(int entIndex);
	
	//전체 산업군 평균정보 가져오기 (최근 12개월)
	public Map<String, String> selectTotalAvgInfo();
	
}
