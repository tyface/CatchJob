

var month = new Array(); //월
var salary = new Array(); //연금정보
var viewSalary = new Array();
var totalPersonPerMonth = new Array(); //총 인원
var newPersonPerMonth = new Array(); //입사자
var outPersonPerMonth = new Array();//퇴사자


/* 무한 스크롤 페이징*/
function appendEntList(entList,pageNum,pageViewCount){
  var appendObject;
  var firstNum = pageNum * pageViewCount;
  var lastNum = firstNum + 9;
  if(lastNum > entList.length){
    lastNum = entList.length;
  }
  if(firstNum >= entList.length){
    return;
  }

  for(var i = firstNum; i < lastNum;i++){
    /* 별점 만들기 */
    var stars = "";

    for(var j = 0;j < 5;j++){
      if(j < entList[i].evaluationAvg){
        stars += "<span class=stars-on/>";
      }else{
        stars += "<span class=stars-off/>";
      }
    }

    /* 팔로우버튼 만들기*/
    var follow = $("<a class='btn btnFollow' onclick='followAction("+entList[i].entIndex+",this)'></a>");

    if(entList[i].following == '1'){
      follow.append($("<i class='fa fa-heart'/>"));
    }else{
      follow.append($("<i class='fa fa-heart-o'/>"));
    }

    appendObject =
      $("<div/>",{
        class:"row ent-list",
        append: [$("<div/>",{
                  class:"col-sm-8",
                  append:  [$("<div/>",{
                            class:"row",
                            append: [$("<a/>",{
                                        class:"p25",
                                        href:contextPath+"/enterprise/view?entIndex="+entList[i].entIndex ,
                                        html:entList[i].entName
                                      }),
                                      follow
                                    ]
                          }),
                          $("<div/>",{
                            class:"row visible-lg visible-md visible-sm",
                            html:entList[i].industryName + " | " + entList[i].bcityName + " " + entList[i].signguName
                          }),
                          $("<div/>",{
                            class:"row",
                            append: $("<p/>", {
                                      class:"p-1",
                                      html:"평균연봉 " + entList[i].salaryAvg + " 만원"
                                    })
                          })
                          ]
                }),
                $("<div/>",{
                  class:"col-sm-4",
                  append:[$("<div/>",{
                            class:"row text-center",
                            append: [stars,
                                    $("<span/>",{
                                      class:"ent-score",
                                      html:entList[i].evaluationAvg
                                    })]
                          }),
                          $("<div/>",{
                            class:"row",
                            append: [$("<div/>",{
                                      class:"col-xs-6 text-center cell-1",
                                      append:[$("<strong/>",{
                                                text:entList[i].reviewCount
                                              }),"<br>",
                                              $("<a/>",{
                                                href:getContextPath()+"/enterprise/view?entIndex="+entList[i].entIndex+"#section2",
                                                html:"리뷰코멘트"
                                              })
                                              ]
                                      }),
                                      $("<div/>",{
                                        class:"col-xs-6 text-center cell-2",
                                        append:[$("<strong/>",{
                                                  text:entList[i].interviewCount
                                                }),"<br>",
                                                $("<a/>",{
                                                  href:getContextPath()+"/enterprise/view?entIndex="+entList[i].entIndex+"#section3",
                                                  html:"면접정보"
                                                })
                                                ]
                                      })
                                    ]
                          })
                          ]
                })
                ]
      });
    $("#ent-list-box").append(appendObject);
  }
}

