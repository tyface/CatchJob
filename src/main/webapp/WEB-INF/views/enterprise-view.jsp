<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ include file="include/header.jsp"%>
<meta charset="UTF-8">
<security:authentication var="principal" property="principal"/>

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/late/fontawesome-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/late/bars-movie.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enterprise.css" >


<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chartjs-plugin-datalabels.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>

<!-- jQuery Validation 플러그인을 이용하여 손쉽게 검증하기 -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/messages_ko.min.js"></script>


<script>
var following = ${entInfo.FOLLOWING}
var entIndex = ${entInfo.ENT_IDX};
var empCount = JSON.parse('${empCount}');
var industryAvgInfo = JSON.parse('${industryAvgInfo}');
var totalPerson = [industryAvgInfo.NPN_SBSCRBER_CNT,industryAvgInfo.PEER_NPN_SBSCRBER_AVG.toFixed(0),industryAvgInfo.TOTAL_NPN_SBSCRBER_AVG.toFixed(0)];
var fondDate = [industryAvgInfo.ENT_FOND_YMD,industryAvgInfo.PEER_ENT_FOND_YMD_AVG.toFixed(0),industryAvgInfo.TOTAL_ENT_FOND_YMD_AVG.toFixed(0)];
var newPerson = [industryAvgInfo.NPN_NW_SBSCRBER_CNT, industryAvgInfo.PEER_NPN_NW_SBSCRBER_AVG.toFixed(0),industryAvgInfo.TOTAL_NPN_NW_SBSCRBER_AVG.toFixed(0)];
var outPerson = [industryAvgInfo.NPN_SCBT_CNT,industryAvgInfo.PEER_NPN_SCBT_AVG.toFixed(0),industryAvgInfo.TOTAL_NPN_SCBT_AVG.toFixed(0)];




