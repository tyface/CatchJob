<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<jsp:include page="include/header.jsp" flush="true" />
<script src="${pageContext.request.contextPath}/resources/js/enterprise.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">


<script>
var pageViewCount = 10;
var pageNum = 0;
var entList = JSON.parse('${entList1}');

$(function() {
	appendEntList(entList, pageNum, pageViewCount);
	pageNum ++;
	/* 무한 스크롤 코딩*/
	$(document).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();



		if (maxHeight <= currentScroll + 1) {
				appendEntList(entList, pageNum, pageViewCount);
				pageNum ++;
		}

	})


});
</script>

<article id="ent-list-box">
	<%-- 기업 리스트 내용 AJAX로 출력	 --%>
</article>

	<button type="button" class="btn btn-default move-top" >
		<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
	</button>
<jsp:include page="include/footer.jsp" flush="true" />