/*리뷰 리스트*/
function getReviewList(questionNum, pageNum){/* 456 */
	//비동기적으로 화면에 그릴 리뷰 목록 가져오기
	//var reviewListJson = JSON.parse('${reviewListJson}');

	var reviews = $("#collapse"+questionNum+"  #reviews");


	$.ajax({
		url:contextPath+"/enterprise/reviewList",
		data: {"entIndex" : entIndex,
			"questionNum" : questionNum,
			"pageNum" : pageNum
		},
		type:"post",
		dataType:"json",
		success : function(data){
			reviews.empty()

			for(var i in data.reviewList){
        //별점 만들기
        var stars = "";

        for(var j = 1;j < 5;j++){
          if(j < data.reviewList[i].evaluationScore){
            stars += "<span class=stars-on/>";
          }else{
            stars += "<span class=stars-off/>";
          }
        }

        var regularMmember = data.reviewList[i].mberType == "ROLE_AUTHENTICATED"?"<span class='godo-font font-01'>정회원</span>":"";
        console.log(data);
				var regDate = data.reviewList[i].regDate;
				var evaluationScore = data.reviewList[i].evaluationScore;
				var contents = data.reviewList[i].contents;

				var td = $("<tr><td><p><small><span class='stars-on'></span>"+stars+"&nbsp;&nbsp;<span style='color:#D5D5D5'>|</span>&nbsp;&nbsp;"+regDate.substring(0,10)+"</small>"+regularMmember+"</p>"+contents+"</td></tr>").appendTo(reviews);
				td.appendTo(reviews);
			}

			totalCnt = parseInt(data.reviewPageData.pageTotalCount);// 전체레코드수
		 	startPage = parseInt(data.reviewPageData.startPage); // 시작페이지
		 	endPage = parseInt(data.reviewPageData.endPage); // 끝페이지
		 	currentPage = parseInt(data.reviewPageData.currentPage); // 현재페이지
			msgPerPage = parseInt(data.reviewPageData.msgPerPage); // 한페이지 보여중 네비개수
			prevPage = currentPage -1;
			nextPage = currentPage + 1;
			if(nextPage > totalCnt){
				nextPage = totalCnt
			}
			if(prevPage < 1){
				prevPage = 1
			}
			if(endPage > totalCnt){
				endPage = totalCnt
			}

			var appendObject = $(".revw-pagination")
			appendObject.empty()

			appendObject.append($("<li><a href='javascript:getReviewList("+questionNum+", "+1+");'class='underline'>&laquo;</a></li>"));
			appendObject.append($("<li><a href='javascript:getReviewList("+questionNum+", "+ prevPage +");'class='underline'>&lt;</a></li>"));

			for(var i = startPage;i <=endPage;i++){
				if(i != currentPage){
					appendObject.append($("<li><a href='javascript:getReviewList("+questionNum+", "+i+");'>"+i+"</a></li>"));
				}else{
					appendObject.append($("<li><a><strong>"+i+"</strong></a></li>"));
				}
			}

			appendObject.append($("<li><a href='javascript:getReviewList("+questionNum+", "+nextPage+");'class='underline'>&gt;</a></li>"));
			appendObject.append($("<li><a href='javascript:getReviewList("+questionNum+", "+ totalCnt +");'class='underline'>&raquo;</a></li>"));

		},
		error : function(request,status,error){
			alert("요청 실패하였습니다.");
			$("#modal-modify").hide("slow");
			alert("request :" + request + "\n"+
					"status :" + status + "\n"+
					"error :" + error);
		}
	});


}


