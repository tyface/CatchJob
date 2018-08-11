<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<div class="pagination" id="pagination">
		<ul class="pagination pagination-sm">
			<c:if test="${viewData.startPage != 1}">	
				<li class="page-item"><a class="page-link"  aria-label="Previous"
				 	href="mngMber?page=${viewData.startPage-1}">
				이전</a></li>
			</c:if>
			<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
				<c:choose>
					<c:when test="${pageNum == viewData.currentPage}">
						<li class="page-item active" > <a class="page-link" 						
						href="mngMber?page=${pageNum}">${pageNum}<span class="sr-only">(current)</span></a>
					</c:when>
					<c:otherwise>
						<li class="page-item"> <a class="page-link" href="mngMber?page=${pageNum}">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${viewData.endPage < viewData.pageTotalCount}">
				<li class="page-item"><a class="page-link" href="mngMber?page=${viewData.endPage+1}">
				다음</a></li>
			</c:if>
		</ul> 
	</div>
	<%-- 
<div class="container">
		<ul class="pagination">
			<c:if test="${viewData.startPage != 1}">
				<li class="page-item"><a class="page-link" href="board?command=board_list&page=${viewData.startPage-1}">
				이전</a></li>
			</c:if>
			<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
				<c:choose>
					<c:when test="${pageNum == viewData.currentPage}">
						<li class="page-item active"> <a class="page-link" href="board?command=board_list&page=${pageNum}">${pageNum}<span class="sr-only">(current)</span></a>
					</c:when>
					<c:otherwise>
						<li class="page-item"> <a class="page-link" href="board?command=board_list&page=${pageNum}">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${viewData.endPage < viewData.pageTotalCount}">
				<li class="page-item"><a class="page-link" href="board?command=board_list&page=${viewData.endPage+1}">
				다음</a></li>

			</c:if>
		</ul>
	</div> --%>