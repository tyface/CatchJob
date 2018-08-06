<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<jsp:include page="include/header.jsp" flush="true" />
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<script>

	function entDtlView(entIndex,section){
		location.href="${contextPath}"+"/enterprise/view?entIndex="+entIndex+"#"+section;
	};

	$(function() {

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

			<div class="col-xs-8">
				<a href="enterprise/view?entIndex=${ent.entIndex}" id="entName">${ent.entName}</a>
				<div class="btn mailbox-star" id="btnFollow">
					<a href="#"><i class="fa fa-heart" style="color: red; font-size: 20px;"></i></a>
				</div>
				<div class="addrName clear row">
					<div class="col-sm-6"> </div>
					<strong>${ent.industryName} | ${ent.bcityName} ${ent.signguName}</strong>
				</div>
				<div class="stars">
					<c:forEach begin="1" end="${ent.evaluationAvg}" step="1">
						<span class="glyphicon glyphicon-star"></span>
					</c:forEach>
					<c:forEach begin="${ent.evaluationAvg}" end="4" step="1">
						<span class="glyphicon glyphicon-star-empty"></span>
					</c:forEach>
					<span class="ent-score">${ent.evaluationAvg}</span> <small>/</small>5
				</div>
			</div>

			<div class="col-xs-4">
				<div class="row">
					<center><div class="fa fa-money"> 연봉 ${ent.salaryAvg} 만원</div> </center>
				</div>
				<div class="row">
					<button type="button" class="btn btn-default btn-lg col-sm-6"
						onclick="entDtlView(${ent.entIndex},'section2')">
						리뷰 코멘트 <br>${ent.reviewCount}
					</button>
					<button type="button" class="btn btn-default btn-lg col-sm-6"
						onclick="entDtlView(${ent.entIndex},'section3')">
						면접정보 <br>${ent.interviewCount}
						count 넣기
					</button>
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