/* 면접후기 리스트 호출*/
function getInterviewList(pageNum){

  var interviewListDiv = $(".interviewList");
  var appendObject;
	$.ajax({
		url:contextPath+"/enterprise/getInterviewList",
		data: {"entIndex" : entIndex,
			     "pageNum" : pageNum
		},
		type:"post",
		dataType:"json",
		success : function(data){
			interviewListDiv.empty()

      var interviewList = data.interviewList;
      var index = 0;



			for(var i in interviewList){

        var tempObject = $("<div class='row'></div>");
        var tempInt = 0;
        var tempStyle = ""
        if(interviewList[i].presentationDate != "" && interviewList[i].presentationDate != null){
          if(tempInt > 0){
            tempStyle = "style='border-left: 2px solid #ddd'";
          }
          tempObject.append("<div class='mobile-intvw-01 col-xs-4' "+tempStyle+"><span>발표시기<br>"+ interviewList[i].presentationDate+"일후</span></div>");
          tempInt = tempInt + 1;
        }
        if(interviewList[i].intrvwResult != "" && interviewList[i].intrvwResult != null){
          if(tempInt > 0){
            tempStyle = "style='border-left: 2px solid #ddd'";
          }
          tempObject.append("<div class='mobile-intvw-01 col-xs-4' "+tempStyle+"><span>면접결과<br>"+ interviewList[i].intrvwResult+"</span></div>");
          tempInt = tempInt + 1;
        }
        if(interviewList[i].intrvwExperience != "" && interviewList[i].intrvwExperience != null){
          if(tempInt > 0){
            tempStyle = "style='border-left: 2px solid #ddd'";
          }
          tempObject.append("<div class='mobile-intvw-01 col-xs-4' "+tempStyle+"><span>면접경험<br>"+ interviewList[i].intrvwExperience+"</span></div>");
          tempInt = tempInt + 1;
        }

        appendObject =
        $("<div/>", {
          class: "panel panel-default",
          append: [$("<div/>", {
                      class:"panel-heading font-gray",
                      html:interviewList[i].regDate
                    }),
                    $("<div/>", {
                      class:"panel-body",
                      append: [$("<div/>", {
                                class: "col-xs-3 intvw-left-side",
                                append: [$("<div/>", {
                                          class: "row",
                                          html:"<p><b>면접난이도</b></p>"
                                         }),
                                         $("<div/>", {
                                           id: "difficulty"+i,
                                           class:"row",
                                           append: [$("<p/>", {
                                                     class:"intrvwDifficulty",
                                                     html: interviewList[i].intrvwDifficulty,
                                                    }),
                                                    $("<div class='col-xs-1 progress-bars bar1' ></div>"),
                                                    $("<div class='col-xs-1 progress-bars bar2' ></div>"),
                                                    $("<div class='col-xs-1 progress-bars bar3' ></div>"),
                                                    $("<div class='col-xs-1 progress-bars bar4' ></div>"),
                                                    $("<div class='col-xs-1 progress-bars bar5' ></div>"),
                                                    $("<br/>"),$("<br/>")
                                                   ]
                                          }),
                                          $("<div/>",{
                                            class:"row",
                                            html:"<p><b>면접일자</b></p><p>"+interviewList[i].intrvwDate+"</p><br>"
                                          }),
                                          $("<div/>",{
                                            class:"row",
                                            html:"<p><b>면접경로</b></p><p>"+interviewList[i].intrvwRoute+"</p><br>"
                                          })
                                        ]
                                }),
                                $("<div/>",{
                                  class:"col-xs-9 mobile-intvw-p",
                                  append: $("<table/>",{
                                            class:"table",
                                            append: [$("<thead/>",{
                                                        html: "<tr><th colspan='6'>"+interviewList[i].intrvwReview+"</th></tr>"
                                                      }),
                                                     $("<tbody/>",{
                                                       append: [$("<tr><td colspan='6'><p><b>면접질문</b></p><p class='font-gray'>"+interviewList[i].intrvwQuestion+"</p></td></tr>"),
                                                                $("<tr><td colspan='6'><p><b>질문에 대한 답변</b></p><p class='font-gray'>"+interviewList[i].intrvwAnswer+"</p></td></tr>"),
                                                                tempObject
                                                               ]
                                                     })
                                                    ]

                                          })
                                })
                               ]
                    })
                   ]
        });

        index = index + 1;
				interviewListDiv.append(appendObject)
			}

			totalCnt = parseInt(data.interviewPageData.pageTotalCount);// 전체레코드수
		 	startPage = parseInt(data.interviewPageData.startPage); // 시작페이지
		 	endPage = parseInt(data.interviewPageData.endPage); // 끝페이지
		 	currentPage = parseInt(data.interviewPageData.currentPage); // 현재페이지
			msgPerPage = parseInt(data.interviewPageData.msgPerPage); // 한페이지 보여중 네비개수
			prevPage = currentPage -1;
			nextPage = currentPage + 1;
			if(nextPage > totalCnt){
				nextPage = totalCnt
			}
			if(prevPage < 1){
				prevPage = 1
			}
			if(endPage > totalCnt){
				endPage = totalCnt
			}

			appendObject = $(".intvw-pagination")
			appendObject.empty()

      if(interviewList.length > 0){
        appendObject.append($("<li><a href='javascript:getInterviewList("+1+");'class='underline'>&laquo;</a></li>"));
  			appendObject.append($("<li><a href='javascript:getInterviewList("+ prevPage +");'class='underline'>&lt;</a></li>"));

  			for(var i = startPage; i <=endPage; i++){
  				if(i != currentPage){
  					appendObject.append($("<li><a href='javascript:getInterviewList("+i+");'>"+i+"</a></li>"));
  				}else{
  					appendObject.append($("<li><a><strong>"+i+"</strong></a></li>"));
  				}
  			}

  			appendObject.append($("<li><a href='javascript:getInterviewList("+nextPage+");'class='underline'>&gt;</a></li>"));
  			appendObject.append($("<li><a href='javascript:getInterviewList("+ totalCnt +");'class='underline'>&raquo;</a></li>"));

        for(var j in interviewList){
     		//progress class 요소의 하위요소인 div 선택해서 intrvw class 추가

     		 if(interviewList[j].intrvwDifficulty == '매우 어려움'){
     			$("#difficulty"+j).addClass("intrvwlv5");
     		} else if(interviewList[j].intrvwDifficulty == '어려움'){
     			$("#difficulty"+j).addClass("intrvwlv4");
     		}else if(interviewList[j].intrvwDifficulty == '보통'){
     			$("#difficulty"+j).addClass("intrvwlv3");
     		}else if(interviewList[j].intrvwDifficulty == '쉬움'){
     			$("#difficulty"+j).addClass("intrvwlv2");
     		}else if(interviewList[j].intrvwDifficulty == '매우 쉬움'){
     			$("#difficulty"+j).addClass("intrvwlv1");
     		}
     	 }
     }else{
       interviewListDiv.append($("<div class='well well-lg'><center>면접 후기가 없습니다</center></div>"));
       $(".box-danger").empty();
     }


		},
		error : function(request,status,error){
			alert("요청 실패하였습니다.");
			alert("request :" + request + "\n"+
					"status :" + status + "\n"+
					"error :" + error);
		}
	});



}


