<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
		margin-bottom: 50px;
	}
	#keyword{
		height:28px;
	}
	#indutyBox{
		height:500px; 
		overflow:scroll; 
		background-color:rgb(235, 232, 232); 
		border: 1px dotted gray;
	}
</style>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header">[ 산업군 분류 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6" id="indutyBox">
								 	
								
								</div>
					
					
					
					
					
								
						
					</div>
				</div>
			</div>
		</div>					
</body>
</html>