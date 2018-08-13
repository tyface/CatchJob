<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true" />


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/enterprise.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/enterprise.css"
	rel="stylesheet">

<script>

//$(document).ready(function(){
var status = "logout";
$(function(){
	//alert(${mberIndex});
	if('${mberIndex}'==''){
		//alert(status);
	}else{
		status = "login";
		//alert(status);
	}

	entInf();
	chart();
	starScore();

	$("#write-btn").on("click", function(){
		alert("기업리뷰를 성공적으로 작성하였습니다^^");
		$("#writeForm").submit();
		$("#myModal").modal("hide");
		window.location.reload();
	})

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

  /* 모달----------------------------------------------------------------------  */
      $("#myBtn").click(function(){
          $("#myModal").modal();
      });
      $("#myBtn2").click(function(){
          $("#myModal").modal();
      });



	 var interviewJson = JSON.parse('${interviewJson}');
	 for(var i in interviewJson){
		// alert(interviewJson[i]['intrvwDifficulty']);
		//progress class 요소의 하위요소인 div 선택해서 intrvw class 추가

		 if(interviewJson[i]['intrvwDifficulty'] == '매우 어려움'){
			$("#difficulty"+i).addClass("intrvwlv5");
		} else if(interviewJson[i]['intrvwDifficulty'] == '어려움'){
			$("#difficulty"+i).addClass("intrvwlv4");
		}else if(interviewJson[i]['intrvwDifficulty'] == '보통'){
			$("#difficulty"+i).addClass("intrvwlv3");
		}else if(interviewJson[i]['intrvwDifficulty'] == '쉬움'){
			$("#difficulty"+i).addClass("intrvwlv2");
		}else if(interviewJson[i]['intrvwDifficulty'] == '매우 쉬움'){
			$("#difficulty"+i).addClass("intrvwlv1");
		}

	 }


	 	$(".review-btn").on("click",function(){
	 	alert($(this).val());
			 var statusCount = $(this).next().val();
			 //alert($(this).next().val());
		 //안녕
			if(status =="logout"){
				alert("로그인 후 이용 가능합니다");
				return false;
			}else{
				//alert("등록!")
				//alert($(".contents").prop("value"))
				var contents = $("#contents"+statusCount).val();
				var evaluationScore = $("#starScore").text();
				var questionNum = statusCount;
				var entIndex = $("#entIndex").val();
				//alert("내용:"+contents+"   질문번호:"+statusCount);
				//alert(evaluationScore);
				//alert(questionNum);
				//alert(entIndex);
				  $.ajax({
					url:"${pageContext.request.contextPath}/enterprise/test",
					type:"post",
					data:{ "contents" : contents,
						"evaluationScore" : evaluationScore,
						"questionNum" : questionNum,
						"entIndex" : entIndex

					},
					dataType: "json",
					success : function(result){
						if(result){
							alert("등록되었습니다.");
						}else{
							alert("등록 실패하였습니다.");
						}
					}
				});
				 return false;

			}

 	});

});