/*컨텍스트 패스 구하는 함수*/
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
}

/* 팔로우 기능*/
function followAction(entIndex,e){
  //로그인 체크
  if(member == "anonymousUser"){
    swal({
      title: "로그인 후 이용 가능합니다. \n\r 로그인 하시겠습니까?!",
      text: "",
      type: "info",
      showCancelButton: true,
      confirmButtonClass: "btn-info"
    },
    function() {
      $("#loginModal").modal("show");
    });
    return false;
  }

  var $this = $(e).children("i");
  var fa = $this.hasClass("fa");
  var requestURL;
  if($this.attr('class') == 'fa fa-heart') {
    requestURL = "revFollow";
  }else{
    requestURL = "regFollow";
  }

  $.ajax({
    url:contextPath+"/enterprise/"+requestURL,
    data: {"entIndex" :entIndex},
    type:"get",
    dataType:"json",
    success : function(data){
        if (data) {
          $this.toggleClass("fa-heart");
          $this.toggleClass("fa-heart-o");
        }
    },
    error : function(request,status,error){
      alert("요청 실패하였습니다.");
    }
  });
}
//
function entInf(){
	$("#person").text(totalPerson[0]);
	$("#fondDate").text(fondDate[0]);
	$("#newPerson").text(newPerson[0]);
	$("#outPerson").text(outPerson[0]);
	$("#newPersonPercent").text(parseFloat((newPerson[0]/totalPerson[0])*100).toFixed(1));
 	$("#outPersonPercent").text(parseFloat((outPerson[0]/totalPerson[0])*100).toFixed(1));

}