$(function(){

	entInf();
	changeAvgInfo('인원')
	reviewbarChart();//리뷰  바 차트
	getInterviewList(1);
	interviewExperienceChart() // 면접 경험 차트
	interviewResultChart() // 면접 결과 차트
	// interviewDifficultyShape(); //인터뷰 면접난이도 색칠 부분


	stars(); //별
	interviewValidation(); //인터뷰 유효성 검사 부분
	saramin(); //#section5 사람인채용정보
	followCheck();//팔로잉 기업인지 확인

	/* member session 존재여부 확인 */
	if(member == 'anonymousUser'){
	}else{
		status = "login";
	}

    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('.move-top').fadeIn();
        } else {
            $('.move-top').fadeOut();
        }
    });

    $(".move-top").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });


	/* 그래프 내용들 배열로 저장 */
	for(var i in empCount){
		if(window.innerWidth < 500 && Number(i)%4!=0){
			continue
		}

		 var num = Math.round((empCount[i]['PAY_AMT'])/0.09/empCount[i]['NPN_SBSCRBER_CNT']);
		 month.push(empCount[i]['PAY_YM']) ;
		 salary.push(num) ;
		 viewSalary.push(num/10000) ;
		 totalPersonPerMonth.push(empCount[i]['NPN_SBSCRBER_CNT']) ;
		 newPersonPerMonth.push(empCount[i]['NPN_NW_SBSCRBER_CNT']) ;
		 outPersonPerMonth.push(empCount[i]['NPN_SCBT_CNT']) ;
	}
	chartPersonnel(); //월별그래프 인원

	/* 기업 팔로잉 START */
	$(".follow-btn").click(function (e) {
        var $this = $(this).find("i");
        var fa = $this.hasClass("fa");

	    if(status == "logout" & $this.hasClass("fa-heart-o")){

	    	  swal({
	        	  title: "로그인 하시겠습니까?",
	        	  text: "기업 팔로우는 로그인 후에 이용 가능합니다.",
	        	  type: "info",
	        	  confirmButtonClass: "btn-info",
	        	  showCancelButton: true,
	        	},
	        	function(){
	        		/* 로그인 모달 띄우기 */
					$("#loginModal").modal("show");
	        	})
	    }else{/* 로그인 상태임 */
		    if($this.hasClass("fa-heart-o")){
			  /* 팔로잉 기업 추가  */
			    $.ajax({
			  	  	  url:"${pageContext.request.contextPath}/enterprise/regFollow",
			  		  data:{entIndex : entIndex},
			  		  type: "post",
			  		  dataType:"json",
			  		  success: function(result){
			  			/* 성공 */
			  			  if(result){
			  				swal({
			  				  title: "팔로잉되었습니다!",
			  				  text: "팔로잉 기업은 [마이페이지 > 팔로잉 기업]에서 확인할 수 있습니다.",
			  				  type: "success",
			  			      confirmButtonClass: "btn-success",
			  				});
				    	      $this.toggleClass("fa-heart-o");
				    	      $this.toggleClass("fa-heart");
			  			  }else{
			  				  swal({
				  				  title: "팔로잉 할 수 없습니다.",
				  				  text: "팔로잉 기업은 최대 10개 까지 가능합니다",
				  				  type: "warning",
				  				  confirmButtonClass: "btn-warning",
				  			  });
			  			  }
			  		  }
			    })
		    }else{
		    	swal({
		    		  title: "팔로잉을 중단하시겠습니까?",
		    		  type: "info",
		    		  confirmButtonClass: "btn-info",
		    		  showCancelButton: true,
		    		  closeOnConfirm: false,
		    		},
		    		function(){
		    			 $.ajax({
					  		  url:"${pageContext.request.contextPath}/enterprise/revFollow",
					  		  data:{entIndex : entIndex},
					  		  type: "post",
					  		  dataType:"json",
					  		  success: function(result){
					  			/* 성공 */
					  				swal({
					  				    title: "팔로잉이 해제되었습니다.",
					  				    type: "success",
					  				    confirmButtonClass: "btn-success",
					  			    });
								   $this.toggleClass("fa-heart");
								   $this.toggleClass("fa-heart-o");
					  		  }
					    })
		    		})

		    }
	    }

   });/* 기업 팔로잉 END */


	/* 기업리뷰  등록 START */
 	$(".reviewForm").on("submit",function(){
		var point = $(this)[0][3].children[0].innerHTML;
		var statusCount = $(this)[0][6].value;
		var contents = jQuery.trim($("#contents"+statusCount).val());/* 기업리뷰  */

		if(status == "logout"){
			swal({
				title: "로그인 후 이용 가능합니다. \n\r 로그인 하시겠습니까?!",
			  text: "",
			  type: "info",
			  showCancelButton: true,
			  confirmButtonClass: "btn-info"
			},
			function() {
				$("#loginModal").modal("show");
			})
			return false;

	  }else{/* 로그인 상태임 */
			if(point < 1){
				swal({
					title: "별점을 선택해주세요",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-warning"
				})
				return false;
			}
			if(contents.length <10){
				swal({
					title: "10글자 이상 작성해주세요",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-warning"
				})
				return false;
			}
			point = Number(point);
			var questionNum = statusCount;

		  $.ajax({
				url:"${pageContext.request.contextPath}/enterprise/writeReview",
				type:"post",
				data:{"contents" : contents,
							"evaluationScore" : point,
							"questionNum" : questionNum,
							"entIndex" : entIndex
				},
				dataType: "json",
				success : function(result){
					if(result){

						swal({
							title:"등록되었습니다!",
							type:"success",
							confirmButtonClass: "btn-success",
						})
					}else{
						swal({
							title: "등록 실패하였습니다.",
							text:"이미 등록하셨습니다.",
							type: "warning",
							confirmButtonClass:"btn-warning",
						})
					}
					getReviewList(questionNum);
				}
			});
			return false;
		}
 	});/* 기업리뷰  등록 END */

});/* FUNCTION END */



/* 면접후기 작성 버튼 이벤트 START */
function intrWriteBtn(){
	 if(status == "logout"){
		  swal({
      	  title: "로그인 하시겠습니까?",
      	  text: "면접후기 작성은 로그인 후에 이용 가능합니다.",
      	  type: "info",
      	  showCancelButton: true,
      	  confirmButtonClass: "btn-info",
      	  },
	      function(){
	       	/* 로그인 모달 띄우기 */
	 			$("#loginModal").modal("show");
	      })
	  }else{/* 로그인 상태임 */
   	  $.ajax({
		  		url:"${pageContext.request.contextPath}/enterprise/itvwDuplicationCheck",
		  		data:{entIndex : entIndex},
		  		type: "post",
		  		dataType:"json",
		  		success: function(result){
		  			if(result){/* 중복 */
		  				swal({
		  					title: "이미 등록하셨습니다.",
		  					text: "[마이페이지 > 기업리뷰 작성]을 확인하세요",
		  					type: "warning",
		  					confirmButtonClass:"btn-warning",
		  				})
		  			}else{/* 중복X, 작성가능 */
		  				$("#loginModal").modal("show");
		  			}
		  		}
		  })
	  }
}



