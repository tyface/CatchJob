<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication var="principal" property="principal"/>
<script>

$(function() {
	$(".googleBtn").on("click",function() {
		location.href="${pageContext.request.contextPath}/member/googleLogin";
	});
	$(".facebookBtn").on("click",function() {
		location.href="${pageContext.request.contextPath}/member/facebookLogin";
	});

	$(".myBtnLogin").on("click",function() {
		$("#loginModal").modal("show");
	});

	$("#loginHide").on("click",function() {
		$("#loginModal").modal("hide");
	});

	$("#loginForm").on("submit", function() {
		 $.ajax({
				type : "post",
				url : contextPath+"/member/login",
				data : {
					 "mberId" : $("#loginId").val(),
					 "mberPw" : $("#loginPw").val()
				},

				dataType : "json",
				success : function(data) {
					 if (data.result == "CODE_01") {
							window.location.reload();
					 }else if(data.result == "CODE_02"){
						 swal({
						   title:"비밀번호를 다시 입력해 주세요",
							 type:"warning",
							 confirmButtonClass: "btn-warning"
						 })
					 }else if(data.result == "CODE_03"){
						 swal({
						   title:"사용자가 존재하지 않습니다",
							 type:"error",
							 confirmButtonClass: "btn-danger"
						 })
					 }
				},
				error : function() {
					swal({
						title:"사용자가 존재하지 않습니다",
						type:"error",
						confirmButtonClass: "btn-danger"
					});
				}
		 });
		 return false;
	});

	$("#pwModifyForm").on("submit", function() {
		var pw1 = $("input[name=password]").val();
		var pw2 = $("input[name=passwordCheck]").val();

		if(pw1==pw2 && pw1 !=""){
			$.ajax({
				 type : "post",
				 url : contextPath+"/member/passwordModify",
				 data : {
						"password" : pw1,
						"passwordCheck" : pw2
				 },
				 dataType : "json",
				 success : function(data) {
						if (data.result) {
							swal({
								title:"비밀번호가 변경 되었습니다.",
								type:"success",
								confirmButtonClass: "btn-success"
							});
  						$("#pwModifyModal").modal("hide");
						} else {
							swal({
	  						title:"비밀번호 수정에 실패하였습니다.",
	  						type: "error",
	  						confirmButtonClass: "btn-error"
	  					})
						}
				 },
				 error : function() {
					 swal({
 						title:"비밀번호 수정 오류",
 						type: "error",
 						confirmButtonClass: "btn-error"
 					})
				 }
			});
			return false;
		}else{
			swal({
				title:"동일한 비밀번호를 입력하세요.",
				type: "warning",
				confirmButtonClass: "btn-warning"
			})
			return false;
		}

	});

	$("input[name=password], input[name=passwordCheck]" ).on("keyup",function(){
		var pw1 = $("input[name=password]").val();
		var pw2 = $("input[name=passwordCheck]").val();
		var checkMsg = $("#checkMsg");

		if(pw1!=pw2){
			checkMsg.html("동일한 비밀번호를 입력하세요.");
			checkMsg.css({color:"red"});
		}else{
			checkMsg.html("비밀번호가 확인 되었습니다.");
			checkMsg.css({color:"black"});
		}
	});

	//모달 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
			$(this).find('form')[0].reset()
	});

	$(".myBtnSignUp").click(function(){
			$("#myModalSignUp").modal("show");
	});

	$("#signUpHide").click(function() {
		$("#myModalSignUp").modal("hide");
	});

	$("#signUpForm").on("submit", function() {
		$.ajax({
			type : "post",
			url : contextPath+"/member/join",
			data : {
				"signUpId" : $("#signUpId").val(),
				"signUpPw" : $("#signUpPw").val(),
				"signUpPwCheck" : $("#signUpPwCheck").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.result) {
					// 회원가입 성공
					swal({
						title:"해당 이메일로 인증 메일이 발송되었습니다.",
						type: "success",
						confirmButtonClass: "btn-success"
					},function(){
						$("#myModalSignUp").modal("hide");
					})

				} else {
					//비밀번호가 다릅니다.
					$("#signUpFail").removeClass('hidden');
				}
			},
			error : function() {
				//이미 가입된 이메일입니다
				$("#signUpFail").removeClass('hidden');
			}
		});
		return false;
	});

});

// <%-- 기업인증 --%>
// <div class="modal fade" id="entVerifyModal" role="dialog">
// 	<div class="modal-dialog">
//
// 		<!-- Modal content-->
// 		<div class="modal-content">
// 			<div class="modal-header" style="padding: 35px 50px;">
// 				<button type="button" class="close" data-dismiss="modal">&times;</button>
// 				<h4>
// 					<span class="glyphicon glyphicon-lock"></span> 기업회원 인증하기
// 				</h4>
// 			</div>
//
// 			<div class="modal-body" style="padding: 40px 50px;">
// 				<form role="form" method="post" id="entVerifyForm">
// 					<h4>기업회원 인증방법</h4>
// 					<p>1) 명함이나 재직증명서로 인증하기. 관리자이메일(catchjob33@gmail.com) </p>
// 					<p>2) 회사 이메일로 인증하기</p>
// 					<div class="form-group has-feedback">
// 						<input	type="email" class="form-control" id="test" placeholder="회사 이메일로 인증하기">
// 						<span class="glyphicon glyphicon-envelope form-control-feedback" ></span>
// 					</div>
// 					<div class="form-group has-feedback">
// 					<button type="submit" class="btn btn-success btn-block">
// 						<span class="glyphicon glyphicon-off"></span> 인증 메일보내기
// 					</button>
// 				</form>
// 			</div>
// 		</div>
//
// 	</div>
// </div>

