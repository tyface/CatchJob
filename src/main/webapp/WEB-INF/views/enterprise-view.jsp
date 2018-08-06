<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true"/> 


<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/enterprise.js"></script>  

<link href="${pageContext.request.contextPath}/resources/css/enterprise.css" rel="stylesheet" >

<script>

/* 숫자에 컴마 찍는 함수 */
	function addComma(num) {
 	   var regexp = /\B(?=(\d{3})+(?!\d))/g;
 	   return num.toString().replace(regexp, ',');
 	} 

$(document).ready(function(){
	   

	
	 var payAmtAvg = $("#payAmtAvg").text();
 	 payAmtAvg =  Math.round(payAmtAvg*12/0.09)+"";  
	payAmtAvg = payAmtAvg.substr(0,payAmtAvg.length-4);
 
 	 payAmtAvg = addComma(payAmtAvg); 

	 $("#payAmtAvg").text(payAmtAvg); 
	 
	 var dt = new Date();
	 var currentYear = dt.getFullYear();
	 var establishmentYear = $("#establishmentYear").text();
	 establishmentYear = establishmentYear.substr(0,4); 
	 var currier = currentYear-establishmentYear;
	 $("#establishmentYear").text(currier);
	
	 var personJson = JSON.parse('${personJson}');
	 $("#newPerson").text(personJson['newPerson']);
	 $("#outPerson").text(personJson['outPerson']);
//	 alert(personJson['newPerson']/$("#person").text())
	 var newPersonPercent =parseFloat(( personJson['newPerson']/$("#person").text() )*100).toFixed(2);
	 var outPersonPercent =parseFloat(( personJson['outPerson']/$("#person").text() )*100).toFixed(2);
	 $("#newPersonPercent").text(newPersonPercent);
	 $("#outPersonPercent").text(outPersonPercent);
	// alert(newPersonPercent);
	// alert(outPersonPercent);
	 
	 
	 
	
	var test = JSON.parse('${viewDataJson}');

 	var month = new Array(); //월
 	var salary = new Array(); //연금정보
 	var totalPerson = new Array(); //총 인원
 	var newPerson = new Array();
 	var outPerson = new Array();
 	

	for(var i in test){	
		var num = Math.round((test[i]['PAY_AMT'])/0.09/test[i]['NPN_SBSCRBER_CNT']);
		/* var result = addComma(num);
		alert(result);
		 */
		 month.push(test[i]['PAY_YM']) ;
		salary.push(num) ;
		totalPerson.push(test[i]['NPN_SBSCRBER_CNT']) ;
		newPerson.push(test[i]['NPN_NW_SBSCRBER_CNT']) ;
		outPerson.push(test[i]['NPN_SCBT_CNT']) ; 
		//alert(test[i]['PAY_AMT']);
	} 

	
	var ctx1 = document.getElementById("lineChart").getContext('2d');
	var lineChart = new Chart(ctx1, {
		type: 'bar',
		data: {
			labels: month,
			datasets: [{
					type: 'line',
					label: '평균 급여',
					borderColor: '#2196F3',
					borderWidth: 3,
					fill: false,
					data: salary,
				}  ], 
				borderWidth: 1
		},
		 options: {
		        elements: {
		            line: {
		                tension: 0, // disables bezier curves
		            }
		        },
		        scales: {
                    yAxes: [{
                            ticks: {
                                max: 3000000
                            }
                        }]
                }
		    }
		
	});	 
	
	

	
	// comboBarLineChart
	var ctx2 = document.getElementById("comboBarLineChart").getContext('2d');
	var comboBarLineChart = new Chart(ctx2, {
		type: 'bar',
		data: {
			labels: month,
			datasets: [{
					type: 'line',
					label: '총 인원',
					borderColor: '#484c4f',
					borderWidth: 3,
					fill: false,
					data: totalPerson,
				}, {
					type: 'bar',
					label: '입사자',
					backgroundColor: '#059BFF',
					data: newPerson,
					borderColor: 'white',
					borderWidth: 0
				}, {
					type: 'bar',
					label: '퇴사자',
					backgroundColor: '#FF6B8A',
					data: outPerson,
				}], 
				borderWidth: 1
		},
		options: {
	        elements: {
	            line: {
	                tension: 0, // disables bezier curves
	            }
	        }
	    }
	
	});	
			
	// pieChart
	var ctx3 = document.getElementById("pieChart").getContext('2d');
	var pieChart = new Chart(ctx3, {
		type: 'pie',
		data: {
				datasets: [{
					data: [12, 19, 3, 5, 2],
					backgroundColor: [
						'rgba(255,0,0,1)',
						'rgba(255, 94, 0, 1)',
						'rgba(255, 187, 0, 1)',
						'rgba(171,242,0, 1)',
						'rgba(29,219,22, 1)',
						
					],
					label: 'Dataset 1'
				}],
				labels: [
					"매우어려움",
					"어려움",
					"보통",
					"쉬움",
					"매우쉬움"
				]
			},
			options: {
				responsive: true
			}
	 
	});
	
});
</script>


