<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp" %>


<article class="text-left">

	<div class="container">
		<div class="contents-wrap">
		<h1 id="title" class="godo-font main-color">FAQ</h1>
		<!--   <h2>연봉 정보</h2> -->
		    <div class="panel-group" id="accordion">
		 	   <h2 class="godo-font " ><small><b>연봉 정보</b></small></h2>
			   <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed"  data-toggle="collapse" data-parent="#accordion" href="#collapse1">평균연봉은 어떻게 산출하나요?</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse ">
			        <div class="panel-body ">해당 회사의 국민연금 납부액 또는 고용보험 납부액과 납부인원수를 역산하여 계산합니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2">국민연금은 월 납부액의 따른 상한액이 있습니다. </a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body">고용보험은 상한액 없이 회사가 납부한 금액과 인원으로 추정하기 때문에 구글코리아 같이 연봉이 높을 것이라 기대한 회사의 급여가 비교적 정확하게 나올 수 있습니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3">정규직에 대한 정보만 나오는 건가요? </a>
			        </h4>
			      </div>
			      <div id="collapse3" class="panel-collapse collapse">
			        <div class="panel-body">아닙니다. 크레딧잡의 데이터는 해당 사업장에 종사하는 모든 인원에 대한 평균입니다. 따라서, 계약직과 아르바이트 등을 포함합니다. 단, 파견 및 도급직 등은 포함되지 않습니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4">제가 알고있는 인원 수와 나와 있는 정보가 달라요.</a>
			        </h4>
			      </div>
			      <div id="collapse4" class="panel-collapse collapse">
			        <div class="panel-body">국민연금 신고기준이므로 실제 일하시는 분들의 수와 다를 수 있습니다. 파견 / 도급 등은 포함되지 않고 계약직과 정규직을 모두 포함합니다. 60시간 미만을 근로하는 단시간(일용)근로자 및 60세 이상 근로자는 당연가입대상에서 제외되기 때문에 다를 수 있습니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse5">아는 회사가 검색이 되지 않아요. </a>
			        </h4>
			      </div>
			      <div id="collapse5" class="panel-collapse collapse">
			        <div class="panel-body">크레딧잡에서 제공되는 기업은 국민연금을 3인 이상 납부하는 사업장입니다. 검색시 나오지 않는다면 국민연금에 신고된 이름이 다를 수 있습니다. 또한 스타트업 같은 경우, 서비스명과 법인명(사업장명)이 달라 검색이 안 될 수도 있습니다. 개인사업자 정보는 제공되지 않습니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse6">학교나 군부대는 국민연금을 내지 않는데도 검색이 돼요.</a>
			        </h4>
			      </div>
			      <div id="collapse6" class="panel-collapse collapse">
			        <div class="panel-body">사립학교 교직원 또는 교사(교수)의 경우, 사학연금을 냅니다. 공립학교의 경우에는 공무원 연금을, 군인은 군인연금을 냅니다. 저희 사이트에서 조회되는 학교 등의 경우에는 해당학교에서 국민연금을 내는 인원에 대한 정보입니다.</div>
			      </div>
			    </div>
			  
			<!-- // -->
			<!--   <h2>기업 정보</h2> -->
			    <br>
			    <h2 class="godo-font"><small><b>기업 정보</b></small></h2>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse7">입사율, 퇴사율은 어떻게 산출하나요? </a>
			        </h4>
			      </div>
			      <div id="collapse7" class="panel-collapse collapse">
			        <div class="panel-body">입사율 및 퇴사율은 업데이트 기준월의 총 인원과 이로부터 이전 12개월 동안의 입사, 퇴사인원합계의 비율을 계산하여 산출합니다.</div>
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a class="collapsed-evt collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse8">기업현황 에서는 어떤 정보를 볼 수 있나요? </a>
			        </h4>
			      </div>
			      <div id="collapse8" class="panel-collapse collapse">
			        <div class="panel-body">궁금한 지역과 업종, 기간을 선택하시면 해당 기업들의 통계 현황과 상세기업 리스트를 볼 수 있습니다.</div>
			      </div>
			    </div>
		    
		  
			</div>
	
		</div>
	</div>
</article>


<%@ include file="include/footer.jsp" %>