<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%@ include file="include/header.jsp" %>
<%-- <jsp:include page="include/header.jsp" flush="true"/> --%>

<%-- 구글 폰트 --%>
<link href="https://fonts.googleapis.com/css?family=Frijole|Nanum+Pen+Script" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">

<!-- 유효성 검사 -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<%-- <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/messages_ko.min.js"></script> --%>

<script type="text/javascript">

$(function(){
	searchValidation();
})

function searchValidation(){
		/* 유효성검사  */
			$('#main-search-form').validate({
				/* 규칙 */
				rules : {
					keyword:{
						required : true,
						laxEmail : true,
					}
				},
				/* 규칙 어길 때, 메시지 */
				messages : {
					keyword:{
						required : "필수로입력하세요",
					}
				},
				focusInvalid: true,
	      focusCleanup: true,
	      onkeyup: false,
				/* 규칙 어길 때, 툴팁 띄우기  */
				showErrors: function(errorMap, errorList) {
			          // Clean up any tooltips for valid elements
			          $.each(this.validElements(), function (index, element) {
			              var $element = $(element);

			              $element.data("title", "") // Clear the title - there is no error associated anymore
			                  .removeClass("error")
			                  .tooltip("destroy");
			          });
			          // Create new tooltips for invalid elements
			          $.each(errorList, function (index, error) {
			              var $element = $(error.element);

			              $element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
			                  .data("title", error.message)
			                  .addClass("error")
			                  .tooltip(); // Create a new tooltip based on the error messsage we just set in the title
			          });
			      },
			      /* 규칙 맞으면, 실행됨 */
				 submitHandler: function(form) {
						var $keyword = $('#main-search-bar').val();
				 		$keyword = $keyword.replace(/ /gi, "");
				 		$('#main-search-bar').val($keyword);
				 		form.submit();
				}
			});
			/* validate-plugin 사용시, 추가로 사용자가 사용할 메서드 선언 */
				jQuery.validator.addMethod("laxEmail", function(value, element) {
			  var result = value.replace(/ /gi, "");
			  return this.optional( element ) || /^[a-zA-Z가-힇0-9]{1,}$/.test(result);
			 }, '올바른 언어(영어/한글)로 입력했는지 확인해 보세요.');
}

</script>

	<!-- CONTENTS -->
	<section>
		<article id="main-center">
				<!-- 			슬로건 -->
				<p class="frijole-font" >Find The Job That Fits Your Life</p>
				<h1 class="frijole-font" id="h1-main">Catch!! <br>JOB.</h1>

				<!-- 			검색바 -->
				<form action="${pageContext.request.contextPath}/enterprise/search" class="form-inline row" id="main-search-form">
						<div class="col-xs-11 search-btn1">
							<input type="text" name="keyword" class="form-control nanumpen-font" id="main-search-bar" size="70"  placeholder="  기업을 검색해 보세요 "  data-placement="bottom"  autocomplete="off">
						</div>
						<button type="submit" class="col-xs-1 search-btn2">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<%-- <div type="submit" class="col-xs-1">
							<span class="glyphicon glyphicon-search"></span>
						</div> --%>
				</form>
		</article>
		<!--  하단 기업순위  시작 -->
		<div class="container text-center bg-grey">
			<div id="myCarousel" class="carousel slide text-center"	data-ride="carousel">

				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="item">
							<h3 class="font-color-01">인기검색회사</h3>
							<c:forEach var="popularRank" items="${popularSearcheList}">
							<a href="enterprise/view?entIndex=${popularRank.ENT_IDX}">${popularRank.ENT_NM}</a><br>
						</c:forEach>
						<h4></h4>
						</div>
					</div>
					<div class="item">
						<h3 class="font-color-01">연봉이 높은 회사</h3>
						<c:forEach var="salaryRank" items="${salaryRankList}">
							<a href="enterprise/view?entIndex=${salaryRank.ENT_IDX}">${salaryRank.ENT_NM}</a><br>
						</c:forEach>
						<h4></h4>
					</div>
					<div class="item">
						<h3 class="font-color-01">사원수가 많은 회사</h3>
						<c:forEach var="empCntRank" items="${empCntRankList}">
							<a href="enterprise/view?entIndex=${empCntRank.ENT_IDX}">${empCntRank.ENT_NM}</a><br>
						</c:forEach>
						<h4></h4>
					</div>
				</div>

				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!--  하단 기업순위  끝 -->

	</section>
	<!-- CONTENTS - END -->
<%-- <jsp:include page="include/footer.jsp" flush="true"/> --%>
<%@ include file="include/footer.jsp" %>
