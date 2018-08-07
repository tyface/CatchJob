<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<style>

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  height: 400px;
 
}
 
  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
	  
	  }


	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}



</style>
</head>
<body>

<nav class="navbar navbar-inverse">
	<div class="navbar-header col-md-4 container">
		<div class="row">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="true"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<div class="navbar-brand" ><a href="#" style="color:white">
		&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-th-list" >&nbsp;</span>Admin Page</a></div>
 		</div>
	</div>
	</nav>	
	
	<div class="container" style="margin-top:200px">

		<form class="form-signin">
			<h2 class="form-signin-heading">Please login</h2>
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input type="text"
					class="form-control" name="id" placeholder="Admin ID" required=""
					autofocus="" />
			</div>
			<br />
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input type="password"
					class="form-control" name="password" placeholder="Admin Password"
					required="" />
			</div>
			<br/><br/>
			<button class="btn btn-lg btn-info pull-right col-md-4" type="submit">Join</button>
		</form>
	</div>	

</body>
</html>