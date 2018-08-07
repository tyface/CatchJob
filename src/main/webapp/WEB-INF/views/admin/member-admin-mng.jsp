<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>

<body>
		<%@ include file="/WEB-INF/views/admin/admin-nav-sidebar.jsp"%> 
	<div class="col-md-9 main" id="content">
				<h1 class="page-header"
					style="text-align: center; font-weight: bold;">[ 관리자 그룹 관리 ]</h1>
				<br>
				<div class="col-md-offset-1">
					<div class="row" style="margin: 20px">
						<div class="col-md-6">
							<div class="row">
									<select class="col-md-2" style="width: 90px; height: 25px">
										<option>5</option>
										<option>10</option>
										<option>15</option>
										<option>20</option>
									</select>
								<div class="col-md-2">entries</div>

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
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>아이디</th>
										<th>권한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach begin="1" end="10">
										<tr>
											<td>1</td>
											<td>test_admin@google.com</td>
											<td>lever3</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="text-align: center">
								<ul class="pagination pagination-sm">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
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

								<div class="form-group" style="text-align: right">
									<label for="Inputselect-label" class="control-label"
										style="margin-right: 15px">권한</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" style="color: gray">
											<option>level1</option>
											<option>level2</option>
											<option>level3</option>
										</select>
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
			</div><!-- div id="content" end -->
			
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->
</div>
</body>
</html>