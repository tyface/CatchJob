<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	select{
	width: 190px; 
	height: 25px;
	
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/admin-nav-sidebar.jsp"%> 
	
			<div class="col-md-9 main">
				<h1 class="page-header"
					style="text-align: center; font-weight: bold;">[ 기업 관리 ]</h1>
				<br>
				<div class="col-md-offset-1">
					<div class="row" style="margin: 20px">
				

					
					
						<div class="row">
									<select class="col-md-3" style="width: 90px; height: 25px">
										<option>5</option>
										<option>10</option>
										<option>15</option>
										<option>20</option>
									</select>
								<div class="col-md-1">entries</div>
						
								<div class="col-md-offset-4 col-xs-2">
									<select>
										<option>기업명</option>
										<option>기업코드</option>
									</select>
								</div>
								<form action="search" class="form-inline col-xs-3">
									<div class="input-group">
										<input type="text" name="keyword" class="form-control"
											size="30" style="height: 28px" placeholder="검색어를 입력해 주세요">
										<div class="input-group-btn">
											<button type="button" class="btn">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</form>
								<button type="button" class="btn btn-primary btn-sm col-xs-1">추가하기</button>

							</div>
							<br>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>작성자</th>
										<th>기업명</th>
										<th>기업코드</th>
										<th>내용보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach begin="1" end="5">
										<tr>
											<td>1</td>
											<td>tester</td>
											<td>비트컴퍼니</td>
											<td>COM000000001</td>
											<td><input class="btn btn-info" type="button" value="내용보기"></input></td>
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

				</div>
			</div>
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->

</body>
</html>