//select1 그래프
function changeAvgInfo(e){
	var arr;
	switch (e) {
		case '인원':
			arr = totalPerson;
			break;
		case '업력':
			arr = fondDate;
			break;
		case '입사':
			arr = newPerson;
			break;
		case '퇴사':
			arr = outPerson;
			break;
	}
	var max = Math.max.apply(null, arr);

	$("#select").text(e);
	$("#numOfEnt").text(arr[0]);
	$("#numOfInd").text(arr[1]);
	$("#numOfTotEnt").text(arr[2]);

	$("#entPer").css('width', arr[0]/max*100+'%');
	$("#indPer").css('width', arr[1]/max*100+'%');
	$("#toEntPer").css('width', arr[2]/max*100+'%');
}

/* section4 월별그래프-평균급여 */
function chartSalary(){

	var ctx1 = document.getElementById("lineChart").getContext('2d');
	var lineChart = new Chart(ctx1, {

		type: 'bar',
		/* 데이터 start */
		data: {
			labels: month,
			datasets: [{
					type: 'line',
					label: '평균 급여',
					borderColor: '#BDBDBD',
				 	borderWidth: 2,
				 	pointBorderColor: mainColor,
				 	pointBorderWidth: 3,
					fill: false,
					data: salary,
				},
			],
				borderWidth: 1
		}, /* 데이터 end */
		/* 옵션 start */
		 options: {
			 plugins: {
				datalabels: {
					color: mainColor,
 					align: 'start',
 					anchor: 'start',
					display: function(context) {
						return context.dataset.data[context.dataIndex] ;
					},
					font: {
						weight: 'bold'
					},
 					formatter: function(value, context){
 						return Math.round(value/10000)
 					}
				}
			},
	        elements: {
	            line: {
	                tension: 0, // disables bezier curves
	            }
	        },
	        scales: {
                   yAxes: [{
                	    gridLines: {
   							display: false,
   		            	},
                   		scaleLabel: {
                            display: true,
                            labelString: '(만원)',
                        },
                        ticks: {
                        	 min:0,
                             callback: function(value, index, values) {
                                 return Math.round(value/10000);
                            },
                        },
                   }],
                   xAxes: [{
                	   gridLines: {
   							display: false,
   		            	},
                	    ticks: {
                             callback: function(value, index, values) {
                             	  var month = '';
                             	  (value.substring(4,5)==0) ? month = value.substring(5,6) : month = value.substring(4,6);
                                 return '\''+value.substring(2,4)+' '+month+'월';
                             },
                          },
                	  }]
               },
                tooltips: {
                    enabled: true,
                    mode: 'index',
                    axis: 'y',
                    callbacks: {
                        label: function(tooltipItems, data) {
                        	/* 컴마찍는 부분 */
                        	var value = data.datasets[0].data[tooltipItems.index];
                        	 if(parseInt(value) >= 1000){
                        		 value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                              } else {
                            	 value = value;
                              }
                        	return data.datasets[tooltipItems.datasetIndex].label +': ' + value + ' 원';
                        }
                    }
                },
		    }/* 옵션 end */
	});
}/* section4 월별그래프-평균급여 end */

