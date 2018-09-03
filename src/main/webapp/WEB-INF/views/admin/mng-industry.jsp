<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<div id="indutyName">대분류명</div>						
									 
									 
									  <c:forEach var="industry" items="${viewData}">								 
										<div>
							              <input type="radio" id="IT" name="lclass" onclick="ITFunc()"/>
							              <label for="IT">${industry.largeCatagory}. ${industry.largeCatagoryName}</label>
								      	</div>
									 	
									 </c:forEach>
									 
				<%-- 					 <c:forEach var="members" items="${viewData.boardList}">
									 	
										<td>${members.mberIndex}</td>
										<td><a href="mngMber?page=${viewData.currentPage}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}&num=${members.mberIndex}
										">${members.mberId}</a></td>
										<td>
											<c:set var="name" value="${members.mberType}"/>
											<c:if test="${name.equals('ROLE_USER')}">일반 회원</c:if>
											<c:if test="${name.equals('ROLE_AUTHENTICATED')}">기업인증 회원</c:if>										
										</td> 
										<td>
											<c:set var="name" value="${members.mberFlag}"/>
											<c:if test="${name.equals('1')}">가입</c:if>
											<c:if test="${name.equals('2')}">탈퇴</c:if>	
										</td>
										</tr> 
									</c:forEach>    --%>
									 
									 
									 
						         			 	
								</div>
								<div class="row" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>										
							</div>			
						<div class="col-md-4">						 	
							<div id="indutyBox">			
								<div id="indutyName">업종 코드</div>
							
								
						</div>
							
												
							<div class="row" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>
						</div>
								
								
							<div class="col-md-4">

								
								<div id="indutyForm">
								
								<form class="form-horizontal" action="modifyMber" method="post">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">대분류명 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="분류명" value="${member.mberId}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">업종코드</label>
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
					
	
					</div>
				</div>
			</div>
		</div>
	</div>					
</body>
</html>