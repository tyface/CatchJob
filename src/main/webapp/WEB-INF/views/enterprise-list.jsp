<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="include/header.jsp" flush="true" />
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<script>
$(document).ready(function() {
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

<article>
	<div id="entListPage">	
		<c:forEach begin="0" varStatus="status" end="9" var="entList" items="${entList}">
			<div id="entListEachPage">
				<div class="row-fluid">
					<div style="display: inline-block; overflow: hidden; height: auto;">
						<a href="enterprise/view?entIndex=${entList.entIndex}" id="entName">${entList.entName}</a>

						<div class="btn mailbox-star" id="btnFollow">
							<a href="#"><i class="fa fa-heart"
								style="color: red; font-size: 20px;"></i></a>
						</div>
					</div>
					<div id="btnReview">
						<button type="button" class="btn btn-info" onclick="#">
							<span class="glyphicon glyphicon-pencil"> 리뷰작성 </span>
						</button>
					</div>
					<div class="addrName clear">
						<strong><a tag="#">${entList.industryName}</a></strong>
						<strong> │ </strong> 
						<strong><a tag="#"> </a></strong>
					</div>
					<br>
					<div class="row">
						<div class="col-md-5">
							<span class="fa fa-money"> 연봉 ${entList.salaryAvg}
							만원
							</span>
							<div class="stars">
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> 기업평가 3.9 <small>/
								</small> 5<!--기업평가넣기 -->
							</div>
						</div>
							<div class="col-md-offset-7">
							<button type="button" class="btn btn-default btn-lg" onclick="#"
								style="bg-color: transparent; border: 0;">
								리뷰 코멘트 <br>3119 <!--count 넣기 -->
							</button>
							<button type="button" class="btn btn-default btn-lg" onclick="#"
								style="bg-color: transparent; border: 0;">
								면접정보 <br>2262<!--count 넣기 -->
							</button>
						</div>
					</div>
				</div>
			</div>
	   </c:forEach>
	
				<div style="text-align: center">
					<nav>
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</div>
			</div>
	
	</article>
		<jsp:include page="include/footer.jsp" flush="true" />