/*$(document).ready(function(){
	//payAmpAvg();
	
	$("#select").text("인원");
	$("#numOfEnt").text("6");
	$("#numOfInd").text("37");
	$("#numOfTotEnt").text("28");
	// var entPer =  DB의 '국민연금 총 가입자 수' 가져오면 됨
	// var indPer = 동종산업군 전체 '국민연금 총 가입자 수' / 동종산업군 수
	// var toEntPer = 전체기업의 '국민연금 총 가입자 수' / 전체 기업 수
	$("#entPer").css('width', '60%');
	$("#indPer").css('width', '10%');
	$("#toEntPer").css('width', '100%');


		

	  
	    
		
		화면 느리게 이동하는거 ---------------- 순서 무조건 맨 마지막에 ★★★★★★★★★★★
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



	*/