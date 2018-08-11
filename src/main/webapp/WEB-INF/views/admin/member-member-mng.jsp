<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:set var="quantity" var='${quantity}' /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
	}
	#quantity{
		width: 90px; 
		height: 25px";
	}
</style>
<script>
function newPage(num) {
	var url="mngMber?msgPerPage="+$("#quantity").val();
/* 	var url=new Array();
	url[0]="http://www.htmlforums.com";
	url[1]="http://www.codingforums.com.";
	url[2]="http://www.w3schools.com";
	url[3]="http://www.webmasterworld.com";
	window.location=url[num];`` */
		window.location=url;
}
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header" style="margin-bottom: 50px">[ 회원 그룹 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-5">
									<label for="quantity">
									<input type="number" min="5" max="20" value="10" step="5" id="quantity"
									 onclick="newPage()">
									&nbsp; entries</label></div> 	

								<form action="search" class="form-inline pull-right">
									<div class="input-group">
										<input type="text" name="keyword" class="form-control"
											size="20" style="height: 28px">
										<div class="input-group-btn">
											<button type="button" class="btn">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
							<table class="table table-striped table-hover" id="pagenated">
									<tr>
										<th>NO</th>
										<th>아이디</th>
										<th>구분</th>
									</tr>
								<c:forEach var="member" items="${viewData.boardList}">
									 <tr>	
										<td>${member.mberIndex}</td>
										<td><a href="mngMber?num=${member.mberIndex}
										">${member.mberId}</a></td>
										<td>${member.mberType}</td> 
									</tr> 
									</c:forEach>   
							
							</table>

				  <%@ include file = "include/pagination.jsp" %>		
						</div>

						<div class="col-md-5 pull-right">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="id" class="col-sm-4 control-label">아이디</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="아이디">
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-4 control-label">비밀번호</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password"
											placeholder="비밀번호">
									</div>
								</div>
								<div class="form-group">
									<label for="text" class="col-sm-4 control-label">구분</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="classification"
											placeholder="구분">
									</div>
								</div>
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">가입날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="regDate"
											placeholder="가입날짜">
									</div>
								</div>
								<div class="form-group">
									<label for="lastDate" class="col-sm-4 control-label">최근
										방문날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="lastDate"
											placeholder="최근 방문날짜">
									</div>
								</div>
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
								</div>


								<div class="form-group">
									<div class="col-sm-offset-8 col-sm-6">
										<button type="button" class="btn btn-info">수정하기</button>
										<button type="button" class="btn btn-warning">초기화</button>

									</div>
								</div>
							</form>
						</div>
				</div>
			</div>
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->

</body>
</html>