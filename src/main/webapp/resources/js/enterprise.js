$(function(){



//  $("#select").text("인원");
//  $("#numOfEnt").text("6");
//  $("#numOfInd").text("37");
//  $("#numOfTotEnt").text("28");
//  // var entPer =  DB의 '국민연금 총 가입자 수' 가져오면 됨
//  // var indPer = 동종산업군 전체 '국민연금 총 가입자 수' / 동종산업군 수
//  // var toEntPer = 전체기업의 '국민연금 총 가입자 수' / 전체 기업 수
//  $("#entPer").css('width', '60%');
//  $("#indPer").css('width', '10%');
//  $("#toEntPer").css('width', '100%');



    /*화면 느리게 이동하는거 ---------------- 순서 무조건 맨 마지막에 ★★★★★★★★★★★*/
    // Add scrollspy to <body>
      $('body').scrollspy({target: ".navbar", offset: 50});

      // Add smooth scrolling on all links inside the navbar
      $("#myNavbar a").on('click', function(event) {
        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
          // Prevent default anchor click behavior
          event.preventDefault();

          // Store hash
          var hash = this.hash;

          // Using jQuery's animate() method to add smooth page scroll
          // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
          $('html, body').animate({
            scrollTop: $(hash).offset().top
          }, 800, function(){

            // Add hash (#) to URL when done scrolling (default click behavior)
            window.location.hash = hash;
          });
        }  // End if
      });

});

/* 무한 스크롤 페이징*/
function appendEntList(entList,pageNum,pageViewCount){
  var appendObject;
  var firstNum = pageNum * pageViewCount;
  var lastNum = firstNum + 9 ;

  if(firstNum >= entList.length || lastNum >= entList.length){
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


    appendObject =
      $("<div/>",{
        class:"row ent-list",
        append: [$("<div/>",{
                  class:"col-sm-8",
                  append:  [$("<div/>",{
                            class:"row",
                            append: [$("<a/>",{
                                        class:"p25",
                                        href:"enterprise/view?entIndex="+entList[i].entIndex ,
                                        html:entList[i].entName
                                      }),
                                      $("<a/>",{
                                        class:"btn btnFollow mailbox-star",
                                        append:  $("<i/>", {
                                                  class:"fa fa-heart",
																											name:"tet",
                                                  style:"color: red; font-size: 20px;"
                                                })
                                      })]
                          }),
                          $("<div/>",{
                            class:"row visible-lg visible-md visible-sm",
                            text:entList[i].industryName + " | " + entList[i].bcityName + " " + entList[i].signguName
                          }),
                          $("<div/>",{
                            class:"row",
                            append: $("<p/>", {
                                      class:"p-1",
                                      text:"평균연봉 " + entList[i].salaryAvg + " 만원"
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

/* 맨위로 버튼*/
$(function() {
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
});

/*컨텍스트 패스 구하는 함수*/
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
}
