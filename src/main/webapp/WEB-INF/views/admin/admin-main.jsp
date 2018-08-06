<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CATCH JOB Admin</title>
<meta	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- 부트스트랩 스타일시트 파일 링크 설정
	contextpath는 절대 경로를 만들기 위해서 추가 -->

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

 <script	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<%--   <link href="${pageContext.request.contextPath}/resources/css/dashboard.css" rel="stylesheet"> --%>
  
  
<style>

.sidebar{
	height:800px;
	
	border-right-width:0.1em; 
	border-right-style:dotted;
}





</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
        
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="true"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="#">Admin Page</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><span class="glyphicon glyphicon-user"></span> <span>Admin_1</span></li>
				<li>님 접속 상태입니다</li>
				<button class="btn btn-danger navbar-btn">로그아웃</button>
			</ul>
		</div>
	</nav>

	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        
        
        <div class="col-md-9 main" >
          <h1 class="page-header" style="text-align:center;   font-weight: bold;">[ 회원 그룹 관리 ]</h1>
          <br>
          <div class="col-xm-offset-1">
		<div class="row" style="margin:20px">

          <div class="table-responsive col-md-6">
          <div class="row">
          <div class="col-md-2">
		<select style="width:70px;">
 		 <option>5</option>
 		 <option>10</option>
 		 <option>15</option>
 		 <option>20</option>
		</select>

		</div>
		<div class="col-md-5">entries</div> 		
		
		<form action="search" class="form-inline">
				<div class="input-group">
					<input type="text" name="keyword" class="form-control" size="20" 
					style="height:28px" 
					>
					<div class="input-group-btn">
						<button type="button" class="btn">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>

				</div>

			</form>
	
		</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>NO</th>
                  <th>아이디</th>
                  <th>구분</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach begin="1" end="10" >
                <tr>
                  <td>1</td>
                  <td>test@naver.com</td>
                  <td>일반</td>
                </tr>
			</c:forEach>              
              </tbody>
            </table>
          </div>
          <div class="col-md-1">
          </div>
          
               <div class="col-md-5">
          		<table class="table" border="0">
                <tr>
                  <td>test@naver.com</td>
                  <td>일반</td>
                </tr>    
                 <tr>
                  <td>test@naver.com</td>
                  <td>일반</td>
                </tr>   
                 <tr>
                  <td>test@naver.com</td>
                  <td>일반</td>
                </tr>   
                 <tr>
                  <td>test@naver.com</td>
                  <td>일반</td>
                </tr>       
            </table>
            
            
          	</div>
          
        </div>
        
        </div>
        </div>
      </div>
    </div>
  
 
    
    
    

</body>
</html>