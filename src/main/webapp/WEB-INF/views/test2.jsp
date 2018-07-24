<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      position: relative;
  }
  .affix {
      top: 20px;
      z-index: 9999 !important;
  }
  div.col-sm-9 div {
     /*  height: 250px; */
      font-size: 28px;
  }
 #section1 {padding:50px 20px 20px 20px; color: #fff; background-color: #1E88E5;}
  #section2 {padding:50px 20px 20px 20px;color: #fff; background-color: #673ab7;}
  #section3 {padding:50px 20px 20px 20px;color: #fff; background-color: #ff9800;}
  #section41 {padding:50px 20px 20px 20px;color: #fff; background-color: #00bcd4;}
  #section42 {padding:50px 20px 20px 20px;color: #fff; background-color: #009688;}

  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
    .logo-small {
      color: #f4511e;
      font-size: 50px;
      width: 50px;
  }
  .logo {
      color: #f4511e;
      font-size: 200px;
  }
  </style>
</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CATCH JOB</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" id="myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#" id="myBtnLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      
    </ul>
  </div>
</nav>



<div class="container" style="background-color:#2196F3;color:#fff;height:200px;">
 	
 	<h1 style="padding-top:50px">삼성전자</h1>

	
        <a href="#" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-heart"></span> 팔로잉 
       </a>
       <div style="">
        <a href="#" class="btn btn-default btn-sm">기업리뷰작성</a>
         <a href="#" class="btn btn-default btn-sm">면접후기작성</a>
    	</div>
</div>
<br>

<!-- <div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo" style="font-size:1000px"></span>
    </div>
    <div class="col-sm-8">
      <h2>Our Values</h2>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>      
      <p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
    </div>
  </div>
</div> -->
<!-- <span class="glyphicon glyphicon-bookmark"></span> bookmark
<span class="glyphicon glyphicon-heart"></span> Heart 
<span class="glyphicon glyphicon-heart-empty"></span> Heart -empty
<span class="glyphicon glyphicon-star"></span> star
<span class="glyphicon glyphicon-star-empty"></span> -star-empty
<span class="glyphicon glyphicon-thumbs-up"></span> -thumbs-up
월별그래프
<span class="glyphicon glyphicon-stats"></span>stats
기업정보--빌딩
<span class="glyphicon glyphicon-globe"></span> -globe
<span class="glyphicon glyphicon-tasks"></span> -tasks
기업리뷰...
면접후기
  -->

<div class="container">
  <div class="row">
    <nav class="col-sm-2" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
      	<li style="height:30px"></li>
        <li><a href="#section1"><span class="glyphicon glyphicon-bookmark  logo-small"></span> <p>기업정보</p></a></li>
        <li><a href="#section2"><span class="glyphicon glyphicon-file logo-small"></span><p>기업리뷰</p></a></li>
        <li><a href="#section3"><span class="glyphicon glyphicon-pencil logo-small"></span> <p>면접후기</p></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-stats logo-small"></span> <p>월별그래프</p><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#section41">월별그래프_인원</a></li>
            <li><a href="#section42">월별그래프_평균급여</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <div class="col-sm-10" >
      <div id="section1" >    
        <h3>기업정보</h3>
        <div class="row">
        	<div class="col-sm-12">
        		<h5>소재지</h5>
        	</div>
        </div>
        <div class="row">
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>인원</h5></div>
        		<div class="col-sm-6">fdsafda</div>        		
        	</div>
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>업력</h5></div>
        		<div class="col-sm-6">fdsafda</div>        		
        	</div>
        </div>
        <div class="row" >
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>입사</h5></div>
        		<div class="col-sm-6">fdsafda</div>        		
        	</div>
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>퇴사</h5></div>
        		<div class="col-sm-6">fdsafda</div>        		
        	</div>
        </div>
        <div class="row" >
        	<div class="col-sm-4" style="border:2px solid gray; ">
        		<div class="row" >
        			<h5>총 매출액</h5>
        			<p>134조원</p>
        		</div>
        	</div>
        	<div class="col-sm-4" style="border:2px solid gray; ">
        		<div class="row" >
        			<h5>1인당 매출액</h5>
        			<p>138조원</p>
        		</div>
        	</div>
        	<div class="col-sm-4" style="border:2px solid gray; ">
        		<div class="row" >
        			<h5>매출액 대비 임금금액</h5>
        			<p>10%</p>
        		</div>
        	</div>
         </div>
        <div class="row">	
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>올해 입사자 평균연봉</h5></div>
        		<div class="col-sm-6"><p>6663 만원</p></div>        		
        	</div>
        	<div class="col-sm-6" style="border:2px solid gray; ">
        		<div class="col-sm-6"><h5>평균연봉</h5></div>
        		<div class="col-sm-6"><p>10250 만원</p></div>        		
        	</div>
        </div>
        
                         
      </div>
      <div id="section2"> 
        <h3>기업리뷰</h3>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
			 <div class="panel-group " id="accordion" >
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse in">
			        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
			        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Collapsible Group 2</a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
			        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Collapsible Group 3</a>
			        </h4>
			      </div>
			      <div id="collapse3" class="panel-collapse collapse">
			        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
			        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
			      </div>
			    </div>
			  </div> 
        
      </div>       
      
      
       
      <div id="section3">
        <h3>면접후기</h3>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
      <div id="section41">
        <h3>월별그래프_인원</h3>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>      
      <div id="section42">
        <h3>월별그래프_평균급여</h3>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){
  // Add scrollspy to <body>
  $('body').scrollspy({target: ".navbar", offset: 50});   

  // Add smooth scrolling on all links inside the navbar
  $("#myScrollspy a").on('click', function(event) {
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
</script>


</body>
</html>
