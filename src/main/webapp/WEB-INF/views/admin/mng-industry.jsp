<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
		margin-bottom: 50px;
	}
	#keyword{
		height:28px;
	}
	#indutyBox{
		height:500px; 
		overflow:scroll; 
		background-color:rgb(235, 232, 232); 
		border: 1px solid gray;
		padding:20px;
		 border-radius: 4px;
	}
	#indutyForm{
		margin-top:50px;
	}
	
	#indutyForm label{
		font-size:15px;
	}
	
	#indutyName{
		text-align:center; 
		border-bottom:1px dotted black;
		margin-bottom:20px;
		font-size:17px;
	}
</style>
<script>
	function ITFunc() {
		$(this)
		$("#IT").attr("checked",true)
	    if ($("#IT").attr("checked") == "checked"){
	    	$("#ITBox").css("display","none");

	    } else {
	    	$("#ITBox").css("display","block");
	    }
	}
	function constructFunc() {	
	    if ($("#construction").attr("checked",true)){
	    	$("#constructionBox").css("display","block");
	    } else {
	    	$("#constructionBox").css("display","none");
	    }
	}
</script>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header">[ 산업군 분류 관리 ]</h1><br>
				<div class="col-md-offset-1">
					<div class="col-md-11">
						<div class="row">			
							<div class="col-md-4">
								<div id="indutyBox">
									<div id="indutyName">1차 산업군</div>						
								  <div>
						              <input type="radio" id="IT" name="lclass" onclick="ITFunc()"/>
						              <label for="IT"> IT/웹/통신</label>
						        </div>
								  <div>
						              <input type="radio" id="construction" name="lclass" onclick="constructFunc()"/>
						              <label for="it"> 건설업</label>
						          </div>
								  <div>
						              <input type="radio" id="education" name="lclass"/>
						              <label for="it"> 교육업</label>
						          </div>
						          <div>
						              <input type="radio" id="finance" name="lclass"/>
						              <label for="it"> 은행/금융업</label>
						          </div>
						          <div>
						              <input type="radio" id="society" name="lclass"/>
						              <label for="it"> 기관/협회</label>
						          </div>
						          <div>
						              <input type="radio" id="design" name="lclass"/>
						              <label for="it"> 미디어/디자인</label>
						          </div>
						          <div>
						              <input type="radio" id="service" name="lclass"/>
						              <label for="it"> 서비스업</label>
						          </div>	
								 <div>
						              <input type="radio" id="distribution" name="lclass"/>
						              <label for="it"> 유통/무역/운수</label>
						          </div>
						          <div>
						              <input type="radio" id="medical" name="lclass"/>
						              <label for="it"> 의료/제약/복지</label>
						          </div>
						          <div>
						              <input type="radio" id="production" name="lclass"/>
						              <label for="it"> 제조/화학</label>
						          </div>							 	
								</div>
								<div class="row" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>										
							</div>			
						<div class="col-md-4">						 	
							<div id="indutyBox">			
								<div id="indutyName">2차 산업군</div>
								
							<div id="ITBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 네트워크/통신/모바일</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 포털/인터넷/콘텐츠</label>
						          </div>
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> IT컨설팅</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 게임</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 기타 IT/웹/통신</label>
						          </div>		 	
							</div>
							
							<div id="constructionBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 건설/건축/토목</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 실내/인테리어/조경</label>
						          </div>
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 부동산/임대/중개</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 기타 건설업</label>
						          </div>		 	
							</div>
							
							<div id="educationBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 학원/어학원</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 전문/기능학원</label>
						          </div>		 	
							</div>
							
							<div id="societyBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 연구소/컨설팅/조사</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 회계/세무/법무</label>
						          </div>
							</div>
								
								<div id="designBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 광고/홍보/전시</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 디자인/설계</label>
						          </div>
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 방송사/케이블</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 게임</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 기타 IT/웹/통신</label>
						          </div>		 	
							</div>
							
							<div id="serviceBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> AS/카센터/주유</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 레저/스포츠/여가</label>
						          </div>
								<div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 렌탈/임대</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 뷰티/미용</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 시설관리/용역/헤드헌팅</label>
						          </div>	
						           <div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 외식업/식음료</label>
						          </div>
						           <div>
						              <input type="radio" id="it" name="lclass"/><label for="it"> 웨딩/장례/이벤트</label>
						          </div> 	
							</div>
							
							<div id="designBox" style="display:none">								
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 광고/홍보/전시</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 디자인/설계</label>
						          </div>
								<div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 방송사/케이블</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 게임</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="lclass"/>
						              <label for="it"> 기타 IT/웹/통신</label>
						          </div>		 	
							</div>
								
						</div>
								
													
									<div class="row" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>
							</div>
								
								
								<div class="col-md-4">
								<div id="indutyBox" style="height:250px">								 	
									<div id="indutyName">분류 코드</div>
										
								</div>
								
								<div id="indutyForm">
								
								<form class="form-horizontal" action="modifyMber" method="post">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">1차 산업군 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="분류명" value="${member.mberId}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">2차 산업군 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="분류명" value="${member.mberId}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">분류 코드</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" name="mberPw"
											placeholder="분류 코드" value="${member.mberPw}">
									</div>
								</div>
							
								
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">등록일자</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate"
											placeholder="등록일자" value="${member.regDate}">
									</div>
								</div>
							</form>
							<br>
							<div class="pull-right">
								<input type="button" class="btn btn-info" value="수정하기">
								<input type="button" class="btn btn-primary" value="추가하기">
								<input type="button" class="btn btn-warning" value="초기화">
							</div> 
						</div>
					
	
							<%-- <form class="form-horizontal" action="modifyMber" method="post">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">분류명 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="분류명" value="${member.mberId}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">분류 코드</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" name="mberPw"
											placeholder="분류 코드" value="${member.mberPw}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">정렬 우선순위</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" name="mberPw"
											placeholder="정렬 우선순위" value="${member.mberPw}">
									</div>
								</div>
								
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">등록일자</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate"
											placeholder="등록일자" value="${member.regDate}">
									</div>
								</div>
							</form>
							<br>
							<div class="pull-right">
								<input type="button" class="btn btn-info" value="수정하기">
								<input type="button" class="btn btn-primary" value="추가하기">
								<input type="button" class="btn btn-warning" value="초기화">
							</div> --%>
						
					</div>
				</div>
			</div>
		</div>
	</div>					
</body>
</html>