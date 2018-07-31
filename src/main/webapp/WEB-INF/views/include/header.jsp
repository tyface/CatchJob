<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- JSTL 의 core 기능을 사용하기 위한 설정 : if, forEach, set 사용
	조건문 반복문 만드는거  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CATCH JOB</title>
<!-- 현재 기기의 너비에 맞추어서 출력을 하고
기본 크기는 1배 최대 크기도 1배 확대축소 못하게 하는 설정
모바일 웹 애플리케이션에서 주로 사용 -->
<meta	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!-- 부트스트랩 스타일시트 파일 링크 설정
	contextpath는 절대 경로를 만들기 위해서 추가 -->
<%-- <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"	rel="stylesheet" type="text/css" /> --%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.jumbotron {
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
}

.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

#inputError{
	color : DarkRed ;
	font-weight: 400;
}
</style>


</head>
<!-- jQuery 설정-->
<script	src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<body class="skin-blue sidebar-mini">

  <header class="main-header">
    <jsp:include page="login-nav.jsp" flush="true"/>
  </header>
