<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<jsp:include page="include/header.jsp" flush="true" />

<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">


<script>
var list = new Array();
<c:forEach items="${entList}" var="item">
list.push("${item}");
</c:forEach>
alert(list);

$(function() {
	/* 무한 스크롤 코딩*/


	$(document).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();



		if (maxHeight <= currentScroll + 1) {
				//
				// $.ajax({file:"enterprise-list-append.jsp",
				//
				// 				success:function(result) {
				//
				// 				$("#entListPage").html(result);
				//
				// 		}});
//
				// $("#entListPage").append()
		}
	})


	$(".mailbox-star").click(function (e) {
		e.preventDefault();
		//detect type
		var $this = $(this).find("a > i");
		var glyph = $this.hasClass("glyphicon");
		var fa = $this.hasClass("fa");

		//Switch states
		if (glyph) {
		  $this.toggleClass("glyphicon-heart");
		  $this.toggleClass("glyphicon-heart-empty");
		}

		if (fa) {
		  $this.toggleClass("fa-heart");
		  $this.toggleClass("fa-heart-o");
		}
	});

});
</script>

<article id="entListPage">

	<c:forEach begin="0" varStatus="status" end="9" var="ent" items="${entList}">
		<div class="row entList">

			<div class="col-sm-8">
				<div class="row">
					<a href="enterprise/view?entIndex=${ent.entIndex}" class="p25">${ent.entName}</a>
						<a href="#"  class="btn mailbox-star" class="btnFollow"><i class="fa fa-heart" style="color: red; font-size: 20px;"></i></a>
				</div>
				<div class="row visible-lg visible-md visible-sm">
					${ent.industryName} | ${ent.bcityName} ${ent.signguName}
				</div>
				<div class="row">
					<p class="p-1">평균연봉 ${ent.salaryAvg} 만원   </p>
				</div>
			</div>

			<div class="col-sm-4">
				<div class="row text-center">
					<c:forEach begin="1" end="${ent.evaluationAvg}" step="1">
						<span class="stars-on"></span>
					</c:forEach>
					<c:forEach begin="${ent.evaluationAvg}" end="4" step="1">
						 <span class="stars-off"></span>
					</c:forEach>
					<span class="ent-score">${ent.evaluationAvg}</span>
				</div>
				<div class="row">
					<div class="col-xs-6 text-center cell-1"><strong>${ent.reviewCount}</strong><a href="${contextPath}/enterprise/view?entIndex=${ent.entIndex}#section2"><br>리뷰코멘트</a></div>
					<div class="col-xs-6 text-center cell-2"><strong>${ent.interviewCount}</strong><a href="${contextPath}/enterprise/view?entIndex=${ent.entIndex}#section3"><br>면접정보</a></div>
				</div>
			</div>

		</div>
	</c:forEach>

	<div style="text-align: center">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</div>
</article>

<jsp:include page="include/footer.jsp" flush="true" />
