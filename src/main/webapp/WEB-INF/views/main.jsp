<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/test.css">
  <script  href="<%=request.getContextPath()%>/resources/js/test.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
 <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
<style>
/* .jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 100px 25px;
}
  .container-fluid {
      padding: 10px 50px;
  } 
.bg-grey {
	background-color: #f6f6f6;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}
.item p {
	font-size: 19px;
	
	font-weight: 400;
	font-style: italic;
	
}
.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
}

footer {
	background-color: #f2f2f2;
	padding: 25px;
} */
</style>
</head>
<body>
<%@ include file="nav.jsp"%> 
	<!-- <nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="#">Page 2</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
						Login</a></li>
			</ul>
		</div>
	</nav> -->
	<div class="container jumbotron text-center">
		<h1>Company</h1>
		<p>We specialize in blablabla</p>
		<form class="form-inline">
			<div class="input-group">
				<input type="email" class="form-control" size="50"
					placeholder="Email Address" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">Subscribe</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Container (Portfolio Section) -->
	<div class="container text-center bg-grey">
		<h2>Portfolio</h2>
		<br>
		<h4>What we have created</h4>
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
				<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/test.css"> --%>
					<img src="<%=request.getContextPath()%>/resources/img/paris.jpg" alt="Paris" width="400" height="300">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Yes, we built Paris</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="<%=request.getContextPath()%>/resources/img/newyork.jpg" alt="New York" width="400" height="300">
					<p>
						<strong>New York</strong>
					</p>
					<p>We built New York</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="<%=request.getContextPath()%>/resources/img/sanfran.jpg" alt="San Francisco" width="400" height="300">
					<p>
						<strong>San Francisco</strong>
					</p>
					<p>Yes, San Fran is ours</p>
				</div>
			</div>
		</div>

		<!-- <h2>What our customers say</h2> -->
		<div id="myCarousel" class="carousel slide text-center"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="item">
					<h3>    rldjqtnsdnl</h3>	
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<h4>    </h4>					
					</div>
				</div>
				<div class="item">
				<h3>    rldjqtnsdnl</h3>	
					<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<h4>    </h4>
				</div>
				<div class="item">
				<h3>    rldjqtnsdnl</h3>	
					<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
						<h4>    </h4>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
<%@ include file="footer.jsp"%> 
	<!-- <footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer> -->
</body>
</html>
 