<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	alert(11);

});
</script>
<%-- <c:forEach begin="0" varStatus="status" end="9" var="ent" items="${entList}">
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
</c:forEach> --%>
<p>12313123123</p>