<div class="container module-main"  style="background-color:white;color:#fff;height:220px;">

	<h1 style="padding-top: 50px; color : #2196F3; ">  ${entInfo.ENT_NM}</h1>

      
       <div class="btn btn-app follow"  id="btnFollow" onclick="classToggle()">
         <span class="glyphicon glyphicon-heart" style="font-size: 25px"></span> <p>팔로우</p>
      </div>
      
      

	<div style="float: right">
		<button type="button" class="btn btn-info ">기업리뷰작성</button>
		<button type="button" class="btn btn-info" id="myBtn2">면접후기</button>
	</div>


</div>
<br>


<div class="container " >
	<div class="row" >
		<nav class="col-sm-1" id="myScrollspy" >
	
			<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">	
				<li style="height: 30px"></li>
				<li><a href="#section1">
					<!-- <span class="glyphicon glyphicon-bookmark  logo-small" style="font-size: 50px"></span> -->
					<span class="fa fa-building logo-small" style="display: block;"></span>
		<!-- 			<span class="fa fa-building-o logo-small" ></span>
					<span class="fa  fa-paw logo-small" ></span>
					<span class="fa  fa-paw-o logo-small" ></span> -->
					
					기업정보</a></li>
				<li><a href="#section2">
					<!-- <span class="glyphicon glyphicon-file logo-small"></span> -->
					<span class="fa fa-weixin logo-small"  style="display: block;"></span>
						리뷰코멘트</a></li>
				<li><a href="#section3">
					<!-- <span class="glyphicon glyphicon-pencil logo-small"></span> -->
					<span class="fa fa-file-text logo-small"  style="display: block;"></span>
					
					면접후기</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<!-- <span class="glyphicon glyphicon-stats logo-small"></span> -->
					<span class="fa fa-line-chart logo-small"  style="display: block;"></span>
						월별그래프 <span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="#section41">월별그래프_평균급여</a></li>
						<li><a href="#section42">월별그래프_인원</a></li>
					</ul></li>
			</ul>
		</nav>
		
		
		
		
		<div class="col-sm-11" >
			<!-- 기업정보//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">
			
			<div id="section1" >
				<h3 id="title">기업정보</h3>

				<div class="panel panel-default">
					<div class="panel-body" style="color: black">

						<div class="row">
							<div class="col-sm-6">
								<span><b>소재지</b> </span><span> &nbsp;|&nbsp;&nbsp; ${entInfo.ADDR_BCITY_NM} &nbsp; ${entInfo.ADDR_SIGNGU_NM}</span>
							</div>
							<div class="col-sm-6">
								<span><b>산업군</b> </span><span> &nbsp;|&nbsp;&nbsp; ${entInfo.ENT_INDUTY_NM}</span>
							</div>
						
						</div>




						<br>

						<div class="row">
							<div class="col-sm-6">
								<button type="button" class="btn btn-default btn-lg btn-block"
									id="btnA">
									<span style="float: left"><b>인원</b></span> <span
										style="float: right"><b id="person">${entInfo.NPN_SBSCRBER_CNT } </b>명</span>
								</button>
							</div>
							<div class="col-sm-6">
								<button type="button" class="btn btn-default btn-lg btn-block"
									id="btnB">
									<span  style="float: left"><b>업력</b></span> 
									<span style="float: right"><b id = "establishmentYear" >${entInfo.ENT_FOND_YMD}</b>
									년</span>
								</button>
							</div>
						</div>
						<br>
						
						<div class="row">
							<div class="col-sm-6">
								<button type="button" class="btn btn-default btn-lg btn-block"
									id="btnC">
									<span  style="float: left"><b>입사</b></span> <span style="float: right"><b id="newPerson">${person.newPerson}
									 &nbsp;</b> &nbsp;명  &nbsp; &nbsp;<b id="newPersonPercent"></b> &nbsp;%</span>
								</button>
							</div>
							<div class="col-sm-6">
								<button type="button" class="btn btn-default btn-lg btn-block"
									id="btnD">
									<span  style="float: left"><b>퇴사</b></span> <span style="float: right"><b id="outPerson">${person.outPerson}
									 &nbsp;</b> &nbsp;명  &nbsp; &nbsp;<b id="outPersonPercent"></b> &nbsp;%</span>
								</button>
							</div>
						</div>
						<br>


						<br>










						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">

								<div class="box">
									<div class="box-header">
										<h3 class="box-title">
											<span id="select">인원</span>
										</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body no-padding">
										<table class="table table-condensed">
											<tr>
												<th style="width: 10px">#</th>
												<th>Task</th>
												<th>Progress</th>
												<th style="width: 40px">Label</th>
											</tr>
											<tr>
												<td>1.</td>
												<td>현재 기업</td>
												<td>
													<div class="progress progress-xs  progress-striped active">
														<div class="progress-bar progress-bar-danger"
															style="width: 55%" id="entPer"></div>
													</div>
												</td>
												<td><span class="badge bg-red" id="numOfEnt">55</span></td>
											</tr>
											<tr>
												<td>2.</td>
												<td>동종 산업군</td>
												<td>
													<div class="progress progress-xs  progress-striped active">
														<div class="progress-bar progress-bar-yellow "
															style="width: 20%" id="indPer"></div>
													</div>
												</td>
												<td><span class="badge bg-yellow" id="numOfInd">70</span></td>
											</tr>
											<tr>
												<td>3.</td>
												<td>전체 기업</td>
												<td>
													<div class="progress progress-xs progress-striped active">
														<div class="progress-bar progress-bar-primary"
															style="width: 30%" id="toEntPer"></div>
													</div>
												</td>
												<td><span class="badge bg-light-blue" id="numOfTotEnt">30</span></td>
											</tr>

										</table>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
						</div>

						<br>















						<div class="row">

				
								<div class="col-sm-5">

									<p style="text-align: right;">
										<b> 평균연봉</b>
									</p>
									<p style="text-align: right;">(국민연금)</p>
								</div>
								<div class="col-sm-7">
									<h1>
										<b ><span id="payAmtAvg">${entInfo.PAY_AMT_AVG}</span>만원</b>
									</h1>
								</div>
			
						</div>


					</div>
				</div>

