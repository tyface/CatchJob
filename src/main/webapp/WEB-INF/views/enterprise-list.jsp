<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%@ include file="include/header.jsp" %>

<script>
var pageViewCount = 10;
var pageNum = 0;
var entList = JSON.parse('${entList}');

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
	$(window).scroll(function() {
			 if ($(this).scrollTop() > 500) {
					 $('.move-top').fadeIn();
			 } else {
					 $('.move-top').fadeOut();
			 }
	 });

	 $(".move-top").click(function() {
			 $('html, body').animate({
					 scrollTop : 0
			 }, 400);
			 return false;
	 });
});
</script>

<article id="ent-list-box">
	<%-- 기업 리스트 내용 AJAX로 출력	 --%>
</article>

	<button type="button" class="btn btn-default move-top" >
		<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
	</button>
<%@ include file="include/footer.jsp" %>
