<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" flush="true"/>
<link href="https://fonts.googleapis.com/css?family=Frijole|Nanum+Pen+Script" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<script>
	$(function(){
		$("#main-search-btn").on("click",function(){
			$("#main-search-form").submit();

		})

	})
</script>

	<!-- CONTENTS -->
	<section>

		<article id="main-center">

			<!-- 			슬로건 -->
			<p class="frijole-font" >Find The Job That Fits Your Life</p>
			<h1 class="frijole-font" id="h1-main">CATct!! JOB.</h1>

			<!-- 			검색바 -->
			<form action="search" class="form-inline" id="main-search-form">
				<div class="input-group">
					<input type="text" name="keyword" class="form-control nanumpen-font" id="main-search-bar" size="70"  placeholder="  기업을 검색해 보세요 " required>
					<div class="input-group-btn">
						<button type="button" class="btn btn-danger" id="main-search-btn">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>

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
							<p>삼성(주)드림클래스</p>
							<p>삼성(주)드림클래스</p>
							<p>삼성(주)드림클래스</p>
							<p>삼성(주)드림클래스</p>
							<p>삼성(주)드림클래스</p>
							<p>삼성(주)드림클래스</p>
							<h4></h4>
						</div>
					</div>
					<div class="item">
						<h3>연봉이 높은 회사</h3>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<h4></h4>
					</div>
					<div class="item">
						<h3>사원수가 많은 회사</h3>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
						<p>삼성(주)드림클래스</p>
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
<jsp:include page="include/footer.jsp" flush="true"/>
