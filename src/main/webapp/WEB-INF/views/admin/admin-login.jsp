<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<div class="navbar-brand">
			<a id="sidebarCollapse" href="${pageContext.request.contextPath}/admin"> &nbsp;&nbsp;&nbsp;<span
				class="glyphicon glyphicon-th-list">&nbsp;</span>Admin Page
			</a>
		</div>
	</div>
	</nav>
	<div class="container" id="loginContainer">
		<form class="form-signin"
			action="${pageContext.request.contextPath}/admin/login" method="post">
			<h2 class="form-signin-heading">Please login</h2>
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input type="text"
					class="form-control" name="mberId" placeholder="Admin ID"/>
			</div>
			<div class="input-group" id="adminLoginPw">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input type="password"
					class="form-control" name="mberPw" placeholder="Admin Password"/>
			</div>
			<button class="btn btn-lg btn-info pull-right col-md-4" type="submit" id="adminLoginBtn"
			>login</button>
		</form>
	</div>
</body>
</html>