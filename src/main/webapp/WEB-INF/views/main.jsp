<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%@ include file="include/header.jsp" %>
<%-- <jsp:include page="include/header.jsp" flush="true"/> --%>

<%-- 구글 폰트 --%>
<link href="https://fonts.googleapis.com/css?family=Frijole|Nanum+Pen+Script" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
//<![CDATA[

$(function() {

    var availableCity = ["서울","부산","대구","광주","울산"];

    $("#city").autocomplete({

        source: availableCity,

        select: function(event, ui) {

            console.log(ui.item);

        },

        focus: function(event, ui) {

            return false;

            //event.preventDefault();

        }

    });

});

//]]>
	$(function(){
		$("#main-search-btn").on("click",function(){
			$("#main-search-form").submit();
		})

	})
</script>

	<!-- CONTENTS -->
	<section>
		<%-- <div class="ui-widget">

		  <label for="city">도시: </label>

		  <input id="city">

		</div> --%>
		<article id="main-center">
				<!-- 			슬로건 -->
				<p class="frijole-font" >Find The Job That Fits Your Life</p>
				<h1 class="frijole-font" id="h1-main">CATct!! <br>JOB.</h1>

				<!-- 			검색바 -->
				<form action="search" class="form-inline row" id="main-search-form">
						<div class="col-xs-11">
							<input type="text" name="keyword" class="form-control nanumpen-font" id="main-search-bar" size="70"  placeholder="  기업을 검색해 보세요 " required autocomplete=off>
						</div>
						<div class="col-xs-1">
							<span class="glyphicon glyphicon-search"></span>
						</div>
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
							<h3>인기검색회사</h3>
							<c:forEach var="popularRank" items="${popularSearcheList}">
							<a href="enterprise/view?entIndex=${popularRank.ENT_IDX}">${popularRank.ENT_NM}</a><br>
						</c:forEach>
						<h4></h4>
						</div>
					</div>
					<div class="item">
						<h3>연봉이 높은 회사</h3>
						<c:forEach var="salaryRank" items="${salaryRankList}">
							<a href="enterprise/view?entIndex=${salaryRank.ENT_IDX}">${salaryRank.ENT_NM}</a><br>
						</c:forEach>
						<h4></h4>
					</div>
					<div class="item">
						<h3>사원수가 많은 회사</h3>
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