/* #section2 리뷰코멘트 - 만족도 */
function reviewbarChart(){
	var reviewValuesByItem = JSON.parse('${reviewValuesByItem}');
	var chartData = new Array(0,0,0,0,0);


	for( var i in reviewValuesByItem){
		  chartData[i]= reviewValuesByItem[i].COUNT;
	}
	var ctx4 = document.getElementById("reviewbarChart").getContext('2d');

	var reviewbarChart = new Chart(ctx4, {
		type: 'bar',
		/* 데이터 start */
		data: {
			labels: ['1점','2점','3점','4점','5점'],
			datasets: [{
					type: 'bar',
					backgroundColor: '#FFBB00',
					data: chartData,
					datalabels: {
						color:  '#abaaaa',
					},
				}],
				borderWidth: 1
		},/* 데이터 end */
		/* 옵션 start */
		options: {

			layout:{
				padding:{
					top:30,
				}
			},
			legend: {
		        display: false
		    },
			responsive: true,
			maintainAspectRatio: false,
			plugins: {
				datalabels: {
					align: 'end',
					anchor: 'end',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 0;
					},
					font: {
						weight: 'bold'
					},
				    formatter: function(value, context) {
                        return Math.ceil(value*100/'${numOfValuesByItem}')+'%';
                    }
				}
			},
			scales: {
				xAxes: [{
					barPercentage: 0.75,//차트 width 줄이기
                    display: true,
                    offset: true,

					gridLines: {
						display: false,
		            }
				}],
				yAxes: [{
					display: false,
                    ticks: {
                    	display: false,
						beginAtZero: true,
					},
					gridLines: {
						display: false,
		            }
				}]
			},
	    }/* 옵션 end */
	});
}/* #section2 리뷰코멘트 - 만족도  end*/

