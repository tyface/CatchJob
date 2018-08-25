<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true" />

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/late/fontawesome-stars.css">
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/late/bars-movie.css" >

<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>

<!-- jQuery Validation 플러그인을 이용하여 손쉽게 검증하기 -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/enterprise.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/dist/additional-methods.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/dist/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/dist/messages_ko.min.js"></script>


<script>
var following = ${entInfo.FOLLOWING}
var entIndex = ${entInfo.ENT_IDX};


//$(document).ready(function(){
var status = "logout";

var month = new Array(); //월
var salary = new Array(); //연금정보
var totalPerson = new Array(); //총 인원
var newPerson = new Array();
var outPerson = new Array();

$(function(){
	
	if('${member}'==''){
	}else{
		status = "login";
	}

	$('.stars').barrating({
	    theme: 'fontawesome-stars',
	   	onSelect: function(value, text, event){
	    	$(".starScore").text(value);
	    }
	});


	var viewDataJson = JSON.parse('${viewDataJson}');
	for(var i in viewDataJson){
		var num = Math.round((viewDataJson[i]['PAY_AMT'])/0.09/viewDataJson[i]['NPN_SBSCRBER_CNT']);
		month.push(viewDataJson[i]['PAY_YM']) ;
		salary.push(num) ;
		totalPerson.push(viewDataJson[i]['NPN_SBSCRBER_CNT']) ;
		newPerson.push(viewDataJson[i]['NPN_NW_SBSCRBER_CNT']) ;
		outPerson.push(viewDataJson[i]['NPN_SCBT_CNT']) ;
	}
 	//chartSalary();
 	chartPersonnel();
	$("#salary-btn").on("click", function(){
		$("canvas#comboBarLineChart").remove();
// 		var ctx2 = document.getElementById("comboBarLineChart").getContext('2d');
// 		ctx2.clear();
		$("div.chartreport").append('<canvas id="lineChart"></canvas>');
		chartSalary();

		$("#personnel-btn").attr('disabled', false);
		$("#salary-btn").attr('disabled', true);
		//chartSalary();
	});
	$("#personnel-btn").on("click", function(){
		$("canvas#lineChart").remove();
// 		var ctx1 = document.getElementById("lineChart").getContext('2d');
// 		ctx1.clear();
		$("div.chartreport").append('<canvas id="comboBarLineChart"></canvas>');
		chartPersonnel();
		//chartPersonnel();
		$("#personnel-btn").attr('disabled', true);
		$("#salary-btn").attr('disabled', false);
	});

	//getReviewList();
	entInf();
	interviewPieChart(); //인터뷰 면접난이도 파이 그래프
	interviewDifficultyShape(); //인터뷰 면접난이도 색칠 부분
	interviewValidation(); //인터뷰 유효성 검사 부분
	reviewValidation()//리뷰 유효성 검사 부분
	saramin(); //#section5 사람인채용정보 

	/* 팔로잉 된 기업이면 꽉찬하트 로 바꾸기 . 기본은 빈 하트*/
	if(following == 1){
		$("#follow").toggleClass("fa-heart-o");
		$("#follow").toggleClass("fa-heart");
	}
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
	        	 // buttons: true,
	        	  //infoMode: true,
	        	},
	        	function(){
	        		/* 로그인 모달 띄우기 */
					$("#loginModal").modal("show");
	        	})

// 	        	.then((willDelete) => {
// 	        	  if (willDelete) {
// 	        		  /* 로그인 모달 띄우기 */
// 					   $("#loginModal").modal("show");
// 	        	  }
// 	        });

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

			  				  //button: false
			  				});
				    	      $this.toggleClass("fa-heart-o");
				    	      $this.toggleClass("fa-heart");
			  			  }else{
			  				  swal({
				  				  title: "팔로잉 할 수 없습니다.",
				  				  text: "팔로잉 기업은 최대 10개 까지 가능합니다",
				  				  type: "warning",
				  				  confirmButtonClass: "btn-warning",
				  				  //button: false
				  				  //dangerMode:true
				  			  });
			  			  }
			  		  }
			    })
		    }else{
		    	swal({
		    		  title: "팔로잉을 중단하시겠습니까?",
		    		  //text: "Once deleted, you will not be able to recover this file!",
		    		  type: "info",
		    		  confirmButtonClass: "btn-info",
		    		  showCancelButton: true,
		    		  closeOnConfirm: false,
		    		  //buttons: true,
		    		  //dangerMode: true,
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
					  				    //text: "팔로잉 기업은 최대 10개 까지 가능합니다",
					  				    type: "success",
					  				    confirmButtonClass: "btn-success",
					  				    //button: false
					  				    //dangerMode:true
					  			    });
								   $this.toggleClass("fa-heart");
								   $this.toggleClass("fa-heart-o");
					  		  }
					    })
		    		})

