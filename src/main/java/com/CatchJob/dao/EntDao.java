package com.CatchJob.dao;

//기업정보, 그래프 출력(ENTERPRISE_TB, NPN_DTLS_TB 이용)
import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.NationalPension;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface EntDao {
	// 검색한 기업 리스트 출력
	public List<Enterprise> searchEntList(String entName);

	// 기업정보 : 검색 후 기업 선택(출력 : 주소, 인원, 업력, 입사, 퇴사, 총매출액, 1인당 매출액, 매출액 대비 입금금액, 올해입사자
	// 평균연봉, 평균연봉..)
	public Enterprise selectEnt(int entIndex);

	// 그래프 - 인원(국민연금 총 가입자수,국민연금 신규 가입자수,국민연금 가입 해지자수 반환)
	public NationalPension empCountGraph(int entIndex);

	// 그래프 - 평균급여(납입날짜, 납입금액 반환)
	public NationalPension avgPayGraph(int entIndex);

}
