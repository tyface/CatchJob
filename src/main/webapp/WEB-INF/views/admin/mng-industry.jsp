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

#indutyDiv {
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
 		$("input:radio[name='catagory']:radio[value='"+getParameterByName('largeCatagory')+"']").prop('checked',true)
		 if(getParameterByName('industryCode')!=null){	
			$("input:radio[name='code']:radio[value='"+getParameterByName('industryCode')+"']").prop('checked',true)
			  var test = $("input:radio[name='code']:radio[value='"+getParameterByName('industryCode')+"']")
			 test.prop('checked',true)
			 
			 console.log($("input:radio[name='code']:radio[value='"+getParameterByName('industryCode')+"']"));
			 console.log($("input:radio[name='catagory']:radio[value='"+getParameterByName('largeCatagory')+"']"));
			  
		}	 
	}	  	 
});
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
							<div id="indutyDiv">분류명</div>
							<c:forEach var="industry" items="${viewData}">
								<div>
									<label>
									<input type="radio" id="catagory" name="catagory"
										onclick="window.location.href='mngIndustryCode?largeCatagory=${industry.largeCatagory}'" 
										value="${industry.largeCatagory}"/>
									${industry.largeCatagory}.${industry.largeCatagoryName}</label>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-4">
						<div id="indutyBox">
							<div id="indutyDiv">업종 코드</div>
								<c:forEach var="industryCode" items="${industryCode}">
									<div>
										<label>
										<input type="radio" id="code" name="code" value="${industryCode.industryCode}"
											onclick="window.location.href='mngIndustryCodeDetails?largeCatagory=${industryCode.largeCatagory}&industryCode=${industryCode.industryCode}'"/>
										${industryCode.industryCode}</label>
									</div>					
								</c:forEach>
						</div>
					</div>
					<div class="col-md-4">
						<div id="indutyForm">
							<form class="form-horizontal" action="modifyInduty" method="post">
								<div class="form-group">
									<label for="largeCatagory" class="col-sm-4 control-label">분류코드
									</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="largeCatagory"
											placeholder="2자리 수를 입력해 주세요" value="${industryDetails.largeCatagory}">
									</div>
								</div>
								<div class="form-group">
									<label for="largeCatagoryName" class="col-sm-4 control-label">분류명
									</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="3" cols="50" name="largeCatagoryName" 
										placeholder="분류명">${industryDetails.largeCatagoryName}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="industryCode" class="col-sm-4 control-label">업종코드</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" readOnly="readOnly"
											name="industryCode" placeholder="업종코드" value="${industryDetails.industryCode}">
									</div>
								</div>
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">등록일자</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate"
											placeholder="등록일자" value="${industryDetails.regDate}">
									</div>
								</div>
							<br>
							<div class="pull-right">
								<input type="submit" class="btn btn-info" value="수정하기">
								<input type="button" class="btn btn-primary" value="추가하기" data-toggle="modal" data-target="#registIndutyModal">
							</div>
							</form>
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
								<form action="registIndustry" method="post">
									<div class="modal-body">
										<div class="row form-group">
											<div class="col-xs-3 form-group">
												<label for="largeCatagory" class="control-label">분류 코드</label>
											</div>
											<div class="col-xs-9">
												<input type="text" id="largeCatagory" name="largeCatagory"
													class="form-control" placeholder="2자리 수를 입력해 주세요">
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
													class="form-control" placeholder="6자리 수를 입력해 주세요"/>
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