// 		    		.then((willDelete) => {


// 		    			if (willDelete) {
// 		    				 $.ajax({
// 						  		  url:"${pageContext.request.contextPath}/enterprise/revFollow",
// 						  		  data:{entIndex : entIndex},
// 						  		  type: "post",
// 						  		  dataType:"json",
// 						  		  success: function(result){
// 						  			/* 성공 */
// 						  				swal({
// 						  				    title: "팔로잉이 해제되었습니다.",
// 						  				    //text: "팔로잉 기업은 최대 10개 까지 가능합니다",
// 						  				    icon: "success",
//
// 						  				    button: false
// 						  				    //dangerMode:true
// 						  			    });
// 									   $this.toggleClass("fa-heart");
// 									   $this.toggleClass("fa-heart-o");
// 						  		  }
// 						    })
// 		    		    }


// 		    	});


// 		    	if(confirm("팔로잉을 중단하시겠습니까?") != 0 ){
// 				  /* 팔로잉 기업 해지  */
// 				    $.ajax({
// 				  		  url:"${pageContext.request.contextPath}/enterprise/revFollow",
// 				  		  data:{entIndex : entIndex},
// 				  		  type: "post",
// 				  		  dataType:"json",
// 				  		  success: function(result){
// 				  			/* 성공 */
// 							   $this.toggleClass("fa-heart");
// 							   $this.toggleClass("fa-heart-o");
// 				  		  }
// 				    })
// 			    }



		    }
	    }

   });/* 기업 팔로잉 END */

 /* 기업리뷰 작성 START */
      $("#myBtn").click(function(){
    	  if(status == "logout"){

    		  swal({
	        	  title: "로그인 하시겠습니까?",
	        	  text: "기업 팔로우는 로그인 후에 이용 가능합니다.",
	        	  type: "info",
	        	  showCancelButton: true,
	        	  confirmButtonClass: "btn-info",
	        	 // buttons: true,
	        	  //infoMode: true,
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
      });/* 기업리뷰 작성 END */


/* 기업리뷰  등록 START */
 	$(".review-btn").on("click",function(){

		var point = $(this).parent().parent().prev().children().children("div").text();
		var statusCount = $(this).next().val();

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

		  }else{/* 로그인 상태임 */
			var contents = $("#contents"+statusCount).val();/* 기업리뷰  */
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
						$(".starScore").val("0");
						swal({
							title:"등록되었습니다!",
							type:"success",
							confirmButtonClass: "btn-success",
						})
					}else{
						swal({
							title: "등록 실패하였습니다.",
							text:" 이미 등록하셨습니다.",
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
	 var newPersonPercent =parseFloat(( personJson['newPerson']/$("#person").text() )*100).toFixed(2);
	 var outPersonPercent =parseFloat(( personJson['outPerson']/$("#person").text() )*100).toFixed(2);
	 $("#newPersonPercent").text(newPersonPercent);
	 $("#outPersonPercent").text(outPersonPercent);
	$("#numOfEnt").text($("#person").text());
	 $("#btnA").click(function() {

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
			$("#select").text("업력");
			$("#numOfEnt").text(currier);
			$("#numOfInd").text("30");
			$("#numOfTotEnt").text("60");

			$("#entPer").css('width', "100%");
			$("#indPer").css('width', '30%');
			$("#toEntPer").css('width', '60%');
		});

		$("#btnC").click(function() {
			$("#select").text("입사");
			$("#numOfEnt").text(personJson['newPerson']);
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("40");

			$("#entPer").css('width', '30%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '40%');
		});

		$("#btnD").click(function() {
			$("#select").text("퇴사");
			$("#numOfEnt").text(personJson['outPerson']);
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("30");

			$("#entPer").css('width', '40%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '30%');
		});




}


/* 월별그래프-평균급여 */
function chartSalary(){

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
					data: salary
				}],

				borderWidth: 1
		},
		 options: {

// 				events: ['click']
// 				,
		        elements: {
		            line: {
		                tension: 0, // disables bezier curves
		            }
		        },
		        scales: {
                    yAxes: [{
                            ticks: {
                             //  max:3900000,
                               min:0
                            }
                        }]
                }
		    }

	});

}
/* 월별그래프-인원*/
function chartPersonnel(){
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
}

function interviewPieChart(){
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

function interviewDifficultyShape(){
//	 var interviewJson = JSON.parse('${interviewJson}');
    var interviewJson = JSON.parse(jsonEscape('${interviewJson}'));

	 for(var i in interviewJson){
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
}
function reviewValidation(){
	$('.reviewForm').validate({
		rules : {

			stars:{
				required : true
			},
			contents:{
				required : true,
				minlength : 10,
				maxlength : 500
			}
		},

		messages : {
			stars:{
				required : "다른 항목을 선택해주세요"
			},
			contents:{
// 				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다",
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			}
		},
	    submitHandler: function(form) {
		    swal("등록되었습니다", "You clicked the button!", "success")
		    .then(()=>{
		    	form.submit();
		    })
	    }

	});
}
function interviewValidation(){
	 /* 면접후기 작성시 유효성 검사 */
	$('#writeInterview').validate({
		rules : {

			intrvwDifficulty:{
				required : true
			},
			intrvwDate:{
				required : true,
				date: true
			},
			intrvwRoute:{
				required : true
			},
			intrvwReview:{
				required : true,
				minlength : 10,
				maxlength : 500
			},
			intrvwQuestion:{
				required : true,
				minlength : 10,
				maxlength : 500
			},
			intrvwAnswer:{
				required : true,
				minlength : 10,
				maxlength : 500
			},
			presentationDate:{
				digits: true
			}
		},

		messages : {

			intrvwDifficulty:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwDate:{
// 				required : "필수로입력하세요"
			},
			intrvwRoute:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwReview:{
// 				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다",
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			},
			intrvwQuestion:{
// 				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다"	,
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			},
			intrvwAnswer:{
// 				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다"	,
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			}
		}
// 		,
// 	    submitHandler: function(form) {
// 		    swal("등록되었습니다", "You clicked the button!", "success")
// 		    .then(()=>{
// 		    	form.submit();
// 		    })
// 	    }
		,
		submitHandler: function(form) {
			swal({
				title:"등록",
				text: "You clicked the button!",
				type: "success",
				confirmButtonClass: "btn-success",

			},
			function(){
				form.submit();
			})

		}

	});
}
/* VIEW 페이지 채용정보  */
function saramin(){
	var saraminList = JSON.parse('${saraminList}');
	if(saraminList == ""){
		alert(333)
		var img = $(" <div class='well well-lg'>채용정보가 없습니다</div>")
		img.appendTo(saraminRow1);
	}
	for(var i in saraminList){
		alert(3)
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
	 		var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panel-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
			data.appendTo(saraminRow1);
		}else if(i<6){
			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panel-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
			data.appendTo(saraminRow2);
		}else if(i<9){
			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panel-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
			data.appendTo(saraminRow3);
		}else{
			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'> <div class='panel-headings'><span class='expirationTimestamp'>"+expirationTimestamp+"</span></div><div class='panel-body'><h4 class='name'>"+name+"</h4><h5><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h5></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");			data.appendTo(saraminRow4);
		}
	}
}

/* 숫자에 컴마 찍는 함수 */
function addComma(num) {
   var regexp = /\B(?=(\d{3})+(?!\d))/g;
   return num.toString().replace(regexp, ',');
}
/* JSON 에서 줄 바꿈 처리  */
function jsonEscape(str)  {
    return str.replace(/\n/g, "\\\\n").replace(/\r/g, "\\\\r").replace(/\t/g, "\\\\t");
}
</script>

<div class="container module-main">
	<h1 style="padding-top: 50px; color: #2196F3;">${entInfo.ENT_NM}</h1>


	<a href="#" class="follow follow-btn follow"> <i
		class="fa fa-heart-o follow" id="follow"></i>
	<!-- 123 -->
	</a>

</div>
<br>


<div class="container">
	<div class="row">
		<nav class="col-sm-1 padding-zero" id="myScrollspy">

			<ul class="nav nav-pills nav-stacked" data-spy="affix"
				data-offset-top="205">
				<!-- 				<li style="height: 30px"></li> -->
				<li>
					<a href="#section1">
						<span class="fa fa-building logo-small"></span> 기업정보
					</a>
				</li>
				<li>
					<a href="#section2">
						<span class="fa fa-weixin logo-small"></span> 리뷰코멘트
					</a>
				</li>
				<li>
					<a href="#section3"> 
						<span class="fa fa-file-text logo-small"></span> 면접후기
					</a>
				</li>
				<li>
					<a href="#section4"> 
						<span class="fa fa-line-chart logo-small"></span> 월별그래프
					</a>
				</li>
				<li>
					<a href="#section5"> 
						<span class="fa fa-group logo-small"></span> 채용정보
					</a>
				</li>
				<li>
					<a href="#section6"> 
						<span class="fa fa-newspaper-o logo-small"></span> 뉴스
					</a>
				</li>

			</ul>
		</nav>

		<div class="col-sm-11">
			<!-- 기업정보//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">

				<div id="section1">
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
									<button type="button" class="btn btn-default btn-lg btn-block" id="btnA">
										<span class="f-left"><b>인원</b></span> 
										<span class="f-right">
											<b id="person">${entInfo.NPN_SBSCRBER_CNT }</b>명
										</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block"
										id="btnB">
										<span class="f-left"><b>업력</b></span> 
										<span class="f-right">
											<b id="establishmentYear">${entInfo.ENT_FOND_YMD}</b>년
										</span>
									</button>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block" id="btnC">
										<span class="f-left"><b>입사</b></span> 
										<span  class="f-right">
											<b id="newPerson">${person.newPerson}&nbsp;</b> &nbsp;명 &nbsp; &nbsp;
											<b id="newPersonPercent"></b>&nbsp;%
										</span>
									</button>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-default btn-lg btn-block" id="btnD">
										<span style="float: left"><b>퇴사</b></span> 
										<span style="float: right">
											<b id="outPerson">${person.outPerson}&nbsp;</b> &nbsp;명 &nbsp; &nbsp;
											<b id="outPersonPercent"></b>&nbsp;%
										</span>
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
					<h3 class="sectionTitle">리뷰코멘트</h3>
					<div class="panel-group " id="accordion">

						<c:forEach begin="0" end="5" varStatus="status"
							items="${question}" var="question">
							<div class="panel panel-default">
								<div class="panel-heading"
									onclick="getReviewList(${status.count})">
									<h4 class="panel-title row">
										<a data-toggle="collapse" data-parent="#accordion" 	href="#collapse${status.count}">
											<span class="col-sm-8">
													${question.QUESTION}
												<span style="color: #6799FF">(${question.COUNT}) </span>
											</span>
											<span class="col-sm-4">${question.AVG}
												<c:forEach begin="1" end="${question.AVG}" step="1">
													<span class="stars-on"></span>
												</c:forEach>
												<c:forEach begin="${question.AVG}" end="4" step="1">
													<span class="stars-off"></span>
												</c:forEach>
											</span>
										</a>
									</h4>
								</div>

								<div id="collapse${status.count}"	class="panel-collapse collapse">
									<!-- in -->
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
											<ul class="pagination">
											</ul>
										</nav>

										<form class="reviewForm" name="reviewForm" >
											<input type="hidden" name="questionNum" class="questionNum"
												value="${question.QESTN_NO}"> <input type="hidden"
												name="entIndex" class="entIndex" value="${entInfo.ENT_IDX}">

											<div>
												<select class="stars" name="stars">
													<option value="" >별점</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>

												<output for="star-input">
													<b class="starScore">0</b>
												</output>
											</div>

											<div class="input-group input-group-sm">
												<input type="text" 	class="form-control contents${status.count}" name="contents" id="contents${status.count}" placeholder="기업리뷰를 추가로 입력해주세요.">
												<span class="input-group-btn">
													<input type="button" class="btn btn-flat btn-info review-btn" value="제출">
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
			</div>

			<!-- 면접후기//////////////////////////////////////////////////////////////////////////////// -->
			<div class="module">
				<div id="section3">
					<h3 class="sectionTitle">면접후기</h3>
					<button type="button" class="btn btn-info " id="myBtn">면접후기작성</button>
					<p>Try to scroll this section and look at the navigation list while scrolling!가나다라</p>
					<div class="panel-group "  style="color: black">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="box box-danger">
									<div class="box-header with-border">
										<h3 class="box-title">면접 난이도</h3>
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
										<div class="col-sm-2"></div>
									</div>

								</div>


							</div>
						</div>
						<!-- 면접후기1 -->
						<c:forEach varStatus="status" var="interview" items="${interview}">
							<div class="panel panel-default">
								<div class="panel-heading font-gray">${interview.regDate}</div>
								<div class="panel-body ">
									<div class="col-xs-3">
										<div class="row">
											<p>
												<b>면접난이도</b>
											</p>
										</div>
										<div id="difficulty${status.index}" class="row">
											<p class="intrvwDifficulty">${interview.intrvwDifficulty}</p>
												<div class="col-xs-1 progress-bars bar1" ></div>
												<div class="col-xs-1 progress-bars bar2" ></div>
												<div class="col-xs-1 progress-bars bar3" ></div>
												<div class="col-xs-1 progress-bars bar4" ></div>
												<div class="col-xs-1 progress-bars bar5" ></div>

										</div>

										<br>

										<div class="row">
											<p>
												<b>면접일자</b>
											</p>
											<p>${interview.intrvwDate}</p>
											<br>
										</div>
										<div class="row">
											<p>
												<b>면접경로</b>
											</p>
											<p>${interview.intrvwRoute}</p>
											<br>
										</div>

									</div>
									<div class="col-xs-9">
										<table class="table">
											<thead>
												<tr>
													<th colspan="6">"${interview.intrvwReview}"</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="6">
														<p>
															<b>면접질문</b>
														</p>
														<p class="font-gray">${interview.intrvwQuestion}</p>
													</td>
												</tr>
												<tr>
													<td colspan="6">
														<p>
															<b>질문에 대한 답변</b>
														</p>
														<p class="font-gray">${interview.intrvwAnswer}</p>
													</td>
												</tr>
												<tr>
													<c:if test="${interview.presentationDate != '' && interview.presentationDate != null  }">
														<th colspan="2">
															<p class="well well-sm">
																<span>발표시기</span> <span class="f-right"> <!-- 															 <span class="glyphicon glyphicon-thumbs-up"></span> -->
																	${interview.presentationDate}일후
																</span>
															</p>
														</th>
													</c:if>
													<c:if test="${interview.intrvwResult != '' && interview.intrvwResult != null  }">
														<th colspan="2" >
															<p class="well well-sm">
																<span>면접결과</span> <span class="f-right"> <!-- 															 <span class="glyphicon glyphicon-thumbs-up"></span> -->
																	${interview.intrvwResult}
																</span>
															</p>
														</th>
													</c:if>
													<c:if test="${interview.intrvwExperience != '' && interview.intrvwExperience != null  }">
														<th colspan="2" >
															<p class="well well-sm">
																<span>면접경험</span> <span class="f-right"> <!-- 															<span class="glyphicon glyphicon-thumbs-up"></span> -->
																	${interview.intrvwExperience}
																</span>
															</p>
														</th>
													</c:if>
												</tr>

											</tbody>
										</table>
									</div>

								</div>
							</div>
						</c:forEach>

					</div>
					<!-- 면접 페이징 처리  -->
					<nav style="text-align: center">
						<ul class="pagination">

							<c:if test="${interviewPageData.startPage !=1 }">
								<li><a
									href="${pageContext.request.contextPath}/enterprise/view?entIndex=${entInfo.ENT_IDX}&page=1#section3"
									class="underline">&laquo;</a></li>
								<li><a
									href="${pageContext.request.contextPath}/enterprise/view?entIndex=${entInfo.ENT_IDX}&page=${interviewPageData.startPage-1}#section3"
									class="underline">&lt;</a>
								<li>
							</c:if>

							<c:forEach var="pageNum" begin="${interviewPageData.startPage}"
								end="${interviewPageData.endPage < interviewPageData.pageTotalCount ? interviewPageData.endPage : interviewPageData.pageTotalCount}">
								<c:choose>
									<c:when test="${pageNum == interviewPageData.currentPage}">
										<%-- 										<b>[${pageNum}]</b> --%>
										<li><a>${pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/enterprise/view?entIndex=${entInfo.ENT_IDX}&page=${pageNum}#section3"
											class="underline">${pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if
								test="${interviewPageData.endPage < interviewPageData.pageTotalCount}">
								<li><a
									href="${pageContext.request.contextPath}/enterprise/view?entIndex=${entInfo.ENT_IDX}&page=${interviewPageData.endPage+1}#section3"
									class="underline">&gt;</a></li>
								<li><a
									href="${pageContext.request.contextPath}/enterprise/view?entIndex=${entInfo.ENT_IDX}&page=${interviewPageData.pageTotalCount}#section3"
									class="underline">&raquo;</a></li>
							</c:if>
						</ul>
					</nav>
				</div>

			</div>
			<!-- 그래프 바뀔것0820 -->
			<div class="module">
				<div id="section4">
					<h3 class="sectionTitle">월별그래프</h3>
					<p>Try to scroll this section and look at the navigation list while scrolling!</p>
					<div class="btn-group graph-btn" >
							<button class="btn btn-default " id="personnel-btn" disabled="">인원</button>
							<button class="btn btn-default " id="salary-btn">평균 급여</button>
					</div>
					<!-- 그래프 -->
					<div class="panel panel-default ">
						<div class="panel-body">
							<div class="card-header">
								<i class="fa fa-table"></i> Combo Bar Line Chart
							</div>

							<div class="card-body chartreport">
								<canvas id="comboBarLineChart"></canvas>
							</div>

							<div class="card-footer small text-muted">Updated yesterday
								at 11:59 PM</div>
						</div>

					</div>
				</div>
			</div>
			<!-- SECTION 5- 채용정보 -->
			<div class="module">

				<div id="section5">
					<h3  class="sectionTitle">채용정보</h3>

<!-- 					<div class="panel panel-default"> -->
<!-- 						<div class="panel-body" > -->
						<div id="saramin-margin">
							<div class="row" id="saraminRow1">	
							</div>
							<div class="row" id="saraminRow2">	
							</div>
							<div class="row" id="saraminRow3">	
							</div>
							<div class="row" id="saraminRow4">	
							</div>
						</div>
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<!-- SECTION 6- 뉴스 -->
			<div class="module">

				<div id="section6">
					<h3  class="sectionTitle" >뉴스</h3>

					<div class="panel panel-default slideanim">
						<div class="panel-body">
							<c:forEach items="${newsList}" var="newsList">
								<div class="row" ><!-- //news-interval -->
									<span class="col-xs-8 f-left text-left blue-font news-interval" onclick="location.href='${newsList.link}'">${newsList.title}</span> 
									<span class="col-xs-4 f-right text-right">${newsList.pubDate}</span>		
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
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
				<div class="modal-header cat-header">
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
					<div class="row form-group ">
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
					<!-- 면접경험 radio...........intrvwExperience-->
					<div class="row form-group ">
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
					<button class="btn cat-header" id="itvw-write-btn">제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>
 <script>
$(document).ready(function(){
  $('body').scrollspy({target: ".navbar", offset: 50});   
  
  $("#myScrollspy a").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    }  // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
});
</script> 

<jsp:include page="include/footer.jsp" flush="true" />
