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
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
	
			<div class="col-md-9 main">
				<h1 class="page-header"
					style="text-align: center; font-weight: bold;">[ FAQ 관리 ]</h1>
				<br>
				<div class="col-md-offset-1">
					<div class="row" style="margin: 20px">

							<div class="row">
								<div class="col-sm-5">
									<label for="quantity">
									<input type ="number" min="5" max="20" value="10" step="5" id="quantity" style="width: 90px; height: 25px"></label>
								entries
								</div> 
						
								<div class="row">
								<div class="col-xs-2">
									<select>
										<option>제목</option>
										<option>작성자</option>
									</select>
								</div>
								<form action="search" class="form-inline col-xs-4">
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
				
							</div>
							<br>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일자</th>
										<th>답글여부</th>
										<th>표출여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach begin="1" end="10">
										<tr>
											<td>1</td>
											<td>문의 사항 입니다</td>
											<td>tester</td>
											<td>2018-08-08</td>
											<td>N</td>
											<td>Y</td>
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