/* #section3 면접후기 면접경험 */
function interviewExperienceChart(){
	 var interviewExperienceChart = JSON.parse('${interviewExperienceChart}');

	 var chartData = new Array(0,0,0);

  	  for(var i in interviewExperienceChart){

	     if(interviewExperienceChart[i]['INTRVW_EXPRNC'] == '1'){
	    	 chartData[0]=interviewExperienceChart[i]['COUNT'];
	     }else if(interviewExperienceChart[i]['INTRVW_EXPRNC'] == '2'){
	    	 chartData[1]=interviewExperienceChart[i]['COUNT'];
	     }else if(interviewExperienceChart[i]['INTRVW_EXPRNC'] == '3'){
	    	 chartData[2]=interviewExperienceChart[i]['COUNT'];
	     }

  	 }

	// pieChart
	var ctx3 = document.getElementById("pieChartExperience").getContext('2d');
	var pieChart = new Chart(ctx3, {
		type: 'pie',
		data: {
				datasets: [{
					data: chartData,
					backgroundColor: [
						'#b8c6ec',
						'#87a3ec',
						'#4c78ea',
					],
					datalabels: {
						color:  'white',
					},
				}],
				labels: [
					"부정적",
					"보통",
					"긍정적",
				]
			},
			options: {
				responsive: true,
				layout:{
					padding:{
						top:20,
						bottom:20,
					}
				},
				legend: {
			        display: true,
			        position: 'right'
			    },
			    plugins: {
					datalabels: {
						display: function(context) {
							return context.dataset.data[context.dataIndex] > 0;
						},
						font: {
							weight: 'bold'
						},
					}
				},

			}

	});

}
/* #section3 면접결과 면접경험 */
function interviewResultChart(){
	 var interviewResultChart = JSON.parse('${interviewResultChart}');

	 var chartData = new Array(0,0,0);

  	  for(var i in interviewResultChart){

	     if(interviewResultChart[i]['INTRVW_RESULT'] == '1'){
	    	 chartData[0]=interviewResultChart[i]['COUNT'];
	     }else if(interviewResultChart[i]['INTRVW_RESULT'] == '2'){
	    	 chartData[1]=interviewResultChart[i]['COUNT'];
	     }else if(interviewResultChart[i]['INTRVW_RESULT'] == '3'){
	    	 chartData[2]=interviewResultChart[i]['COUNT'];
	     }

  	 }

	// pieChart
	var ctx3 = document.getElementById("pieChartResult").getContext('2d');
	var pieChart = new Chart(ctx3, {
		type: 'pie',
		data: {
				datasets: [{
					data: chartData,
					backgroundColor: [
						'#1DDB16',
						'#FF0000',
						'#FFBB00',
					],
					datalabels: {
						color:  'white',
					},
				}],
				labels: [
					"합격",
					"불합격",
					"대기중",
				]
			},
			options: {
				responsive: true,
				layout:{
					padding:{
						top:20,
						bottom:20,
					}
				},
				legend: {
			        display: true,
			        position: 'right'
			    },
			    plugins: {
					datalabels: {
						display: function(context) {
							return context.dataset.data[context.dataIndex] > 0;
						},
						font: {
							weight: 'bold'
						},
					}
				},

			}

	});

}
/* section3 면접 난이도  클래스 추가 */
function interviewDifficultyShape(){
	var interviewJson = JSON.parse(jsonEscape('${interviewList}'));//jsonEscape:줄바꿈처리 함수
	 for(var i in interviewJson){
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
}


/* VIEW 페이지 채용정보  */
function saramin(){
	var saraminList = JSON.parse('${saraminList}');
	if(saraminList == ""){
		var img = $(" <div class='well well-lg'>채용정보가 없습니다</div>")
		img.appendTo(saraminRow1);
	}else{
		for(var i in saraminList){
			var url 					= saraminList[i].url
			var name 					= saraminList[i].name
			var expirationTimestamp 	= saraminList[i].expirationTimestamp
			var title 					= saraminList[i].title
			var experienceLevel			= saraminList[i].experienceLevel
			var requiredEducationLevel	= saraminList[i].requiredEducationLevel
			var location				= saraminList[i].location
			var industry				= saraminList[i].industry
			var href					= saraminList[i].href

			var trimLocation = location.substring(0,2);
			var trimRequiredEducationLevel;
			if(requiredEducationLevel != "학력무관"){
				trimRequiredEducationLevel = requiredEducationLevel.substring(0,1)+"졸↑";
			}else{
				trimRequiredEducationLevel = requiredEducationLevel;
			}
			if(i<3){
		 		var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panels-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"' target='_blank'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
				data.appendTo(saraminRow1);
			}else if(i<6){
				var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panels-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"' target='_blank'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
				data.appendTo(saraminRow2);
			}else{
				var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panels-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"' target='_blank'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
				data.appendTo(saraminRow3);
			}
		}
	}
}

</script>


<div class="container">
	<div class="row">
		<nav class="col-sm-1 padding-zero" id="left-nav">

			<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="70">
				<!-- 				<li style="height: 30px"></li> -->
				<li>
					<a onclick="fnMove('#section1')">
						<span class="fa fa-building logo-small"></span> 기업정보
					</a>
				</li>
				<li>
					<a onclick="fnMove('#section2')">
						<span class="fa fa-weixin logo-small"></span> 리뷰코멘트
					</a>
				</li>
				<li>
					<a onclick="fnMove('#section3')">
						<span class="fa fa-file-text logo-small"></span> 면접후기
					</a>
				</li>
				<li>
					<a onclick="fnMove('#section4')">
						<span class="fa fa-line-chart logo-small"></span> 월별그래프
					</a>
				</li>
				<li>
					<a onclick="fnMove('#section5')">
						<span class="fa fa-group logo-small"></span> 채용정보
					</a>
				</li>
				<li>
					<a onclick="fnMove('#section6')">
						<span class="fa fa-newspaper-o logo-small"></span> 뉴스
					</a>
				</li>

			</ul>
		</nav>

		<div class="col-sm-11 mobile-p">
			<div class="module" id="entNameModule">
				<div class="row" id="section1">
					<div class="col-sm-6">
						<span id="entName">${entInfo.ENT_NM}</span>
						<a href="#" class="follow follow-btn follow" >
							<i class="fa fa-heart-o follow" id="follow"></i>
						</a>
					</div>
					<div class="col-sm-6">
								<p class="m-t-10">평균연봉</p>
								<h1>
									<b><span id="payAmtAvg">${entInfo.PAY_AMT_AVG}</span></b>만원
								</h1>
								<p class="m-t-10 s-red-font">*국민연금 납부기준</p>
					</div>
				</div>

			</div>
			<!-- section 1 기업정보-->
			<div class="module">
					<h3  class="sectionTitle">기업정보</h3>

					<div class="panel panel-default">
						<div class="panel-body" >

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
									<button type="button" class="btn btn-default btn-lg btn-block" onclick="changeAvgInfo('인원')">
										<span class="f-left"><b>인원</b></span>
										<span class="f-right">
											<b id="person"></b>명
										</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block" onclick="changeAvgInfo('업력')">
										<span class="f-left"><b>업력</b></span>
										<span class="f-right">
											<b id="fondDate"></b>년
										</span>
									</button>
								</div>
							</div>

							<br>

							<div class="row">
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block" onclick="changeAvgInfo('입사')">
										<span class="f-left"><b>입사</b></span>
										<span  class="f-right">
											<b id="newPerson">&nbsp;</b> &nbsp;명 &nbsp; &nbsp;
											<b id="newPersonPercent"></b>&nbsp;%
										</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block" onclick="changeAvgInfo('퇴사')">
										<span style="float: left"><b>퇴사</b></span>
										<span style="float: right">
											<b id="outPerson">&nbsp;</b> &nbsp;명 &nbsp; &nbsp;
											<b id="outPersonPercent"></b>&nbsp;%
										</span>
									</button>
								</div>
							</div>
							<br> <br>

							<div class="row"  id="section01">
								<div class="col-md-12">

									<div class="box box-primary">
										<div class="box-header">
											<h3 class="box-title">
												<center><span id="select"></span></center>
											</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body no-padding ">
											<table class="table table-condensed">
												<tr class="row">
													<td class="col-sm-1">1.</td>
													<td class="col-sm-2">현재 기업</td>
													<td class="col-sm-7">
														<div class="progress">
															<div class="progress-bar progress-bar-danger" id="entPer"></div>
														</div>
													</td>
													<td class="col-sm-1"><span class="badge bg-red" id="numOfEnt"></span></td>
												</tr>
												<tr class="row">
													<td>2.</td>
													<td>동종 산업군</td>
													<td>
														<div class="progress">
															<div class="progress-bar progress-bar-warning "id="indPer"></div>
														</div>
													</td>
													<td><span class="badge bg-yellow" id="numOfInd"></span></td>
												</tr>
												<tr class="row">
													<td>3.</td>
													<td>전체 기업</td>
													<td>
														<div class="progress">
															<div class="progress-bar progress-bar-primary" id="toEntPer"></div>
														</div>
													</td>
													<td><span class="badge bg-light-blue" id="numOfTotEnt"></span></td>
												</tr>

											</table>
										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->
								</div>
							</div>
						</div>
					</div>
			</div><!-- section 1 기업정보 END-->

			<!-- section2 리뷰코멘트-->
			<div class="module">
				<div id="section2">
					<h3 class="sectionTitle">리뷰코멘트</h3>
					<div class="panel-group " id="accordion">
			        	<div class="box box-warning">
				            <div class="box-body row">
					              <div class="chart col-md-6" style="text-align: center" >
					               		<h1 >${reviewTotalData}</h1>
					               		<c:forEach begin="1" end="${reviewTotalData}" step="1">
											<span class="stars-on"></span>
										</c:forEach>
										<c:forEach begin="${reviewTotalData}" end="4" step="1">
											<span class="stars-off"></span>
										</c:forEach>
		              					<p>총 만족도</p>
					              </div>
					              <div class="chart col-md-6" style="height: 100px; ">
					                <canvas id="reviewbarChart"></canvas>
					              </div>
				            </div>
			            <!-- /.box-body -->
			        	</div>

						<c:forEach begin="0" end="5" varStatus="status"
							items="${questionList}" var="question">
							<div class="panel panel-default">
								<div class="panel-heading" onclick="getReviewList(${status.count})">
									<h4 class="panel-title row">
										<a data-toggle="collapse" data-parent="#accordion" 	href="#collapse${status.count}">
											<div class="col-sm-8 ">
													${question.QUESTION}
												<span style="color: #6799FF">(${question.COUNT}) </span>
											</div>
											<div class="col-sm-4 mobile-m-t-10">
												<c:forEach begin="1" end="${question.AVG}" step="1">
													<span class="stars-on"></span>
												</c:forEach>
												<c:forEach begin="${question.AVG}" end="4" step="1">
													<span class="stars-off"></span>
												</c:forEach>
												${question.AVG}
											</div>
										</a>
									</h4>
								</div>
								<div id="collapse${status.count}"	class="panel-collapse collapse">
									<div class="panel-body" style="color: black">
										<table class="table">
											<thead>
												<tr>
													<th>총${question.COUNT}개의 기업리뷰 코멘트</th>
												</tr>
											</thead>
											<tbody id="reviews">
											</tbody>
										</table>
										<!-- 페이징처리-리뷰 코멘트 -->
										<nav style="text-align: center">
											<ul class="pagination revw-pagination">
											</ul>
										</nav>

										<form class="reviewForm" name="reviewForm" >
											<input type="hidden" name="questionNum" class="questionNum"	value="${question.QESTN_NO}">
											<input type="hidden" name="entIndex" class="entIndex" value="${entInfo.ENT_IDX}">

											<div class="stars01">
												<select class="stars" name="stars" display="inline">
													<option value="" >별점</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>

												<output for="star-input" class="stars02">
													<b class="starScore">1</b>
												</output>
											</div>

											<div class="input-group input-group-sm">
												<input type="text" 	class="form-control contents${status.count}" name="contents" id="contents${status.count}" placeholder="기업리뷰를 추가로 입력해주세요.">
												<span class="input-group-btn">
													<input type="submit" class="btn btn-flat btn-info review-btn" value="제출">
													<input type="hidden" class="statusCount" value="${status.count}">
												</span>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div><!-- section2 리뷰코멘트 END-->

			<!-- section3 면접후기 -->
			<div class="module">
				<div id="section3">
					<h3 class="sectionTitle">면접후기</h3>
					<div class="panel-group" >
						<div class="box box-danger">

							<div class="box-body row">
								<div class="chart col-md-4 margin-auto" >
									<h3 class="box-title">면접 난이도</h3>
									<div class="text-center ">
<%-- 									<canvas id="pieChart" ></canvas> --%>
										<h1>${interviewDiffChart}</h1>
										<span class="f-left text-primary">쉬움</span>
										<span class="f-right text-danger">어려움</span>
										<input type="range" min="1" max="100" value="70" class="sliders" disabled >
										<span class="f-left text-primary">0</span>
										<span class="f-right text-danger">5</span>
									</div>
								</div>
								<div class="chart col-md-4" >
									<h3 class="box-title">면접 경험</h3>
									<canvas id="pieChartExperience" ></canvas>
								</div>
								<div class="chart col-md-4" >
									<h3 class="box-title">면접 결과</h3>
									<canvas id="pieChartResult" ></canvas>
								</div>
							</div>
						</div>
						<div class="interviewList">
						<!-- 면접후기 -->
						</div>
					</div>
					<!-- 면접 페이징 처리  -->
					<button type="button" class="btn btn-info" id="intr-write-btn" onclick="intrWriteBtn()">면접후기작성</button>
					<nav style="text-align: center">
						<ul class="pagination intvw-pagination">
						</ul>
					</nav>
				</div>
			</div><!-- section3 면접후기  END-->

			<!-- section4 그래프-->
			<div class="module">
				<div id="section4">
					<h3 class="sectionTitle">월별그래프</h3>
					<!-- 버튼 -->
					<div class="row graph-row">
						<div class="btn-group graph-btn" >
							<button class="btn btn-default " id="personnel-btn" disabled="" onclick="personnelBtn()">인원</button>
							<button class="btn btn-default " id="salary-btn" onclick="salaryBtn()">평균 급여</button>
						</div>
					</div>
					<!-- 그래프 -->
					<div class="panel panel-default ">
						<div class="panel-body">
							<div class="card-body chartreport">
								<canvas id="comboBarLineChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div><!-- section4 그래프 END-->

			<!-- SECTION 5- 채용정보 -->
			<div class="module">

				<div id="section5">
					<h3  class="sectionTitle">채용정보</h3>
						<div id="saramin-margin">
							<div class="row" id="saraminRow1">
							</div>
							<div class="row" id="saraminRow2">
							</div>
							<div class="row" id="saraminRow3">
							</div>
						</div>
				</div>
			</div><!-- SECTION 5- 채용정보 end -->

			<!-- SECTION 6- 뉴스 -->
			<div class="module">
				<div id="section6">
					<h3  class="sectionTitle" >뉴스</h3>
					<c:choose>
						<c:when test="${newsList.size() > 0 }">
							<div class="panel panel-default slideanim">
								<div class="panel-body" >
								 	<c:forEach items="${newsList}" var="newsList">
										<div class="row news-margin" >
											<a class="col-xs-10 f-left text-left blue-font"  href="${newsList.link}" target="_blank">${newsList.title}</a>
											<span class="col-xs-2 f-right text-right pad-0">${newsList.pubDate}</span>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class='well well-lg'>뉴스정보가 없습니다</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div><!-- SECTION 6- 뉴스  end-->

		</div>
	</div>
</div>



<button type="button" class="btn btn-default move-top">
	<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>TOP
</button>

<!-- 면접후기 모달 -->
<div class="modal fade" id="loginModal" role="dialog">
	<div class=" modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<form action="writeInterview" id="writeInterview" method="post">
				<input type="hidden" name="entIndex" value="${entInfo.ENT_IDX}">
				<div class="modal-headers ">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">면접후기 작성</h4>
				</div>
				<div class="modal-body ">
					<div class="row form-group">
						<div class="col-xs-3">
							<label>기업명</label>
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control "
								value="${entInfo.ENT_NM}" readonly="readonly">
						</div>
					</div>
					<!-- 면접난이도 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접난이도</label>
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwDifficulty">
								<option value="">면접난이도</option>
								<option value="1">매우 쉬움</option>
								<option value="2">쉬움</option>
								<option value="3">보통</option>
								<option value="4">어려움</option>
								<option value="5">매우 어려움</option>
							</select>
						</div>
					</div>
					<!--면접일자 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접일자</label>
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control" name="intrvwDate" id="datepicker" placeholder="ex) 201806">
						</div>
					</div>
					<!-- 면접경로 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접경로</label>
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwRoute">
								<option value="">면접경로</option>
								<option value="1">공채</option>
								<option value="2">온라인지원</option>
								<option value="3">직원추천</option>
								<option value="4">헤드헌터</option>
								<option value="5">학교 취업지원센터</option>
								<option value="6">기타</option>
							</select>
						</div>
					</div>
					<!--면접후기// 면접에서 채용까지의 과정 요약 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label class="">면접에서 채용까지의 과정 요약</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwReview"
								placeholder="최대한 자세하게 작성해주세요. 최초 연락부터 인터뷰 횟수, 분위기, 면접관의 특징, 면접 팁 등"></textarea>
						</div>
					</div>
					<!-- 면접질문 입력하기 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접질문 입력하기</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwQuestion"
								placeholder="조별 주제, 개별 과제, 대면 질문 등 가장 어려웠던 질문을 정확하고 구체적으로 작성해 주세요."></textarea>
						</div>
					</div>
					<!-- 면접에 대한 답변 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>작성한 면접질문에 대한 답변을 입력하세요.</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwAnswer"
								placeholder="작성한 면접질문에 대한 답변을 입력하세요."></textarea>
						</div>
					</div>
					<!-- 면접결과 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>이 기업에 합격하셨나요?</label>
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwResult">
								<option value="">기업에 합격하셨나요?</option>
								<option value="1">합격</option>
								<option value="2">불합격</option>
								<option value="3">대기중</option>
								<option value="4">합격했으나 취업하지 않음</option>
							</select>
						</div>
					</div>
					<!-- 면접일자/발표시기  -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>발표시기</label>
						</div>
						<div class="col-xs-9">
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
					<!-- 면접경험 radio.-->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접 경험 </label>
						</div>
						<div class="col-xs-9">
							<div class="radio">
								<label> <input type="radio" name="intrvwExperience"
									id="optionsRadios1" value="1">부정적
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
					</div>



				</div>
				<div class="modal-footer">
					<button class="btn btn-catchjob" id="itvw-write-btn">제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>

<%@ include file="include/footer.jsp"%>
