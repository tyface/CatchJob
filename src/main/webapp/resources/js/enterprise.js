$(document).ready(function(){
	//payAmpAvg();
	
	$("#select").text("인원");
	$("#numOfEnt").text("98141");
	$("#numOfInd").text("37");
	$("#numOfTotEnt").text("28");
	// var entPer =  DB의 '국민연금 총 가입자 수' 가져오면 됨
	// var indPer = 동종산업군 전체 '국민연금 총 가입자 수' / 동종산업군 수
	// var toEntPer = 전체기업의 '국민연금 총 가입자 수' / 전체 기업 수
	$("#entPer").css('width', '60%');
	$("#indPer").css('width', '10%');
	$("#toEntPer").css('width', '100%');


		$("#myBtn").click(function() {
			$("#myModal").modal();
		});

		$("#myBtn2").click(function() {
			$("#myModal").modal();
		});

		$("#btnA").click(function() {
			//alert("버튼A 눌림!");

			$("#select").text("인원");
			$("#numOfEnt").text("98141");
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
			$("#numOfEnt").text("23");
			$("#numOfInd").text("30");
			$("#numOfTotEnt").text("60");

			$("#entPer").css('width', "100%");
			$("#indPer").css('width', '30%');
			$("#toEntPer").css('width', '60%');
		});

		$("#btnC").click(function() {
			//alert("버튼C 눌림!");
			$("#select").text("입사");
			$("#numOfEnt").text("5486");
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("40");

			$("#entPer").css('width', '30%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '40%');
		});

		$("#btnD").click(function() {
			//alert("버튼D 눌림!");
			$("#select").text("퇴사");
			$("#numOfEnt").text("3104");
			$("#numOfInd").text("60");
			$("#numOfTotEnt").text("30");

			$("#entPer").css('width', '40%');
			$("#indPer").css('width', '60%');
			$("#toEntPer").css('width', '30%');
		});
		
		
		
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

/* 기업리뷰- 별점  ----------------------------------------------------------------------  */
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
	        alert($(this).next().text())
	        $result.text($(this).next().text());
	      })
	        .on("mouseover", ".star-input label", function(){
	        $result.text($(this).text());
	      })
	        .on("mouseleave", ".star-input>.input", function(){
	        var $checked = $star.find(":checked");
	        if($checked.length === 0){
	          $result.text("0");
	        } else {
	          $result.text($checked.next().text());
	        }
	      });
	    };
	    starRating();
	    /* 별점END -----------------------------------------------*/
	    
	    
	    
	  
	    
		
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


/* 팔로우 */	
function classToggle(){
	$("#btnFollow").toggleClass("following");
}

//function payAmpAvg(){
//	//$("#btnFollow").toggleClass("following");
//	
//	alert($("#payAmtAvg").val());
//}	
	