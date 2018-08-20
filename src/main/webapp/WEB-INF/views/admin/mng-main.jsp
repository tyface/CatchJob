<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	.form-group{
		padding:3px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
			
			<div class="col-md-9 main">		
				<h1 class="page-header" style="text-align: center; font-weight: bold;">[ 메인화면 관리 ]</h1><br/>
				<div class="col-md-offset-1">	
				<div class="row" style="margin: 20px">	
					<div class="col-sm-8">
						<form class="form">
							<div class="form-group" style="font-size:25px">
								<label for="logo" class="control-label">상단로고							
									<img src="${pageContext.request.contextPath}/resources/img/logo.png" id="logo"></label>	
							</div>
						</form>
					</div>
						<div class="col-sm-4">
							<form class="form" style="text-align:right;">
								<div class="form-group">
									<label for="text" class="col-sm-4 control-label" id="height"> 높이</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="height"
											placeholder="0">
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="text" class="col-sm-4 control-label" id="width"> 너비</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="width"
											placeholder="0">
									</div>
								</div>
							</form>	
								<div class="pull-right" style="padding:20px">
									<button type="button" class="btn btn-info">등록하기</button>
									<button type="button" class="btn btn-success">불러오기</button>
								</div>
							
							</div>
						</div> 
						<br/>
						<form class="form-horizontal">
							<div class="form-group shadow-textarea row col-sm-12">
								<div>
									<div class="col-sm-2"  style="text-align:right">
								    	<label for="copyRight">하단 카피라이트</label>
								    </div>
								    <div class="col-sm-8">
								    <textarea class="form-control z-depth-1" id="copyRight" rows="5">Copyright ©Spring MVC Board All rights reserved. version 1.0
								   	 </textarea>
								     </div>
							     </div>
							     <div class="col-sm-2" style="margin-bottom:10px">
									<button type="button" class="btn btn-info">등록하기</button>
								</div>
								 <div class="col-sm-2" >
									<button type="button" class="btn btn-warning">초기화</button>
								</div>
							</div>								
						</form>				
				</div> <!--<div class="col-md-offset-1"> end -->
			</div> <!--<div class="col-md-9 main"> end -->
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->

</body>
</html>