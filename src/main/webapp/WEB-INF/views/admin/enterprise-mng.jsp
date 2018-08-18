<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	select {
		width: 190px;
		height: 20px;
	}
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
		margin-bottom: 50px;
	}
	#quantity{
		width: 90px; 
		height: 25px;
		border-radius:4px;
		border-line: 1px solid #ccc;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	}

	#pagenation{
		text-align:center;
	}
	table{
		margin-top:20px;	
        table-layout: fixed;
        word-wrap: break-word;
    }

    table th, table td {
        overflow: hidden;
	}
	select{
		height:27px;
		border-radius:4px;
		border-line: 1px solid #ccc;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-md-9 main">
		<h1 class="page-header">[ 기업 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="row">
				<div class="col-sm-6">
					<label for="quantity"> <input type="number" min="5"
						max="15" step="5" id="quantity" value="${viewData.msgPerPage}"
						onclick="newPage()">&nbsp; entries
					</label>
				</div>	
				<div class="col-sm-2">
					<select>
						<option>기업명</option>
						<option>기업코드</option>
					</select>
				</div>
				<form action="search" class="form-inline col-sm-3">
					<div class="input-group">
						<input type="text" name="keyword" class="form-control" size="30"
							style="height: 28px" placeholder="검색어를 입력해 주세요">
						<div class="input-group-btn">
							<button type="button" class="btn">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form>
				<button type="button" class="btn btn-primary btn-sm">추가하기</button>
			</div>	
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
								<td><input class="btn btn-info btn-sm" type="button" value="내용보기"></input></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="pagenation">
						<ul class="pagination pagination-sm">
							<c:if test="${viewData.startPage != 1}">
								<li class="page-item"><a class="page-link"
									aria-label="Previous"
									href="mngMber?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
										<span aria-hidden='true'>&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${viewData.startPage}"
								end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
								<c:choose>
									<c:when test="${pageNum == viewData.currentPage}">
										<li class="page-item active"><a class="page-link"
											href="mngMber?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">${pageNum}<span
												class="sr-only">(current)</span></a>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="mngMber?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${viewData.endPage < viewData.pageTotalCount}">
								<li class="page-item"><a class="page-link"
									href="mngMber?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keyword=${viewData.keyword}">
										<span aria-hidden='true'>&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</div>
			
		
	</div>
	<!--<div class="row"> end -->
</div>
<!--<div class="container-fluid"> end -->

</body>
</html>