<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
.row {
	padding: 15px;
}

.page-header {
	text-align: center;
	font-weight: bold;
	margin-bottom: 50px;
}

#keyword {
	height: 28px;
}

#indutyBox {
	height: 500px;
	overflow: scroll;
	background-color: rgb(235, 232, 232);
	border: 1px solid gray;
	padding: 20px;
	border-radius: 4px;
}

#indutyForm {
	margin-top: 50px;
}

#indutyForm label {
	font-size: 15px;
}

#indutyName {
	text-align: center;
	border-bottom: 1px dotted black;
	margin-bottom: 20px;
	font-size: 17px;
}

#industryBtns {
	text-align: center;
}
</style>
<script>
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(function(){
	if(getParameterByName('largeCatagory')!=null){
		$("#catagory").prop("checked", true)
		if(getParameterByName('industryCode')!=null){	
			$("#industryCode").prop("checked", true)
		}	
	}	 
});
function lclassFunc() {

	
	/* $(this).attr("checked", true)
	if ($(this).attr("checked")=="checked") {
		$("#indutyCodeBox").css("display", "none");
	} else {
		$("#indutyCodeBox").css("display", "block");
	} */
}
function constructFunc() {
	if ($(this).attr("checked", true)) {
		$("#constructionBox").css("display", "block");
	} else {
		$("#constructionBox").css("display", "none");
	}
}
</script>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-sm-9 main">
		<h1 class="page-header">[ 산업군 분류 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="col-md-11">
				<div class="row">
					<div class="col-md-4">
						<div id="indutyBox">
							<div id="indutyName">분류명</div>
							<c:forEach var="industry" items="${viewData}">
								<div>
									<input type="radio" id="catagory" name="catagory"
										onclick="window.location.href='mngIndustryCode?largeCatagory=${industry.largeCatagory}'" />
									<label for="class"> ${industry.largeCatagory}.
										${industry.largeCatagoryName}</label>
								</div>
							</c:forEach>
						</div>
						<!-- <div class="row" id="industryBtns">
							<input type="button" class="btn btn-info" data-toggle="modal" data-target="#registCatagoryModal" value="분류 추가">
							<input type="button" class="btn btn-warning" value="선택 미사용">
						</div> -->
					</div>
					<div class="col-md-4">
						<div id="indutyBox">
							<div id="indutyName">업종 코드</div>
							<div id="indutyCodeBox">
								<c:forEach var="industryCode" items="${industryCode}">
									<input type="radio" id="industryCode" name="industryCode"
										onclick="window.location.href='mngIndustryCodeDetails?largeCatagory=${industryCode.largeCatagory}&industryCode=${industryCode.industryCode}'" />
									<label for="industryCode">${industryCode.industryCode}</label>
									<br>
								</c:forEach>
							</div>
						</div>
						<!-- <div class="row" id="industryBtns">
							<input type="button" class="btn btn-info" data-toggle="modal" data-target="#registCodeModal" value="코드 추가">
							<input type="button" class="btn btn-warning" value="선택 미사용">
						</div> -->
					</div>


					<div class="col-md-4">
						<div id="indutyForm">
							<form class="form-horizontal" action="modifyInduty" method="post">
								<div class="form-group">
									<label for="largeCatagory" class="col-sm-4 control-label">분류코드
									</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="largeCatagory"
											placeholder="분류코드"<%-- value="${industryDetails.largeCatagory}" --%>>
									</div>
								</div>
								<div class="form-group">
									<label for="largeCatagoryName" class="col-sm-4 control-label">분류명
									</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											name="largeCatagoryName" placeholder="분류명"<%--  value="${industryDetails.largeCatagoryName}" --%>>
									</div>
								</div>
								<div class="form-group">
									<label for="industryCode" class="col-sm-4 control-label">업종코드</label>
									<div class="col-sm-8">
										<input type="password" class="form-control"
											name="industryCode" placeholder="업종코드"<%-- value="${industryDetails.industryCode}" --%>>
									</div>
								</div>
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">등록일자</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate"
											placeholder="등록일자"<%--  value="${industryDetails.regDate}" --%>>
									</div>
								</div>
							</form>
							<br>
							<div class="pull-right">
								<input type="submit" class="btn btn-info" value="수정하기">
								<input type="button" class="btn btn-primary" value="추가하기" data-toggle="modal" data-target="#registIndutyModal">
								<input type="button" class="btn btn-danger" value="선택 미사용">
							</div>
						</div>
					</div>

				<!-- 분류 등록하기 modal -->
					<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"
						id="registIndutyModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="modalLabel">등록하기</h4>
								</div>
								<form action="registCatagory" method="post">
									<div class="modal-body">
										<div class="row form-group">
											<div class="col-xs-3 form-group">
												<label for="largeCatagory" class="control-label">분류 코드</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="largeCatagory" name="largeCatagory"
													class="form-control" placeholder="2자리 수로 입력해 주세요">
											</div>
										</div>
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="largeCatagoryName" class="control-label">분류명</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="largeCatagoryName" name="largeCatagoryName"
													class="form-control" placeholder="분류명을 입력해 주세요"/>
											</div>
										</div>
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="industryCode" class="control-label">업종코드</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="industryCode" name="industryCode"
													class="form-control" placeholder="업종코드를 입력해 주세요"/>
											</div>
										</div>
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="regDate" class="control-label">등록일자</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="regDate" name="regDate"
													class="form-control" placeholder="등록일자를 입력해 주세요"/>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">등록하기</button>
										<button type="reset" class="btn btn-warning">초기화</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 코드 등록하기 modal -->
					<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"
						id="registCodeModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="modalLabel">업종코드 추가</h4>
								</div>
								<form action="registDomain" method="post">
									<div class="modal-body">
										<div class="row form-group">
											<div class="col-xs-3 form-group">
												<label for="domainName" class="control-label">업종 코드</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="domainName" name="domainName"
													class="form-control">
											</div>
										</div>									
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">등록하기</button>
										<button type="reset" class="btn btn-warning">초기화</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>