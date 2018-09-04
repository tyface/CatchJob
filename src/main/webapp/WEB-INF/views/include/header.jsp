<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CATCH JOB</title>
<!-- 현재 기기의 너비에 맞추어서 출력을 하고
기본 크기는 1배 최대 크기도 1배 확대축소 못하게 하는 설정
모바일 웹 애플리케이션에서 주로 사용 -->
<meta	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- 부트스트랩 스타일시트 파일 링크 설정
	contextpath는 절대 경로를 만들기 위해서 추가 -->

<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sweetalert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/public.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/public.js"></script>
<security:authentication var="principal" property="principal"/>


<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var member = "${principal}"
	var mainColor = '#6B66FF'
	var subColor = '#B5B2FF'


	// 페이스북 리다이렉트 프래그먼트 포함 오류 해결용(임시)
	if (window.location.hash && window.location.hash == '#_=_') {
		if (window.history && history.pushState) {
				window.history.pushState("", document.title, window.location.pathname);
		} else {
				// Prevent scrolling by storing the page's current scroll offset
				var scroll = {
						top: document.body.scrollTop,
						left: document.body.scrollLeft
				};
				window.location.hash = '';
				// Restore the scroll offset, should be flicker free
				document.body.scrollTop = scroll.top;
				document.body.scrollLeft = scroll.left;
		}
	}
</script>


</head>
<!-- jQuery 설정-->

<body class="skin-blue sidebar-mini">
	<div class="container-fluid">
	  <header class="main-header">
			<%@ include file="login-nav.jsp" %>
	    <%-- <jsp:include page="login-nav.jsp" flush="true"/> --%>
	  </header>

		<div id="content-wrap">