/* #section4 월별그래프-인원*/
function chartPersonnel(){
	var ctx2 = document.getElementById("comboBarLineChart").getContext('2d');
	var comboBarLineChart = new Chart(ctx2, {
		type: 'bar',
		scaleOverride: false,
		/* 데이터 start */
		data: {
			labels: month,
			datasets: [{/* 총 인원 datasets */
					type: 'line',
					label: '총 인원',
            backgroundColor: '#A566FF',
					borderColor: '#A566FF',
					borderWidth: 0,
					pointBorderColor: '#A566FF',
					pointBorderWidth: 3,
					fill: false,
					data: totalPersonPerMonth,
					datalabels: {
						color:  mainColor,
						align: 'start',
						anchor: 'start',
						display: true,
					},
				}, { /* 입사자 datasets */
					type: 'bar',
					label: '입사자',
					backgroundColor: mainColor,
					data: newPersonPerMonth,
					borderColor: 'white',
					borderWidth: 0,
					datalabels: {
						display: false,
					}
				}, { /* 퇴사자 datasets */
					type: 'bar',
					label: '퇴사자',
					backgroundColor: subColor,
					data: outPersonPerMonth,
					datalabels: {
						display: false,
					}
				}],
				borderWidth: 1
		},/* 데이터 end */
		/* 옵션 start */
		options: {
			plugins: {
				datalabels: {
					font: {
						weight: 'bold'
					},
				}
			},
	        elements: {
	            line: {
	                tension: 0, // disables bezier curves
	            }
	        },
	        tooltips: {
                enabled: true,
                mode: 'index',
                axis: 'y',
                callbacks: {
                    label: function(tooltipItems, data) {
                    	 return data.datasets[tooltipItems.datasetIndex].label +': ' + tooltipItems.yLabel + ' 명';
                    }
                }
            },
            scales: {
                yAxes: [{
                	gridLines: {
						display: false,
		            },
                	scaleLabel: {
                        display: true,
                        labelString: '(명)',
                    },
                }],
                xAxes: [{

                	gridLines: {
						display: false,
		            },
                    ticks: {
                        callback: function(value, index, values) {
                        	 var month = '';
                          	 (value.substring(4,5)==0) ? month = value.substring(5,6) : month = value.substring(4,6);
                             return '\''+value.substring(2,4)+' '+month+'월';
                          },
                       },
              	 }]
            },
	    }/* 옵션 end */

	});
}/* #section4 월별그래프-인원 end */

/* 면접후기 작성시 유효성 검사 */
function interviewValidation(){
	$('#writeInterview').validate({
		/* 규칙 */
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
		/* 메세지 */
		messages : {
			intrvwDifficulty:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwDate:{
			},
			intrvwRoute:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwReview:{
				minlength : "최소 10글자이상이어야 합니다",
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			},
			intrvwQuestion:{
				minlength : "최소 10글자이상이어야 합니다"	,
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			},
			intrvwAnswer:{
				minlength : "최소 10글자이상이어야 합니다"	,
				maxlength : "최대 500글자까지 입력할 수 있습니다"
			}
		},
		/* submit행들러 */
		submitHandler: function(form) {
			swal({
				title:"등록되었습니다",
				type: "success",
				confirmButtonClass: "btn-success",
			},
			function(){
				form.submit();
			})
		}
	});
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
/* 별 */
function stars(){
	$('.stars').barrating({
	    theme: 'fontawesome-stars',initialRating: 1,
	   	onSelect: function(value, text, event){
				var target = event.target.parentNode.parentNode.parentNode.childNodes[3].childNodes[1];
				target.innerHTML = value;
	    }
	});
}
/* 팔로잉 된 기업이면 꽉찬하트 로 바꾸기 . 기본은 빈 하트*/
function followCheck(){
	if(following == 1){
		$("#follow").toggleClass("fa-heart-o");
		$("#follow").toggleClass("fa-heart");
	}
}
//section4 - 평균급여 버튼 클릭 이벤트
function salaryBtn(){
	$("canvas#comboBarLineChart").remove();
	$("div.chartreport").append('<canvas id="lineChart"></canvas>');
	chartSalary();
	$("#personnel-btn").attr('disabled', false);
	$("#salary-btn").attr('disabled', true);
}
//section4 - 인원 버튼 클릭 이벤트
function personnelBtn(){
	$("canvas#lineChart").remove();
	$("div.chartreport").append('<canvas id="comboBarLineChart"></canvas>');
	chartPersonnel();
	$("#personnel-btn").attr('disabled', true);
	$("#salary-btn").attr('disabled', false);
}