</script>

<security:authorize access="isAnonymous()">

<nav class="navbar navbar-inverse">
  <div class="f-left">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
  </div>
  <div class="f-right nav-btn-1">
    <div class="col-xs-6 cursorOn myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</div>
    <div class="col-xs-6 cursorOn myBtnLogin"><span class="glyphicon glyphicon-log-in"></span> Login</div>
  </div>
</nav>

  <!-- 로그인 모달 -->
  <div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">

          <form role="form" method="post" id="loginForm">
					<div class="form-group has-feedback">
								<input type="email" class="form-control" id="loginId" placeholder="Enter">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							 <input type="password" class="form-control" id="loginPw" placeholder="Password">
							 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>

					<div class="form-group row">
						<br><center><p>- OR -</p></center><br>
						<button class="btn col-xs-12 facebookBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> Sign in with facebook
						</button>
						<button class="btn col-xs-12 googleBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> Sign in with Google &nbsp;&nbsp;
						</button>
					</div>

        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#myModalSignUp" class="blue-font" data-toggle="modal" id="loginHide">Sign Up</a></p>
          <p>Forgot <span class="blue-font" onclick="passwordModifyForm()">Password</span></p>
        </div>
      </div>
    </div>
  </div>

		<!-- 회원가입 모달 -->
		<div class="modal fade" id="myModalSignUp" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Sign Up
						</h4>
					</div>

					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post" id="signUpForm">
							<div class="form-group has-feedback">
								<input	type="email" class="form-control" id="signUpId"	placeholder="Email">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
								<!-- 비밀번호 -->
								<input type="password" class="form-control" id="signUpPw" placeholder="Password">
								 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
					        <div class="form-group has-feedback">
								<!-- 비밀번호 확인  -->
								<input type="password" class="form-control" id="signUpPwCheck"	placeholder="Retype password">
								 <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
							</div>
							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-off"></span> Sign Up
							</button>
							<!-- 회원가입 실패 시 보이는 창 -->
							<div class="form-group has-error has-feedback hidden"
								id="signUpFail">
								<div class="input-group">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-exclamation-sign"	aria-hidden="true"></span>
									</span>
									<input type="text" class="form-control" id="inputError"
									aria-describedby="inputGroupSuccess1Status"	value="이메일 혹은 비밀번호가 유효하지 않습니다. 다시 시도하세요">
								</div>
							</div>
						</form>

						<div class="form-group row">
							<br><center><p>- OR -</p></center><br>
							<button class="btn col-xs-12 facebookBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> Sign in with facebook
							</button>
							<button class="btn col-xs-12 googleBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> Sign in with Google &nbsp;&nbsp;
							</button>
						</div>

					</div>

					<div class="modal-footer">
						 <a href="#loginModal" data-toggle="modal" id="signUpHide">I already have a membership</a>
					</div>
				</div>

			</div>
		</div>

		<%-- 비밀번호 찾기 모달 --%>
		<%-- <div class="modal fade" id="findPasswordModal" role="dialog" >
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 비밀번호 재설정하기
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<p>입력하신 메일로 비밀번호 변경하기 링크가 전송됩니다.</p><br>

						<form role="form" method="post" id="findPasswordForm">
							<div class="form-group has-feedback">
								<input	type="email" class="form-control" name="email" placeholder="Email">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div><br>
							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-off"></span> 비밀번호 재설정 메일 보내기
							</button>
						</form>
					</div>
				</div>

			</div>
		</div> --%>

</security:authorize>
<!-- 로그인 후! -->

<security:authorize access="isAuthenticated()">
	<nav class="navbar navbar-inverse">

		<div class="f-left">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH	JOB</a>
		</div>

		<div class="f-right nav-btn-1">

			<div class="dropdown col-xs-6 f-right" >

				<div class="dropdown-toggle cursorOn" data-toggle="dropdown"> <span	class="glyphicon glyphicon-user"></span> User <span class="caret"></span></div>
				<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">
					<li class="dropdown-header">내 정보</li>
					<li><a class="cursorOn" onclick="verifyRegularMemberForm()">정회원 인증</a></li>
					<li><a href="#pwModifyModal" data-toggle="modal">비밀번호 수정</a></li>
					<li role="presentation" class="divider"></li>
					<li class="dropdown-header">활동내역</li>
					<li><a href="${pageContext.request.contextPath}/profile/reviews">기업리뷰 작성</a></li>
					<li><a href="${pageContext.request.contextPath}/profile/interviews">면접후기 작성</a></li>
					<li role="presentation" class="divider"></li>
					<li class="dropdown-header">관심정보</li>
					<li><a href="${pageContext.request.contextPath}/profile/follows">팔로잉 기업</a></li>
					<li><a href="${pageContext.request.contextPath}/profile/recent">최근 본 기업</a></li>
					 <li role="presentation" class="divider"></li>
				   <li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				</ul>
			</div>

		</div>

	</nav>

	<%-- 비밀번호 수정 모달 --%>
	<div class="modal fade" id="pwModifyModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 비밀번호 수정하기
					</h4>
				</div>

				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" method="post" id="pwModifyForm">
						<div class="form-group has-feedback">
							<input	type="email" class="form-control" id="signUpId"	value="${principal.username}" readonly>
							<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						<!-- 비밀번호 -->
						<div class="form-group has-feedback">
							<input type="password" class="form-control" name="password" placeholder="Password">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<!-- 비밀번호 확인  -->
						<div class="form-group has-feedback">
							<input type="password" class="form-control" name="passwordCheck"	placeholder="Retype password">
							<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
							<div id="checkMsg"></div>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> 비밀번호 수정
						</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</security:authorize>
