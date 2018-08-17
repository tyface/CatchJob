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
		height:450px; 
		overflow:scroll; 
		background-color:rgb(235, 232, 232); 
		border: 1px solid gray;
	}
</style>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header">[ 산업군 분류 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-5" id="indutyBox">
								<br>
								  <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> IT/웹/통신</label>
						        </div>
								  <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 건설업</label>
						          </div>
								  <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 교육업</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 금융/은행</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 기관/협회</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 미디어/디자인</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 서비스업</label>
						          </div>	
								 <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 유통/무역/운수</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 은행/금융업</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 의료/제약/복지</label>
						          </div>
						          <div>
						              <input type="radio" id="it" name="it"/>
						              <label for="it"> 제조/화학</label>
						          </div>	
								 	
								 	
								</div>
									
								<div class="col-md-5 col-md-offset-1" id="indutyBox">								 	
								
								</div>
							</div>
							<div class="row">
							 	<div class="col-md-5" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>
								<div class="col-md-5 col-md-offset-1" style="text-align:center">
							 		<input type="button" class="btn btn-info" value="분류 추가">
							 		<input type="button" class="btn btn-warning" value="선택 미사용">
								</div>									
							</div>
						</div>
					<div class="col-md-5">
							<form class="form-horizontal" action="modifyMber" method="post">
								<div class="form-group">
									<label for="mberId" class="col-sm-4 control-label">분류 명 </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="mberId"
											placeholder="아이디" value="${member.mberId}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">분류 코드</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" name="mberPw"
											placeholder="비밀번호" value="${member.mberPw}">
									</div>
								</div>
								<div class="form-group">
									<label for="mberPw" class="col-sm-4 control-label">정렬 우선순위</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" name="mberPw"
											placeholder="비밀번호" value="${member.mberPw}">
									</div>
								</div>
								
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">등록일자</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="regDate"
											placeholder="가입날짜" value="${member.regDate}">
									</div>
								</div>
							</form>
							<br>
							<div class="pull-right">
								<input type="button" class="btn btn-info" value="수정하기">
								<input type="button" class="btn btn-primary" value="추가하기">
								<input type="button" class="btn btn-warning" value="초기화">
							</div>
						</div>
				</div>
			</div>
		</div>					
</body>
</html>