</div>

			</div>
			<!-- 리뷰코멘트//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">
			<div id="section2">
				<h3 id="title">리뷰코멘트</h3>
				<button type="button" class="btn btn-infofault">리뷰코멘트 작성</button>
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
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우 40세미만
												격년. 40세 이상의경우 1회/년 진행
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
												진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 1년에 한번 있는 건강검진
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
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

						
								<div>
								<span class="star-input">
								  <span class="input" id="star">
								    <input type="radio" name="star-input" id="p2" value="1"><label for="p2">1</label>
								    <input type="radio" name="star-input" id="p4" value="2"><label for="p4">2</label>
								    <input type="radio" name="star-input" id="p6" value="3"><label for="p6">3</label>
								    <input type="radio" name="star-input" id="p8" value="4"><label for="p8">4</label>
								    <input type="radio" name="star-input" id="p10" value="5"><label for="p10">5</label>

								  </span>
								  <output for="star-input"><b>0</b> 점</output>
								</span>
								</div>

								<div class="input-group input-group-sm">
									<input type="text" class="form-control"
										placeholder="기업리뷰를 추가로 입력해주세요"> <span
										class="input-group-btn">
										<button type="button"  class="btn btn-flat btn-info"
											>제출</button>

									</span>
								</div>

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
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우 40세미만
												격년. 40세 이상의경우 1회/년 진행
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
												진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 1년에 한번 있는 건강검진
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
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
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우 40세미만
												격년. 40세 이상의경우 1회/년 진행
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
												진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 1년에 한번 있는 건강검진
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
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
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우 40세미만
												격년. 40세 이상의경우 1회/년 진행
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
												진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 1년에 한번 있는 건강검진
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
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
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 너무 과한 건강검진 이런건 좋긴한데 너무 좋다..
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 임직원의 건강 검진의 경우 강북삼성병원 종합검진센터에서 최고의 검진 서비스를 받음. 배우자의경우 40세미만
												격년. 40세 이상의경우 1회/년 진행
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 본사 내 한가족 플라자에 있는 병원에서 주기적인 무료 건강검진 진행, 감기와 같은 가벼운 질병도 무료
												진단, 약 처방 지원 등 굉장히 만족스러운 건강 복지 (하지만 치과 진료는 굉장히 수준이 떨어짐)
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
												</p> 1년에 한번 있는 건강검진
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<small><span class="glyphicon glyphicon-star"></span>
														5.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a> 2018.05.02</small>
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
</div>

			<!-- 면접후기//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">
			<div id="section3">
				<h3 id="title">면접후기</h3>
				<button type="button" class="btn btn-info " id="myBtn">면접후기
					작성</button>
				<!--  <button type="button" class="btn btn-info btn-lg" id="myBtn">면접후기 작성</button> -->






				<p>Try to scroll this section and look at the navigation list
					while scrolling!가나다라</p>

				<div class="panel-group" style="color: black">

					<div class="panel panel-default">
						<div class="panel-body">

							<div class="chart">
								<canvas id="areaChart" style="height: 00px"></canvas>
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
									<div class="card-header">
										<i class="fa fa-table"></i> Pie Chart
									</div>
										
									<div class="card-body">
										<canvas id="pieChart"></canvas>
									</div>
									<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
								</div><!-- end card-->					
			
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
												<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에 대한
													문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에 들지
													않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재 사회의
													이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
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
												<p class="font-gray">인성면접의 경우 부장급 이상의 임원분들이 들어오는데 전공에 대한
													문제는 전혀 없었고 자소서와 에세이 기반으로 질문을 함. 본인의 경우에는 면접관분들이 답변이 마음에 들지
													않았는지 계속 다른 대답을 해볼것을 요구함. 예를 들어 본인의 직무지원이유 그리고 포부 또 현재 사회의
													이슈등에 대한질문 전공면접의 경우에는 3개의 키워드 중에서 하나를
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

						</div>
						<!-- 패널 바디... -->
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

			</div>

			<!-- 그래프1//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">
			<div id="section41">
				<h3 id="title">월별그래프-평균급여</h3>
				<p>Try to scroll this section and look at the navigation list
					while scrolling!</p>

				<!-- 그래프 -->
				<div class="panel panel-default">
					<div class="panel-body">


						<div class="card-header">
							<i class="fa fa-table"></i> Combo Bar Line Chart
						</div>
							
						<div class="card-body">
							<canvas id="lineChart"></canvas>
						</div>							
						<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
							
						<!-- <div class="box box-primary">
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
										<canvas id="lineChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
						</div> -->


					</div>

				</div>
				</div>
			</div>
			<!-- 그래프2//////////////////////////////////////////////////////////////////////////////// -->
		<div class="module">	
			<div id="section42">
				<h3 id="title">월별그래프-인원</h3>
				<p>Try to scroll this section and look at the navigation list
					while scrolling!</p>

				<!-- 그래프 -->
				
		
				<div class="panel panel-default">
					<div class="panel-body">

										
					
						<div class="card-header">
							<i class="fa fa-table"></i> Combo Bar Line Chart
						</div>
							
						<div class="card-body">
							<canvas id="comboBarLineChart"></canvas>
						</div>							
						<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
							
				
