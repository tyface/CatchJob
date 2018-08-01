$(document).ready(function(){
	$("#select").text("인원" + "입니다..");
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
	    
	    
	    
	    /* 차트.... */

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

		var areaChartData = {
			labels : [ 'January', 'February', 'March', 'April', 'May', 'June',
					'July' ],
			datasets : [ {
				label : 'Electronics',
				fillColor : 'rgba(210, 214, 222, 1)',
				strokeColor : 'rgba(210, 214, 222, 1)',
				pointColor : 'rgba(210, 214, 222, 1)',
				pointStrokeColor : '#c1c7d1',
				pointHighlightFill : '#fff',
				pointHighlightStroke : 'rgba(220,220,220,1)',
				data : [ 65, 59, 80, 81, 56, 55, 40 ]
			}, {
				label : 'Digital Goods',
				fillColor : 'rgba(60,141,188,0.9)',
				strokeColor : 'rgba(60,141,188,0.8)',
				pointColor : '#3b8bba',
				pointStrokeColor : 'rgba(60,141,188,1)',
				pointHighlightFill : '#fff',
				pointHighlightStroke : 'rgba(60,141,188,1)',
				data : [ 28, 48, 40, 19, 86, 27, 90 ]
			} ]
		}

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
		areaChart.Line(areaChartData, areaChartOptions)

		//-------------
		//- LINE CHART -
		//--------------
		var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
		var lineChart = new Chart(lineChartCanvas)
		var lineChartOptions = areaChartOptions
		lineChartOptions.datasetFill = false
		lineChart.Line(areaChartData, lineChartOptions)

		//-------------
		//- PIE CHART -
		//-------------
		// Get context with jQuery - using jQuery's .get() method.
		var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
		var pieChart = new Chart(pieChartCanvas)
		var PieData = [ {
			value : 700,
			color : '#f56954',
			highlight : '#f56954',
			label : 'Chrome'
		}, {
			value : 500,
			color : '#00a65a',
			highlight : '#00a65a',
			label : 'IE'
		}, {
			value : 400,
			color : '#f39c12',
			highlight : '#f39c12',
			label : 'FireFox'
		}, {
			value : 600,
			color : '#00c0ef',
			highlight : '#00c0ef',
			label : 'Safari'
		}, {
			value : 300,
			color : '#3c8dbc',
			highlight : '#3c8dbc',
			label : 'Opera'
		}, {
			value : 100,
			color : '#d2d6de',
			highlight : '#d2d6de',
			label : 'Navigator'
		} ]
		var pieOptions = {
			//Boolean - Whether we should show a stroke on each segment
			segmentShowStroke : true,
			//String - The colour of each segment stroke
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
			maintainAspectRatio : true,
		//String - A legend template

		}
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		pieChart.Doughnut(PieData, pieOptions)

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

			//Boolean - whether to make the chart responsive
			responsive : true,
			maintainAspectRatio : true
		}

		barChartOptions.datasetFill = false
		barChart.Bar(barChartData, barChartOptions)
	
	    
		
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

	
	