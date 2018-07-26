<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"> --%>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/skins/_all-skins.min.css">

<style>
body {
	position: relative;
}

.affix {
	top: 20px;
	z-index: 9999 !important;
}

div.col-sm-9 div {
	/*  height: 250px;  */
	font-size: 28px;
}

#section1 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #f4511e;
}

#section2 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #ff9800;
}

#section3 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #00bcd4;
}

#section41 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #009688;
}

#section42 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #009688;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
	width: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.font-gray {
	color: #5D5D5D;
}
</style>
</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">CATCH JOB</a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" id="myBtnSignUp"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="#" id="myBtnLogin"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>

		</ul>
	</div>
	</nav>



	<div class="container"
		style="background-color: #f4511e; color: #fff; height: 200px;">

		<h1 style="padding-top: 50px">삼성전자</h1>




		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-heart"></span> 팔로우
		</button>
		
		
	<div style="float: right">	
		<button type="button" class="btn btn-default " >기업리뷰작성</button>
		<button type="button" class="btn btn-default ">면접후기작성</button> 
	</div>


	</div>
	<br>

	<!-- <div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo" style="font-size:1000px"></span>
    </div>
    <div class="col-sm-8">
      <h2>Our Values</h2>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>      
      <p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
    </div>
  </div>
</div> -->
	<!-- <span class="glyphicon glyphicon-bookmark"></span> bookmark
