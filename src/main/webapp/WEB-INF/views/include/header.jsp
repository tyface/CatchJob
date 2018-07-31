<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- JSTL 의 core 기능을 사용하기 위한 설정 : if, forEach, set 사용
	조건문 반복문 만드는거  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/my.css" rel="stylesheet" >
<script	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>
<!-- jQuery 설정-->

<body class="skin-blue sidebar-mini">

  <header class="main-header">
    <jsp:include page="login-nav.jsp" flush="true"/>
  </header>
