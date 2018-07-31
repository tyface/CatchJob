<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" flush="true"/>

	<!-- CONTENTS -->
	<div class="container jumbotron text-center">
		<h1>Find The Job That Fits Your Life</h1>
		<p>이력서 쓰기 전, 면접 보기 전</p>
		<form class="form-inline">
			<div class="input-group">
				<input type="email" class="form-control" size="50"
					placeholder="기업을 검색해 보세요 " required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</div>
		</form>
	</div>

	<div class="container text-center bg-grey">
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">

					<img src="<%=request.getContextPath()%>/resources/img/paris.jpg"
						alt="Paris" width="400" height="300">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Yes, we built Paris</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="<%=request.getContextPath()%>/resources/img/newyork.jpg"
						alt="New York" width="400" height="300">
					<p>
						<strong>New York</strong>
					</p>
					<p>We built New York</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="<%=request.getContextPath()%>/resources/img/sanfran.jpg"
						alt="San Francisco" width="400" height="300">
					<p>
						<strong>San Francisco</strong>
					</p>
					<p>Yes, San Fran is ours</p>
				</div>
			</div>
		</div>


		<div id="myCarousel" class="carousel slide text-center"
			data-ride="carousel">

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

	<!-- CONTENTS - END -->
<jsp:include page="include/footer.jsp" flush="true"/>