function entInf(){

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
	$("#numOfEnt").text($("#person").text());
	 $("#btnA").click(function() {
			//alert("버튼A 눌림!");

			$("#select").text("인원");
			$("#numOfEnt").text($("#person").text());
			$("#numOfInd").text("37");
			$("#numOfTotEnt").text("28");
			// var entPer =  DB의 '국민연금 총 가입자 수' 가져오면 됨
			// var indPer = 동종산업군 전체 '국민연금 총 가입자 수' / 동종산업군 수
			// var toEntPer = 전체기업의 '국민연금 총 가입자 수' / 전체 기업 수
			$("#entPer").css('width', '60%');
			$("#indPer").css('width', '10%');
			$("#toEntPer").css('width', '100%');

		});

		$("#btnB").click(function() {
			//alert("버튼B 눌림!");
			$("#select").text("업력");
			$("#numOfEnt").text(currier);
			$("#numOfInd").text("30");
			$("#numOfTotEnt").text("60");

			$("#entPer").css('width', "100%");
			$("#indPer").css('width', '30%');
			$("#toEntPer").css('width', '60%');
		});

		$("#btnC").click(function() {
			//alert("버튼C 눌림!");
			$("#select").text("입사");
			$("#numOfEnt").text(personJson['newPerson']);
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("40");

			$("#entPer").css('width', '30%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '40%');
		});

		$("#btnD").click(function() {
			//alert("버튼D 눌림!");
			$("#select").text("퇴사");
			$("#numOfEnt").text(personJson['outPerson']);
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("30");

			$("#entPer").css('width', '40%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '30%');
		});




}
function chart(){
	var viewDataJson = JSON.parse('${viewDataJson}');

 	var month = new Array(); //월
 	var salary = new Array(); //연금정보
 	var totalPerson = new Array(); //총 인원
 	var newPerson = new Array();
 	var outPerson = new Array();


	for(var i in viewDataJson){
		var num = Math.round((viewDataJson[i]['PAY_AMT'])/0.09/viewDataJson[i]['NPN_SBSCRBER_CNT']);
		/* var result = addComma(num);
		alert(result);
		 */
		 month.push(viewDataJson[i]['PAY_YM']) ;
		salary.push(num) ;
		totalPerson.push(viewDataJson[i]['NPN_SBSCRBER_CNT']) ;
		newPerson.push(viewDataJson[i]['NPN_NW_SBSCRBER_CNT']) ;
		outPerson.push(viewDataJson[i]['NPN_SCBT_CNT']) ;
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
                             //  max:3900000,
                            //   min:3100000
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

	 var interviewPieChartJson = JSON.parse('${interviewPieChartJson}');

	 var chartData = new Array(0,0,0,0,0);

  	  for(var i in interviewPieChartJson){

	     if(interviewPieChartJson[i]['INTRVW_DFFLY'] == '1'){
	    	 chartData[0]=interviewPieChartJson[i]['count'];
	     }else if(interviewPieChartJson[i]['INTRVW_DFFLY'] == '2'){
	    	 chartData[1]=interviewPieChartJson[i]['count'];
	     }else if(interviewPieChartJson[i]['INTRVW_DFFLY'] == '3'){
	    	 chartData[2]=interviewPieChartJson[i]['count'];
	     }else if(interviewPieChartJson[i]['INTRVW_DFFLY'] == '4'){
	    	 chartData[3]=interviewPieChartJson[i]['count'];
	     }else if(interviewPieChartJson[i]['INTRVW_DFFLY'] == '5'){
	    	 chartData[4]=interviewPieChartJson[i]['count'];
	     }
  	 }

	// pieChart
	var ctx3 = document.getElementById("pieChart").getContext('2d');
	var pieChart = new Chart(ctx3, {
		type: 'pie',
		data: {
				datasets: [{
					data: chartData,
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

}
function starScore(){
    /* 별점 */
	  //star rating
	    var starRating = function(){
	      var $star = $(".star-input"),
	          $result = $star.find("output>b");
	      $(document)
	         .on("focusin", ".star-input>.input", function(){
	        $(this).addClass("focus");
	      })
	        .on("focusout", ".star-input>.input", function(){
	        var $this = $(this);
	        setTimeout(function(){
	          if($this.find(":focus").length === 0){
	            $this.removeClass("focus");
	          }
	        }, 100);
	      })
	        .on("change", ".star-input :radio", function(){
	        //여기여기서 값 넘겨주기 !!
	       // alert($(this).next().text())
	        $result.text($(this).next().text());
	      })
	        .on("mouseover", ".star-input label", function(){
	        	$result.text($(this).text());

	      })
	        .on("mouseleave", ".star-input>.input", function(){
	        var $checked = $star.find(":checked");
	        //alert("$checked:"+$checked);
	        if($checked.length === 0){
	          $result.text("0");
	        } else {
	          $result.text($checked.next().text());
	        }
	      });
	    };
	    starRating();
}
/* 숫자에 컴마 찍는 함수 */
function addComma(num) {
   var regexp = /\B(?=(\d{3})+(?!\d))/g;
   return num.toString().replace(regexp, ',');
}

</script>

<%=session.getAttribute("mberIndex")%>
<div class="container module-main"
	style="background-color: white; color: #fff; height: 220px;">

	<h1 style="padding-top: 50px; color: #2196F3;">${entInfo.ENT_NM}</h1>

	<div class="btn mailbox-star" id="btnFollow">
		<a href="#"><i class="fa fa-heart-o"
			style="color: red; font-size: 20px;"></i></a>
		<p>팔로우</p>
	</div>


	<div style="float: right">
		<button type="button" class="btn btn-info ">기업리뷰작성</button>
		<button type="button" class="btn btn-info" id="myBtn2">면접후기</button>
	</div>


</div>
<br>


<div class="container ">
	<div class="row">
		<nav class="col-sm-1" id="myScrollspy">

			<ul class="nav nav-pills nav-stacked" data-spy="affix"
				data-offset-top="205">
				<li style="height: 30px"></li>
				<li><a href="#section1"> <!-- <span class="glyphicon glyphicon-bookmark  logo-small" style="font-size: 50px"></span> -->
						<span class="fa fa-building logo-small" style="display: block;"></span>
						<!-- 			<span class="fa fa-building-o logo-small" ></span>
					<span class="fa  fa-paw logo-small" ></span>
					<span class="fa  fa-paw-o logo-small" ></span> --> 기업정보
				</a></li>
				<li><a href="#section2"> <!-- <span class="glyphicon glyphicon-file logo-small"></span> -->
						<span class="fa fa-weixin logo-small" style="display: block;"></span>
						리뷰코멘트
				</a></li>
				<li><a href="#section3"> <!-- <span class="glyphicon glyphicon-pencil logo-small"></span> -->
						<span class="fa fa-file-text logo-small" style="display: block;"></span>

						면접후기
				</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <!-- <span class="glyphicon glyphicon-stats logo-small"></span> -->
						<span class="fa fa-line-chart logo-small" style="display: block;"></span>
						월별그래프 <span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="#section41">월별그래프_평균급여</a></li>
						<li><a href="#section42">월별그래프_인원</a></li>
					</ul></li>
			</ul>
		</nav>

		<div class="col-sm-11">
			<!-- 기업정보//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">

				<div id="section1">
					<h3 id="title">기업정보</h3>

					<div class="panel panel-default">
						<div class="panel-body" style="color: black">

							<div class="row">
								<div class="col-sm-6">
									<span><b>소재지</b> </span><span> &nbsp;|&nbsp;&nbsp;
										${entInfo.ADDR_BCITY_NM} &nbsp; ${entInfo.ADDR_SIGNGU_NM}</span>
								</div>
								<div class="col-sm-6">
									<span><b>산업군</b> </span><span> &nbsp;|&nbsp;&nbsp;
										${entInfo.ENT_INDUTY_NM}</span>
								</div>

							</div>




							<br>

							<div class="row">
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block"
										id="btnA">
										<span style="float: left"><b>인원</b></span> <span
											style="float: right"><b id="person">${entInfo.NPN_SBSCRBER_CNT }
										</b>명</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block"
										id="btnB">
										<span style="float: left"><b>업력</b></span> <span
											style="float: right"><b id="establishmentYear">${entInfo.ENT_FOND_YMD}</b>
											년</span>
									</button>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block"
										id="btnC">
										<span style="float: left"><b>입사</b></span> <span
											style="float: right"><b id="newPerson">${person.newPerson}
												&nbsp;</b> &nbsp;명 &nbsp; &nbsp;<b id="newPersonPercent"></b>
											&nbsp;%</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block"
										id="btnD">
										<span style="float: left"><b>퇴사</b></span> <span
											style="float: right"><b id="outPerson">${person.outPerson}
												&nbsp;</b> &nbsp;명 &nbsp; &nbsp;<b id="outPersonPercent"></b>
											&nbsp;%</span>
									</button>
								</div>
							</div>
							<br> <br>










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
														<div class="progress progress-xs   ">
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
														<div class="progress progress-xs   ">
															<div class="progress-bar progress-bar-warning "
																style="width: 20%" id="indPer"></div>
														</div>
													</td>
													<td><span class="badge bg-yellow" id="numOfInd">70</span></td>
												</tr>
												<tr>
													<td>3.</td>
													<td>전체 기업</td>
													<td>
														<div class="progress progress-xs  ">
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
								<div class="col-sm-2">
									<p>
										<b> 평균연봉</b>
									</p>
									<p>(국민연금)</p>
								</div>
								<div class="col-sm-4">
									<h2>
										<b><span id="payAmtAvg">${entInfo.PAY_AMT_AVG}</span>만원</b>
									</h2>
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
					<div class="panel-group " id="accordion">

						<c:forEach begin="0" end="5" varStatus="status"
							items="${question}" var="question">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapse${status.count}">${question.QUESTION}<span
											style="color: #6799FF"> (${question.COUNT}) </span> <span
											style="float: right; margin-right: 20%">${question.AVG} <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</span>

										</a>
									</h4>
								</div>

								<div id="collapse${status.count}"
									class="panel-collapse collapse">
									<!-- in -->
									<div class="panel-body" style="color: black">
										<table class="table">
											<thead>
												<tr>
													<th>총${question.COUNT}개의 기업리뷰 코멘트</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="reviewList" items="${reviewList}"
													varStatus="index">

													<c:if test="${reviewList.questionNum eq question.QESTN_NO}">

														<tr>
															<td>
																<p>
																	<small><span class="glyphicon glyphicon-star"></span>
																		${reviewList.evaluationScore}.0 <a style="color: #D5D5D5">&nbsp;|&nbsp;</a>
																		${reviewList.regDate}</small>
																</p> <span>${reviewList.contents}</span>
															</td>
														</tr>
													</c:if>
												</c:forEach>

<!-- 												<tr>
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
												</tr> -->
											</tbody>
										</table>

<form id="reviewForm" class="reviewForm" name="reviewForm" >
<input type="hidden" name="questionNum" id="questionNum" value="${question.QESTN_NO}">
<input type="hidden" name="entIndex" id="entIndex" value="${entInfo.ENT_IDX}">

										<div>
											<span class="star-input">
												<span class="input"	id="star">
												<input type="radio" name="star-input" id="p2" value="1">
												<label for="p2">1</label>
												<input type="radio" name="star-input" id="p4" value="2">
												<label for="p4">2</label>
												<input type="radio" name="star-input" id="p6" value="3">
												<label for="p6">3</label>
												<input type="radio" name="star-input" id="p8" value="4">
												<label for="p8">4</label>
												<input type="radio" name="star-input" id="p10" value="5">
												<label for="p10">5</label>
											</span>
												<output for="star-input">
													<b id="starScore">0</b> 점
												</output>
											</span>
										</div>

										<div class="input-group input-group-sm">
											<input type="text" class="form-control contents${status.count}" name="contents" id="contents${status.count}" placeholder="기업리뷰를 추가로 입력해주세요" >
											<span class="input-group-btn">
												<input type="submit" class="btn btn-flat btn-info review-btn" id="review-btn" value="제출">
												<input type="hidden" id="statusCount" value="${status.count}">
											</span>
										</div>
</form>
									</div>
								</div>
							</div>
						</c:forEach>



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
										<div class="col-sm-2"></div>

										<div class="col-sm-8">
											<div class="card-header">
												<i class="fa fa-table"></i> Pie Chart
											</div>

											<div class="card-body">
												<canvas id="pieChart"></canvas>
											</div>
											<div class="card-footer small text-muted">Updated
												yesterday at 11:59 PM</div>
										</div>
										<!-- end card-->

										<div class="col-sm-2"></div>
									</div>

								</div>


							</div>
						</div>






						<!-- 면접후기1 -->
						<c:forEach begin="0" varStatus="status" end="9" var="interview"
							items="${interview}">
							<div class="panel panel-default">
								<div class="panel-heading font-gray">${interview.regDate}</div>
								<div class="panel-body ">
									<div class="col-sm-3">
										<div>
											<p>
												<b>면접난이도</b>
											</p>
											<div id="difficulty${status.index}">
												<p class="intrvwDifficulty">${interview.intrvwDifficulty}</p>
												<div class="progress" style="height: 10px">
													<div class="progress-bar bar1" role="progressbar"
														style="width: 20%;"></div>
													<div class="progress-bar bar2" role="progressbar"
														style="width: 20%;"></div>
													<div class="progress-bar bar3" role="progressbar"
														style="width: 20%;"></div>
													<div class="progress-bar bar4" role="progressbar"
														style="width: 20%;"></div>
													<div class="progress-bar bar5 " role="progressbar"
														style="width: 20%;"></div>
												</div>
											</div>
											<!-- background-color: #EAEAEA -->

										</div>
										<br>

										<div>
											<p>
												<b>면접일자</b>
											</p>
											<p>${interview.intrvwDate}</p>
											<br>
										</div>
										<div>
											<p>
												<b>면접경로</b>
											</p>
											<p>${interview.intrvwRoute}</p>
											<br>
										</div>

									</div>
									<div class="col-sm-9">
										<table class="table">
											<thead>
												<tr>
													<th colspan="4">"${interview.intrvwReview}"</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="4">
														<p>
															<b>면접질문</b>
														</p>
														<p class="font-gray">${interview.intrvwQuestion}</p>
													</td>
												</tr>
												<tr>
													<td colspan="4">
														<p>
															<b>질문에 대한 답변</b>
														</p>
														<p class="font-gray">${interview.intrvwAnswer}</p>
													</td>
												</tr>
												<tr>
													<td colspan="4">
														<p>
															<b>발표시기</b>
														</p>
														<p class="font-gray">${interview.presentationDate}일후</p>
													</td>
												</tr>


												<tr>
													<th colspan="2" style="width: 50%">
														<p class="well well-sm">
															<span>면접결과</span> <span
																style="float: right; margin-right: 25%"><span
																class="glyphicon glyphicon-thumbs-up"></span>${interview.intrvwResult}
															</span>
														</p>
													</th>
													<th colspan="2" style="width: 50%">
														<p class="well well-sm">
															<span>면접경험</span> <span
																style="float: right; margin-right: 25%"><span
																class="glyphicon glyphicon-thumbs-up"></span>${interview.intrvwExperience}</span>
														</p>
													</th>

												</tr>

											</tbody>
										</table>
									</div>

								</div>
							</div>
						</c:forEach>




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
							<div class="card-footer small text-muted">Updated yesterday
								at 11:59 PM</div>

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
							<div class="card-footer small text-muted">Updated yesterday
								at 11:59 PM</div>


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
		<div class="modal-content">
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
						<label>기업명</label> <input type="text" class="form-control"
							value="${entInfo.ENT_NM}" readonly="readonly">
					</div>
					<!-- 면접경험 radio...........intrvwExperience-->
					<div class="form-group">
						<label>면접 경험 </label>
						<div class="radio">
							<label> <input type="radio" name="intrvwExperience"
								id="optionsRadios1" value="1" checked>부정적
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
						<textarea class="form-control" rows="3" name="intrvwReview"
							placeholder="Enter ..."></textarea>
					</div>
					<!-- 면접질문 입력하기 -->
					<div class="form-group">
						<label>면접질문 입력하기</label>
						<textarea class="form-control" rows="3" name="intrvwQuestion"
							placeholder="Enter ..."></textarea>
					</div>
					<!-- 면접에 대한 답변 -->
					<div class="form-group">
						<label>작성한 면접질문에 대한 답변을 입력하세요.</label>
						<textarea class="form-control" rows="3" name="intrvwAnswer"
							placeholder="Enter ..."></textarea>
					</div>

					<!-- 면접난이도 -->
					<div class="form-group">
						<label>면접난이도</label> <select class="form-control"
							name="intrvwDifficulty">
							<option value="1">매우 쉬움</option>
							<option value="2">쉬움</option>
							<option value="3">보통</option>
							<option value="4">어려움</option>
							<option value="5">매우 어려움</option>
						</select>
					</div>
					<!-- 면접결과 -->
					<div class="form-group">
						<label>이 기업에 합격하셨나요?</label> <select class="form-control"
							name="intrvwResult">
							<option value="1">합격</option>
							<option value="2">불합격</option>
							<option value="3">대기중</option>
							<option value="4">합격했으나 취업하지 않음</option>

						</select>
					</div>
					<!-- 면접경로 -->
					<div class="form-group">
						<label>면접경로</label> <select class="form-control"
							name="intrvwRoute">
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
						<!-- <div class="row">
								<div class="col-sm-3">
									<select class="form-control" name="intrvwRoute">
										<option value="1">2018</option>
										<option value="2">2017</option>
										<option value="3">2016</option>
									</select>
								</div>
								<div class="col-sm-1">년
								</div>
								<div class="col-sm-3">
									<select class="form-control" name="intrvwRoute">
										<option value="1">01</option>
										<option value="2">02</option>
										<option value="3">03</option>
										<option value="4">04</option>
										<option value="5">05</option>
										<option value="6">06</option>
										<option value="6">07</option>
										<option value="6">08</option>
										<option value="6">09</option>
										<option value="6">10</option>
										<option value="6">11</option>
										<option value="6">12</option>
									</select>
								</div>
								<div class="col-sm-1">월
								</div>
							</div> -->
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								name="intrvwDate" id="datepicker" placeholder="YYYYMM">
						</div>
					</div>
					<!-- 면접일자/발표시기  -->
					<div class="form-group">
						<label>발표시기</label>
						<div class="row">
							<div class="col-sm-11">
								<input type="text" class="form-control" name="presentationDate"
									placeholder="면접 결과 발표까지 걸린 시간 ">
							</div>
							<div class="col-sm-1">
								<p>일</p>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-infofault" >제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>




<jsp:include page="include/footer.jsp" flush="true" />
