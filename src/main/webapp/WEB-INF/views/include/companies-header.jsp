<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Bootstrap Example</title>



<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">
	
	<!-- bootstrap datepicker -->
<link rel="stylesheet"	href="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
	

<style>
body {
	position: relative;
}

.affix {
	top: 20px;
	z-index: 9999 !important;
}

div.col-sm-9 div {
	/*  height: 250px;  */
	font-size: 28px;
}

#section1 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #f4511e;
}

#section2 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #ff9800;
}

#section3 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #00bcd4;
}

#section41 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #009688;
}

#section42 {
	padding: 50px 20px 20px 20px;
	color: #fff;
	background-color: #009688;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
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

.font-gray {
	color: #5D5D5D;
}
footer {
	background-color: #f2f2f2;
	padding: 25px;
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
			<li><a href="#" id="myBtnSignUp"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="#" id="myBtnLogin"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>

		</ul>
	</div>
	</nav>
    