<!-- 
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
									<canvas id="barChart" style="height: 230px"></canvas>
								</div>
							</div>
						</div> -->



					</div>
				</div>
</div>
			</div>


		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content"  >
		<form action="writeInterview" id="writeForm" method="post">
		<input type="hidden" name="entIndex" value="${entInfo.ENT_IDX}">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">면접후기 작성</h4>
			</div>
			<div class="modal-body ">

				<!-- 기업명  -->
	<!-- 			<div class="form-group">
					<label>기업명</label> <select class="form-control">
						<option>삼성전자</option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</div> -->

				<div class="form-group">
					<label>기업명</label>
						<input type="text" class="form-control"
								value="${entInfo.ENT_NM}" readonly="readonly">
				</div>
				<!-- 면접경험 radio...........intrvwExperience-->
				<div class="form-group">
					<label>면접 경험 </label>
					<div class="radio">
						<label> <input type="radio" name="intrvwExperience"
							id="optionsRadios1" value="1" checked >부정적
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="intrvwExperience"
							id="optionsRadios2" value="2">보통
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="intrvwExperience"
							id="optionsRadios3" value="3">긍정적
						</label>
					</div>
				</div>

				<!--면접후기// 면접에서 채용까지의 과정 요약 -->
				<div class="form-group">
					<label>면접에서 채용까지의 과정 요약</label>
					<textarea class="form-control" rows="3" name="intrvwReview" placeholder="Enter ..."></textarea>
				</div> 
				<!-- 면접질문 입력하기 -->
				<div class="form-group">
					<label>면접질문 입력하기</label>
					<textarea class="form-control" rows="3"  name="intrvwQuestion" placeholder="Enter ..."></textarea>
				</div>
				<!-- 면접에 대한 답변 -->
				<div class="form-group">
					<label>작성한 면접질문에 대한 답변을 입력하세요.</label>
					<textarea class="form-control" rows="3" name="intrvwAnswer"  placeholder="Enter ..."></textarea>
				</div>

				<!-- 면접난이도 -->
				<div class="form-group">
					<label>면접난이도</label> <select class="form-control" name="intrvwDifficulty">
						<option  value="1">매우 쉬움</option>
						<option  value="2">쉬움</option>
						<option  value="3">보통</option>
						<option  value="4">어려움</option>
						<option  value="5">매우 어려움</option>
					</select>
				</div>
				<!-- 면접결과 -->
				<div class="form-group">
					<label>이 기업에 합격하셨나요?</label> <select class="form-control" name="intrvwResult">
						<option value="1">합격</option>
						<option value="2">불합격</option>
						<option value="3">대기중</option>
						<option value="4">합격했으나 취업하지 않음</option>

					</select>
				</div>
				<!-- 면접경로 -->
				<div class="form-group">
					<label>면접경로</label> <select class="form-control" name="intrvwRoute">
						<option value="1">공채</option>
						<option value="2">온라인지원</option>
						<option value="3">직원추천</option>
						<option value="4">헤드헌터</option>
						<option value="5">학교 취업지원센터</option>
						<option value="6">기타</option>
					</select>
				</div>

				<!--면접일자 -->
				<div class="form-group">
					<label>면접일자</label>

					<div class="input-group date">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<input type="text" class="form-control pull-right" name="intrvwDate" id="datepicker" placeholder="YYYYMM">
					</div>
				</div>
				<!-- 면접일자/발표시기  -->
				<div class="form-group">
					<label>발표시기</label>
					<div class="row">
						<div class="col-sm-11">
							<input type="text" class="form-control"  name="presentationDate" 
								placeholder="면접 결과 발표까지 걸린 시간 " >
						</div>
						<div class="col-sm-1">
							<p>일</p>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-infofault" >제출</button> <!-- data-dismiss="modal" -->
			</div>
		</form>	
		</div>

	</div>
</div>




<jsp:include page="include/footer.jsp" flush="true"/> 
