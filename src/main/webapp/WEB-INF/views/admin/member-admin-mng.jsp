<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script>
	function newPage() {	
		var url="mngAdmin?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()
				+"&keyword="+$("#keyword").val();		
		window.location=url;
	}
</script>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header">[ 관리자 그룹 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-5">
									<label for="quantity">
									<input type="number" min="5" max="15" step="5" id="quantity" value="${viewData.msgPerPage}" 
									 onclick="newPage()">
									&nbsp; entries</label></div> 	
								<form action="mngAdmin" class="form-inline pull-right">
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
										<th style="width:8%">아이디</th>
										<th style="width:4%">권한</th>
									</tr>
								</thead>
								<tbody>
									 <c:forEach var="admin" items="${viewData.boardList}">
										 <tr>	
										<td>${admin.mberIndex}</td>
										<td><a href="mngAdmin?page=${viewData.currentPage}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}&num=${admin.mberIndex}							
										">${admin.mberId}</a></td>
										<td>
											<c:set var="name" value="${admin.mberType}"/>											
											<c:if test="${name.equals('ROLE_ADMIN')}">Level1</c:if>
											<c:if test="${name.equals('ROLE_MASTER')}">Level2</c:if>	
										</td> 
										</tr> 
									</c:forEach> 
								</tbody>
							</table>				
							<div id="pagenation">
							<ul class="pagination pagination-sm">
								<c:if test="${viewData.startPage != 1}">	
									<li class="page-item"><a class="page-link"  aria-label="Previous" 
									 	href="mngAdmin?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
									<span aria-hidden='true'>&laquo;</span></a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
									<c:choose>
										<c:when test="${pageNum == viewData.currentPage}">
											<li class="page-item active" > <a class="page-link" 					
											href="mngAdmin?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">${pageNum}<span class="sr-only">(current)</span></a>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="mngAdmin?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}"
											>${pageNum}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${viewData.endPage < viewData.pageTotalCount}">
									<li class="page-item"><a class="page-link" href="mngAdmin?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
									<span aria-hidden='true'>&raquo;</span></a></li>
								</c:if>
							</ul> 
						</div>	
						</div>
						<div class="col-md-5" id="selectOneBox">
							<form class="form-horizontal" method="post" action="modifyAdmin">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">아이디</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId" id="mberId"
											placeholder="아이디" value="${admin.mberId}" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">비밀번호</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="mberPw" style="margin-bottom:0"
											placeholder="비밀번호" >
						
									</div>
								</div>
								<div class="form-group" style="text-align:right">
									<label for="mberType" class="control-label" style="margin-right:15px; margin-top:3px">권한</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" id="mberType" name="mberType">
											<option value="" selected disabled hidden>
											<c:set var="name" value="${admin.mberType}"/>
												<c:choose>
													<c:when test="${name.equals('ROLE_ADMIN')}">level1</c:when>
													<c:when test="${name.equals('ROLE_MASTER')}">level2</c:when>
													<c:otherwise>권한</c:otherwise>
												</c:choose>
											</option>
											<option value="ROLE_ADMIN">level1</option>
											<option value="ROLE_MASTER">level2</option>
										</select>
									</div>
								</div> 
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">가입날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="regDate" name="regDate"
											placeholder="가입날짜" value="${admin.regDate}">
									</div>
								</div>
								<div class="form-group">
									<label for="lastDate" class="col-sm-4 control-label">최근
										방문날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="lastDate" name="lastDate"
											placeholder="최근 방문날짜" value="${admin.lastDate}">
									</div>
								</div>
								<input type="hidden" name="mberPw" value="${admin.mberPw}">
								<!-- </div>
								<div class="form-group">
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
								</div>-->							
								<div class="form-group pull-right" id="btnForm">							
										<input type="submit" class="btn btn-info" value="수정하기">
										<input type="reset" class="btn btn-warning" value="초기화">								
								</div>
							</form>
						</div>
				</div>
			</div><!-- div id="content" end -->			
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->
</body>
</html>