<span class="glyphicon glyphicon-heart"></span> Heart 
<span class="glyphicon glyphicon-heart-empty"></span> Heart -empty
<span class="glyphicon glyphicon-star"></span> star
<span class="glyphicon glyphicon-star-empty"></span> -star-empty
<span class="glyphicon glyphicon-thumbs-up"></span> -thumbs-up
월별그래프
<span class="glyphicon glyphicon-stats"></span>stats
기업정보--빌딩
<span class="glyphicon glyphicon-globe"></span> -globe
<span class="glyphicon glyphicon-tasks"></span> -tasks
기업리뷰...
면접후기
  -->

	<div class="container">
		<div class="row">
			<nav class="col-sm-2" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked" data-spy="affix"
				data-offset-top="205">
				<li style="height: 30px"></li>
				<li><a href="#section1"><span
						class="glyphicon glyphicon-bookmark  logo-small"></span>
						<p>기업정보</p></a></li>
				<li><a href="#section2"><span
						class="glyphicon glyphicon-file logo-small"></span>
						<p>기업리뷰</p></a></li>
				<li><a href="#section3"><span
						class="glyphicon glyphicon-pencil logo-small"></span>
						<p>면접후기</p></a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-stats logo-small"></span>
						<p>월별그래프</p> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#section41">월별그래프_인원</a></li>
						<li><a href="#section42">월별그래프_평균급여</a></li>
					</ul></li>
			</ul>
			</nav>
			<div class="col-sm-10">
				<!-- 기업정보//////////////////////////////////////////////////////////////////////////////// -->
				<div id="section1">
					<h3>기업정보</h3>

					<br>

					<div class="panel panel-default">
						<div class="panel-body" style="color: black">

							<div class="row">
								<div class="col-sm-12">
									<span><b>소재지</b> </span><span>&nbsp;&nbsp; 수원</span>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-6">
									<div class="well ">
										<span><b>인원</b></span> <span style="float: right"><b>98,141
										</b>명</span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="well ">
										<span><b>업력</b></span> <span style="float: right"><b>29
										</b>년</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="well ">
										<span><b>입사</b></span> <span style="float: right"><b>5,486
										</b>명 <b>6.0 </b>%</span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="well">
										<span><b>퇴사</b></span> <span style="float: right"><b>3,104
										</b>명 <b>3.0 </b>%</span>
									</div>
								</div>
							</div>
							<br> <br> <br>
							<div class="row" style="text-align: center">
								<div class="col-sm-3">
									<div class="row">
										<h6>총 매출액</h6>
										<h4>134조원</h4>
									</div>
								</div>
								<div class="col-sm-1">
									<div style="font-size: 50px">|</div>
								</div>
								<div class="col-sm-3">
									<div class="row">
										<h5>1인당 매출액</h5>
										<h4>138조원</h4>
									</div>
								</div>
								<div class="col-sm-1">
									<div style="font-size: 50px">|</div>
								</div>
								<div class="col-sm-4">
									<div class="row">
										<h5>매출액 대비 임금금액</h5>
										<h4>10%</h4>
									</div>
								</div>
							</div>
							<br> <br> <br>
							<div class="row">
								<div class="col-sm-6">
									<div class="col-sm-5">
										<p style="float: right">
											<b>올해 입사자 평균연봉</b>
										</p>
										<p style="float: right">(국민연금)</p>

									</div>
									<div class="col-sm-7">
										<h1>
											<b>6,663 만원</b>
										</h1>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="col-sm-5">

										<p style="float: right">
											<b>올해 입사자 평균연봉</b>
										</p>
										<p style="float: right">(국민연금)</p>
									</div>
									<div class="col-sm-7">
										<h1>
											<b>10,250 만원</b>
										</h1>
									</div>
								</div>
							</div>


						</div>
					</div>



				</div>
				<!-- 기업리뷰//////////////////////////////////////////////////////////////////////////////// -->
				<div id="section2">
					<h3>기업리뷰</h3>
					<p>Try to scroll this section and look at the navigation list
						while scrolling!</p>
					<div class="panel-group " id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse1">
										<div class="row">
											<div class="col-sm-9">
												질문1 <span style="color: #6799FF">(201)</span>
											</div>
											<div class="col-sm-3">
												4.1 <span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
										</div>
									</a>
								</h4>
							</div>
							<div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body" style="color: black">
									<table class="table">
										<thead>
											<tr>
												<th>총16개의 복지리뷰 코멘트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우
													40세미만 격년. 40세 이상의경우 1회/년 진행
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
													진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 1년에 한번 있는 건강검진
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 삼성병원의 건강검진서비스를 이용할 수 있음
												</td>
											</tr>
											<tr>
												<td style="text-align: center"><nav>
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
													</nav></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse2">
										<div class="row">
											<div class="col-sm-9">
												질문2 <span style="color: #6799FF">(201)</span>
											</div>
											<div class="col-sm-3">
												4.1 <span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
										</div>
									</a>
								</h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse">
								<div class="panel-body" style="color: black">
									<table class="table">
										<thead>
											<tr>
												<th>총16개의 복지리뷰 코멘트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우
													40세미만 격년. 40세 이상의경우 1회/년 진행
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
													진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 1년에 한번 있는 건강검진
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 삼성병원의 건강검진서비스를 이용할 수 있음
												</td>
											</tr>
											<tr>
												<td style="text-align: center"><nav>
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
													</nav></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse3">
										<div class="row">
											<div class="col-sm-9">
												질문3 <span style="color: #6799FF">(201)</span>
											</div>
											<div class="col-sm-3">
												4.1 <span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
										</div>
									</a>
								</h4>
							</div>
							<div id="collapse3" class="panel-collapse collapse">
								<div class="panel-body" style="color: black">
									<table class="table">
										<thead>
											<tr>
												<th>총16개의 복지리뷰 코멘트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우
													40세미만 격년. 40세 이상의경우 1회/년 진행
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
													진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 1년에 한번 있는 건강검진
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 삼성병원의 건강검진서비스를 이용할 수 있음
												</td>
											</tr>
											<tr>
												<td style="text-align: center"><nav>
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
													</nav></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse4">
										<div class="row">
											<div class="col-sm-9">
												질문4 <span style="color: #6799FF">(201)</span>
											</div>
											<div class="col-sm-3">
												4.1 <span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
										</div>
									</a>
								</h4>
							</div>
							<div id="collapse4" class="panel-collapse collapse">
								<div class="panel-body" style="color: black">
									<table class="table">
										<thead>
											<tr>
												<th>총16개의 복지리뷰 코멘트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우
													40세미만 격년. 40세 이상의경우 1회/년 진행
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
													진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 1년에 한번 있는 건강검진
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 삼성병원의 건강검진서비스를 이용할 수 있음
												</td>
											</tr>
											<tr>
												<td style="text-align: center"><nav>
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
													</nav></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse5">
										<div class="row">
											<div class="col-sm-9">
												질문5 <span style="color: #6799FF">(201)</span>
											</div>
											<div class="col-sm-3">
												4.1 <span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</div>
										</div>
									</a>
								</h4>
							</div>
							<div id="collapse5" class="panel-collapse collapse">
								<div class="panel-body" style="color: black">
									<table class="table">
										<thead>
											<tr>
												<th>총16개의 복지리뷰 코멘트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우
													40세미만 격년. 40세 이상의경우 1회/년 진행
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
													진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 1년에 한번 있는 건강검진
												</td>
											</tr>
											<tr>
												<td>
													<p>
														<small><span class="glyphicon glyphicon-star"></span>
															5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
															2018.05.02</small>
													</p> 삼성병원의 건강검진서비스를 이용할 수 있음
												</td>
											</tr>
											<tr>
												<td style="text-align: center"><nav>
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
													</nav></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>


					</div>
				</div>


				<!-- 면접후기//////////////////////////////////////////////////////////////////////////////// -->
				<div id="section3">
					<h3>면접후기</h3>
					<p>Try to scroll this section and look at the navigation list
						while scrolling!가나다라</p>

					<div class="panel-group" style="color: black">

						<div class="panel panel-default">
							<div class="panel-body">

								<div class="chart">
									<canvas id="areaChart" style="height:00px"></canvas>
								</div>

								<div class="box box-danger">
									<div class="box-header with-border">
										<h3 class="box-title">면접 난이도</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
									<div class="box-body">
										<canvas id="pieChart" style="height:250px"></canvas>
									</div>
								</div>


							</div>
						</div>







						<!-- 면접후기1 -->
						<div class="panel panel-default">
							<div class="panel-heading font-gray">2018/07/11</div>
							<div class="panel-body ">
								<div class="col-sm-3">
									<div>
										<p>
											<b>면접난이도</b>
										</p>
										<p style="color: #FF0000">매우 어려움</p>
										<div class="progress" style="height: 10px">
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #1DDB16"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #ABF200"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FFBB00"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FF5E00"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FF0000"></div>
										</div>


									</div>
									<br>

									<div>
										<p>
											<b>면접일자</b>
										</p>
										<p>2018/06</p>
										<br>
									</div>
									<div>
										<p>
											<b>면접경로</b>
										</p>
										<p>공개채용</p>
										<br>
									</div>

								</div>
								<div class="col-sm-9">
									<table class="table">
										<thead>
											<tr>
												<th colspan="4">"면접은 크게 인성,pt,창의 면접으로 나누어져 있고 당일 인원을 여러
													조로 나눠서 각각 다른 순서로 면접을 진행함. 전공은 여러 전공이 섞여있음 다만 전공면접때는 각자 전공에
													맞는 문제를 풀고 발표함"</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4">
													<p>
														<b>면접질문</b>
													</p>
													<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에
														대한 문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에
														들지 않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재
														사회의 이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>질문에 대한 답변</b>
													</p>
													<p class="font-gray">선택하고 그 키워드와 관련된 3개의 소문제를 풀고 그 답변을
														발표하였음 그런데 내 경우에는 키워드를 실제로 처음 들어본것이였고 나중에 보니 거의 모든 지원자들이
														몰랐던것같음 그래서 대부분이 답변을 하지못하고 본인의 공부한것을 발표한것을 발표하였던 것으로 알고있고
														본인의 경우는 나름 원인에서 유추해서 80퍼센트 정도는 답변하였고 면접관분들이 칭찬을 해주심</p>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>발표시기</b>
													</p>
													<p class="font-gray">17일 후</p>
												</td>
											</tr>
											<tr>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접결과</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>합격
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접경험</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>보통
													</p>
												</td>
											</tr>

										</tbody>
									</table>
								</div>

							</div>
						</div>

						<!-- 면접후기2 -->
						<div class="panel panel-default">
							<div class="panel-heading font-gray">2018/07/11</div>
							<div class="panel-body ">
								<div class="col-sm-3">
									<div>
										<p>
											<b>면접난이도</b>
										</p>
										<p style="color: #FF5E00">어려움</p>
										<div class="progress" style="height: 10px">
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #1DDB16"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #ABF200"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FFBB00"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FF5E00"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
										</div>


									</div>
									<br>

									<div>
										<p>
											<b>면접일자</b>
										</p>
										<p>2018/06</p>
										<br>
									</div>
									<div>
										<p>
											<b>면접경로</b>
										</p>
										<p>공개채용</p>
										<br>
									</div>

								</div>
								<div class="col-sm-9">
									<table class="table">
										<thead>
											<tr>
												<th colspan="4">"면접은 크게 인성,pt,창의 면접으로 나누어져 있고 당일 인원을 여러
													조로 나눠서 각각 다른 순서로 면접을 진행함. 전공은 여러 전공이 섞여있음 다만 전공면접때는 각자 전공에
													맞는 문제를 풀고 발표함"</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4">
													<p>
														<b>면접질문</b>
													</p>
													<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에
														대한 문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에
														들지 않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재
														사회의 이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>질문에 대한 답변</b>
													</p>
													<p class="font-gray">선택하고 그 키워드와 관련된 3개의 소문제를 풀고 그 답변을
														발표하였음 그런데 내 경우에는 키워드를 실제로 처음 들어본것이였고 나중에 보니 거의 모든 지원자들이
														몰랐던것같음 그래서 대부분이 답변을 하지못하고 본인의 공부한것을 발표한것을 발표하였던 것으로 알고있고
														본인의 경우는 나름 원인에서 유추해서 80퍼센트 정도는 답변하였고 면접관분들이 칭찬을 해주심</p>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>발표시기</b>
													</p>
													<p class="font-gray">17일 후</p>
												</td>
											</tr>

											<tr>
												<th colspan="2" style="width: 50%">
													<p class="well well-sm">
														<a>면접결과</a> <a style="float: right; margin-right: 25%"><span
															class="glyphicon glyphicon-thumbs-up"></span>불합격 </a>
													</p>
												</th>
												<th colspan="2" style="width: 50%">
													<p class="well well-sm">
														<a>면접경험</a> <a style="float: right; margin-right: 25%"><span
															class="glyphicon glyphicon-thumbs-up"></span>보통</a>
													</p>
												</th>

											</tr>
										</tbody>
									</table>
								</div>

							</div> <!-- 패널 바디... -->
						</div>


						<!-- 면접후기3 -->
						<div class="panel panel-default">
							<div class="panel-heading font-gray">2018/07/11</div>
							<div class="panel-body ">
								<div class="col-sm-3">
									<div>
										<p>
											<b>면접난이도</b>
										</p>
										<p style="color: #FFBB00">보통</p>
										<div class="progress" style="height: 10px">
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #1DDB16"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #ABF200"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #FFBB00"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
										</div>


									</div>
									<br>

									<div>
										<p>
											<b>면접일자</b>
										</p>
										<p>2018/06</p>
										<br>
									</div>
									<div>
										<p>
											<b>면접경로</b>
										</p>
										<p>공개채용</p>
										<br>
									</div>

								</div>
								<div class="col-sm-9">
									<table class="table">
										<thead>
											<tr>
												<th colspan="4">"면접은 크게 인성,pt,창의 면접으로 나누어져 있고 당일 인원을 여러
													조로 나눠서 각각 다른 순서로 면접을 진행함. 전공은 여러 전공이 섞여있음 다만 전공면접때는 각자 전공에
													맞는 문제를 풀고 발표함"</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4">
													<p>
														<b>면접질문</b>
													</p>
													<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에
														대한 문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에
														들지 않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재
														사회의 이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>질문에 대한 답변</b>
													</p>
													<p class="font-gray">선택하고 그 키워드와 관련된 3개의 소문제를 풀고 그 답변을
														발표하였음 그런데 내 경우에는 키워드를 실제로 처음 들어본것이였고 나중에 보니 거의 모든 지원자들이
														몰랐던것같음 그래서 대부분이 답변을 하지못하고 본인의 공부한것을 발표한것을 발표하였던 것으로 알고있고
														본인의 경우는 나름 원인에서 유추해서 80퍼센트 정도는 답변하였고 면접관분들이 칭찬을 해주심</p>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>발표시기</b>
													</p>
													<p class="font-gray">17일 후</p>
												</td>
											</tr>
											<tr>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접결과</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>합격
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접경험</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>보통
													</p>
												</td>
											</tr>

										</tbody>
									</table>
								</div>

							</div>
						</div>

						<!-- 면접후기4 -->
						<div class="panel panel-default">
							<div class="panel-heading font-gray">2018/07/11</div>
							<div class="panel-body ">
								<div class="col-sm-3">
									<div>
										<p>
											<b>면접난이도</b>
										</p>
										<p style="color: #ABF200">쉬움</p>
										<div class="progress" style="height: 10px">
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #1DDB16"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #ABF200"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
											<div class="progress-bar " role="progressbar"
												style="width: 20%; background-color: #D5D5D5"></div>
										</div>


									</div>
									<br>

									<div>
										<p>
											<b>면접일자</b>
										</p>
										<p>2018/06</p>
										<br>
									</div>
									<div>
										<p>
											<b>면접경로</b>
										</p>
										<p>공개채용</p>
										<br>
									</div>

								</div>
								<div class="col-sm-9">
									<table class="table">
										<thead>
											<tr>
												<th colspan="4">"면접은 크게 인성,pt,창의 면접으로 나누어져 있고 당일 인원을 여러
													조로 나눠서 각각 다른 순서로 면접을 진행함. 전공은 여러 전공이 섞여있음 다만 전공면접때는 각자 전공에
													맞는 문제를 풀고 발표함"</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="4">
													<p>
														<b>면접질문</b>
													</p>
													<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에
														대한 문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에
														들지 않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재
														사회의 이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>질문에 대한 답변</b>
													</p>
													<p class="font-gray">선택하고 그 키워드와 관련된 3개의 소문제를 풀고 그 답변을
														발표하였음 그런데 내 경우에는 키워드를 실제로 처음 들어본것이였고 나중에 보니 거의 모든 지원자들이
														몰랐던것같음 그래서 대부분이 답변을 하지못하고 본인의 공부한것을 발표한것을 발표하였던 것으로 알고있고
														본인의 경우는 나름 원인에서 유추해서 80퍼센트 정도는 답변하였고 면접관분들이 칭찬을 해주심</p>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<p>
														<b>발표시기</b>
													</p>
													<p class="font-gray">17일 후</p>
												</td>
											</tr>
											<tr>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접결과</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>합격
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<b>면접경험</b>
													</p>
												</td>
												<td colspan="1" style="width: 25%">
													<p>
														<span class="glyphicon glyphicon-thumbs-up"></span>보통
													</p>
												</td>
											</tr>

										</tbody>
									</table>
								</div>

							</div>
						</div>

					</div>

					<nav style="text-align: center">
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
					</nav>


				</div>

				<!-- 그래프1//////////////////////////////////////////////////////////////////////////////// -->
				<div id="section41">
					<h3>월별그래프_인원</h3>
					<p>Try to scroll this section and look at the navigation list
						while scrolling!</p>

					<!-- 그래프 -->
					<div class="panel panel-default">
						<div class="panel-body">

							<div class="box box-primary">
								<div class="box box-info">
									<div class="box-header with-border">
										<h3 class="box-title">Line Chart</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="lineChart" style="height:250px"></canvas>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>

					</div>
				</div>
				<!-- 그래프2//////////////////////////////////////////////////////////////////////////////// -->
				<div id="section42">
					<h3>월별그래프_평균급여</h3>
					<p>Try to scroll this section and look at the navigation list
						while scrolling!</p>

					<!-- 그래프 -->


					<div class="panel panel-default">
						<div class="panel-body">

					
								<div class="box box-primary">
								<div class="box box-info">
									<div class="box-header with-border">
										<h3 class="box-title">Line Chart</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="lineChart2" style="height:250px"></canvas>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="box box-success">
								<div class="box-header with-border">
									<h3 class="box-title">Bar Chart</h3>

									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<div class="box-body">
									<div class="chart">
										<canvas id="barChart" style="height:230px"></canvas>
									</div>
								</div>
							</div>



						</div>
					</div>

				</div>


			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			// Add scrollspy to <body>
			$('body').scrollspy({
				target : ".navbar",
				offset : 50
			});

			// Add smooth scrolling on all links inside the navbar
			$("#myScrollspy a").on('click', function(event) {
				// Make sure this.hash has a value before overriding default behavior
				if (this.hash !== "") {
					// Prevent default anchor click behavior
					event.preventDefault();

					// Store hash
					var hash = this.hash;

					// Using jQuery's animate() method to add smooth page scroll
					// The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
					$('html, body').animate({
						scrollTop : $(hash).offset().top
					}, 800, function() {

						// Add hash (#) to URL when done scrolling (default click behavior)
						window.location.hash = hash;
					});
				} // End if
			});
		});
	</script>



	<!-- ChartJS -->
	<script
		src="<%=request.getContextPath()%>/resources/bower_components/chart.js/Chart.js"></script>
	<!-- FastClick -->

	<script>
		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			//--------------
			//- AREA CHART -
			//--------------
			// Get context with jQuery - using jQuery's .get() method.
			var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
			// This will get the first returned node in the jQuery collection.
			var areaChart = new Chart(areaChartCanvas)
			/*꼭 필요함*/
			var areaChartData = {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July', 'August', 'September', 'October',
						'November', 'December' ],
				datasets : [ {
					label : 'Electronics',
					fillColor : 'rgba(210, 214, 222, 1)',
					strokeColor : 'rgba(210, 214, 222, 1)',
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : [ 65, 59, 80, 81, 56, 55, 40, 75, 60, 50, 40, 70 ]
				}, {
					label : 'Digital Goods',
					fillColor : 'rgba(60,141,188,0.9)',
					strokeColor : 'rgba(60,141,188,0.8)',
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data : [ 28, 48, 40, 19, 86, 27, 90, 75, 30, 40, 50, 30 ]
				} ]
			}
			/*꼭 필요함*/
			var areaChartOptions = {
				//Boolean - If we should show the scale at all
				showScale : true,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : false,
				//String - Colour of the grid lines
				scaleGridLineColor : 'rgba(0,0,0,.05)',
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - Whether to show horizontal lines (except X axis)
				scaleShowHorizontalLines : true,
				//Boolean - Whether to show vertical lines (except Y axis)
				scaleShowVerticalLines : true,
				//Boolean - Whether the line is curved between points
				bezierCurve : true,
				//Number - Tension of the bezier curve between points
				bezierCurveTension : 0.3,
				//Boolean - Whether to show a dot for each point
				pointDot : false,
				//Number - Radius of each point dot in pixels
				pointDotRadius : 4,
				//Number - Pixel width of point dot stroke
				pointDotStrokeWidth : 1,
				//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
				pointHitDetectionRadius : 20,
				//Boolean - Whether to show a stroke for datasets
				datasetStroke : true,
				//Number - Pixel width of dataset stroke
				datasetStrokeWidth : 2,
				//Boolean - Whether to fill the dataset with a color
				datasetFill : true,
				//String - A legend template
				//Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
				maintainAspectRatio : true,
				//Boolean - whether to make the chart responsive to window resizing
				responsive : true
			}

			//Create the line chart
			/*      areaChart.Line(areaChartData, areaChartOptions) */

			//-------------
			//- PIE CHART - 면접난이도
			//-------------
			// Get context with jQuery - using jQuery's .get() method.
			var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
			var pieChart = new Chart(pieChartCanvas)
			var PieData = [ {
				value : 700,
				color : '#FF0000',
				highlight : '#FF0000',
				label : '매우 어려움'
			}, {
				value : 600,
				color : '#FF5E00',
				highlight : '#FF5E00',
				label : '어려움'
			}, {
				value : 400,
				color : '#FFBB00',
				highlight : '#FFBB00',
				label : '보통'
			}, {
				value : 300,
				color : '#ABF200',
				highlight : '#ABF200',
				label : '쉬움'
			}, {
				value : 500,
				color : '#1DDB16',
				highlight : '#1DDB16',
				label : '매우 쉬움'
			},
			/*  {
			   value    : 100,
			   color    : '#d2d6de',
			   highlight: '#d2d6de',
			   label    : 'Navigator'
			 } */
			]
			var pieOptions = {
				//Boolean - Whether we should show a stroke on each segment
				segmentShowStroke : true,
				//String - The colour of each segment stroke`
				segmentStrokeColor : '#fff',
				//Number - The width of each segment stroke
				segmentStrokeWidth : 2,
				//Number - The percentage of the chart that we cut out of the middle
				percentageInnerCutout : 50, // This is 0 for Pie charts
				//Number - Amount of animation steps
				animationSteps : 100,
				//String - Animation easing effect
				animationEasing : 'easeOutBounce',
				//Boolean - Whether we animate the rotation of the Doughnut
				animateRotate : true,
				//Boolean - Whether we animate scaling the Doughnut from the centre
				animateScale : false,
				//Boolean - whether to make the chart responsive to window resizing
				responsive : true,
				// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
				maintainAspectRatio : true
			}
			//Create pie or douhnut chart
			// You can switch between pie and douhnut using the method below.
			pieChart.Doughnut(PieData, pieOptions)

			//-------------
			//- LINE CHART - 
			//--------------
			var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
			var lineChart = new Chart(lineChartCanvas)
			var lineChartOptions = areaChartOptions
			lineChartOptions.datasetFill = false
			lineChart.Line(areaChartData, lineChartOptions)

			//-------------
			//- LINE CHART - 
			//--------------
			var lineChartCanvas = $('#lineChart2').get(0).getContext('2d')
			var lineChart = new Chart(lineChartCanvas)
			var lineChartOptions = areaChartOptions
			lineChartOptions.datasetFill = false
			lineChart.Line(areaChartData, lineChartOptions)

			//-------------
			//- BAR CHART -
			//-------------
			var barChartCanvas = $('#barChart').get(0).getContext('2d')
			var barChart = new Chart(barChartCanvas)
			var barChartData = areaChartData
			barChartData.datasets[1].fillColor = '#00a65a'
			barChartData.datasets[1].strokeColor = '#00a65a'
			barChartData.datasets[1].pointColor = '#00a65a'
			var barChartOptions = {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : true,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : 'rgba(0,0,0,.05)',
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - Whether to show horizontal lines (except X axis)
				scaleShowHorizontalLines : true,
				//Boolean - Whether to show vertical lines (except Y axis)
				scaleShowVerticalLines : true,
				//Boolean - If there is a stroke on each bar
				barShowStroke : true,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				//String - A legend template

				responsive : true,
				maintainAspectRatio : true
			}

			barChartOptions.datasetFill = false
			barChart.Bar(barChartData, barChartOptions)
		})
	</script>


</body>
</html>
