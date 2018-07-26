<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@include file="include/companies-header.jsp"%>

	<div class="container"
		style="background-color: #f4511e; color: #fff; height: 200px;">

		<h1 style="padding-top: 50px">삼성전자자</h1>
		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-heart"></span> 팔로우
		</button>
		
		
	<div style="float: right">	
		<button type="button" class="btn btn-default " >기업리뷰작성</button>
		<button type="button" class="btn btn-default ">면접후기작성</button> 
	</div>


	</div>
	<br>


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
									<div class="well well-lg">
										<span><b>인원</b></span> <span style="float: right"><b>98,141
										</b>명</span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="well well-lg">
										<span><b>업력</b></span> <span style="float: right"><b>29
										</b>년</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="well  well-lg">
										<span><b>입사</b></span> <span style="float: right"><b>5,486
										</b>명 <b>6.0 </b>%</span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="well well-lg">
										<span><b>퇴사</b></span> <span style="float: right"><b>3,104
										</b>명 <b>3.0 </b>%</span>
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
											<b>평균연봉</b>
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

										<!-- <div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div> -->
									</div>
									<div class="row">
										<div class="col-sm-4"></div>
										<div class="col-sm-4">
											<div class="box-body">
												<canvas id="pieChart" style="height:100px"></canvas>
											</div>										
										</div>
										<div class="col-sm-4"></div>										
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

										<!-- <div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div> -->
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

<!-- 										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div> -->
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

<!-- 									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div> -->
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


<script src="<%=request.getContextPath()%>/resources/bower_components/chart.js/Chart.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/companies.js"></script>

<%@include file="include/companies-footer.jsp"%>