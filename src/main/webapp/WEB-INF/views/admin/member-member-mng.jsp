<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script>
	function newPage() {	
		var url="mngMber?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()+"&keyword="+$("#keyword").val();		
		window.location=url;
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header">[ 회원 그룹 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-5">
									<label for="quantity">
									<input type="number" min="5" max="15" step="5" id="quantity" value="${viewData.msgPerPage}" 
									 onclick="newPage()">
									&nbsp; entries</label></div> 	
							<form action="mngMber" class="form-inline pull-right">
									<div class="input-group">
										<input type="hidden" name="page" value="${viewData.currentPage}">
										<input type="hidden" name="msgPerPage" value="${viewData.msgPerPage}">										
										<input type="text" name="keyword" class="form-control" id="keyword" value="${viewData.keyword}"
											size="20" placeholder="아이디를 입력해 주세요">							
										<div class="input-group-btn">
											<button type="submit" class="btn">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th style="width:3%">NO</th>
										<th style="width:10%">아이디</th>
										<th style="width:5%">구분</th>
										<th style="width:3%">상태</th>
									</tr>
								</thead>		
								<tbody>
								<c:forEach var="members" items="${viewData.boardList}">
									 <tr>
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
								</c:forEach>   
								</tbody>						
							</table>							  
						<div id="pagenation">
							<ul class="pagination pagination-sm">
								<c:if test="${viewData.startPage != 1}">	
									<li class="page-item"><a class="page-link"  aria-label="Previous" 
									 	href="mngMber?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
									<span aria-hidden='true'>&laquo;</span></a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
									<c:choose>
										<c:when test="${pageNum == viewData.currentPage}">
											<li class="page-item active" > <a class="page-link" 					
											href="mngMber?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">${pageNum}<span class="sr-only">(current)</span></a>
										</c:when>
										<c:otherwise>
											<li class="page-item"> <a class="page-link" href="mngMber?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}"
											>${pageNum}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${viewData.endPage < viewData.pageTotalCount}">
									<li class="page-item"><a class="page-link" href="mngMber?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
									<span aria-hidden='true'>&raquo;</span></a></li>
								</c:if>
							</ul> 
						</div>	
					</div>
						<div class="col-md-5" id="selectOneBox">
							<form class="form-horizontal" action="modifyMber" method="post">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">아이디</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="아이디" value="${member.mberId}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">비밀번호</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											placeholder="******" name="mberPw">
									</div>
								</div>
								<div class="form-group" style="text-align:right">
									<label for="mberType" class="type control-label" 
										style="margin-right: 15px">구분</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" id="mberType" name="mberType">
											<option value="" selected disabled hidden>
											<c:set var="name" value="${member.mberType}"/>
												<c:choose>
													<c:when test="${name.equals('ROLE_USER')}">일반 회원</c:when>
													<c:when test="${name.equals('ROLE_AUTHENTICATED')}">기업인증 회원</c:when>
													<c:otherwise>회원 구분</c:otherwise>
												</c:choose>
											</option>
											<option value="ROLE_USER">일반 회원</option>
											<option value="ROLE_AUTHENTICATED">기업인증 회원</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">가입날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate" id="regDate"
											placeholder="가입날짜" value="${member.regDate}">
									</div>
								</div>
								<div class="form-group">
									<label for="lastDate" class="col-sm-4 control-label">최근 방문날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="lastDate" id="lastDate"
											placeholder="최근 방문날짜" value="${member.lastDate}">
									</div>
								</div>
								<div class="form-group" style="text-align:right">
									<label for="mberFlag" class="control-label"
										style="margin-right: 15px">상태</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" style="color:gray" id="mberFlag" name="mberFlag">
											<option value="" selected disabled hidden>
											<c:set var="name" value="${member.mberFlag}"/>
												<c:choose>
													<c:when test="${name.equals('1')}">가입</c:when>
													<c:when test="${name.equals('2')}">탈퇴</c:when>
													<c:otherwise>회원 상태</c:otherwise>
												</c:choose>
											</option>
											<option value="1">가입</option>
											<option value="2">탈퇴</option>
										</select>
									</div>
								</div>
							<!-- 	<div class="form-group">
									<div class="col-sm-4 control-label" style="font-weight: bold">사용
										여부</div>
									<div class="col-offset-1 col-sm-3">
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio1" value="option1">
											사용
										</label>
									</div>
									<div>
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											미사용
										</label>
									</div>
								</div>
								<div style="border-bottom: 2px solid #ccc;"
									class="pull-right col-md-10"></div>
								<br/>

								<div class="form-group" style="text-align: right">
									<label for="Inputselect-label" class="control-label"
										style="margin-right: 15px">구매상품</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" style="color: gray">
											<option>구매상품1</option>
											<option>구매상품2</option>
											<option>구매상품3</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="startDate" class="col-sm-4 control-label">시작일</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="startDate"
											placeholder="시작일">
									</div>
								</div>
								<div class="form-group">
									<label for="endDate" class="col-sm-4 control-label">종료일</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="endDate"
											placeholder="종료일">
									</div>
								</div>
								<div class="form-group">
									<label for="certifiedCode" class="col-sm-4 control-label">기업인증
										코드 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="certifiedCode"
											placeholder="기업인증 코드">
									</div>
								</div> -->
							
								<div class="form-group pull-right" id="btnForm">							
										<input type="submit" class="btn btn-info" value="수정하기">
										<input type="reset" class="btn btn-warning" value="초기화">								
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->
</body>
</html>