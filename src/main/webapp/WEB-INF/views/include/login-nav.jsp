<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication var="principal" property="principal"/>


<security:authorize access="isAnonymous()">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="f-left nav-logo">
		  	<a class="navbar-brand" href="${pageContext.request.contextPath}/" >
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="nav-logo-img"/>
					<span class="f-left">&nbsp;CATCH JOB</span>
				</a>
  	</div>

		<div class="top-search-div">
			<form  action="${pageContext.request.contextPath}/enterprise/search" id="top-search-form">
				<input type="text" placeholder="기업을 검색해 보세요" name="keyword" class="col-xs-10 jua-font"  data-placement="bottom" autocomplete="off" id="top-search-bar">
				<button type="submit" class="col-xs-1" id="top-search-btn">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
		</div>

	  <div class="f-right nav-btn-1">
	    <%-- <div class="col-xs-6 cursorOn myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</div> --%>
	    <div class="cursorOn myBtnLogin">Sign In</div>
	  </div>
	</div>
</nav>

  <!-- 로그인 모달 -->
  <div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialogs ">

      <!-- Modal content-->
      <div class="modal-contents">
        <div class="modal-headers" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
        </div>
        <div class="modal-body" >

          <form role="form" method="post" id="loginForm">
				<div class="form-group has-feedback">
					<input type="email" class="form-control form-text-height" id="loginId" placeholder="이메일 주소">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					 <input type="password" class="form-control form-text-height" id="loginPw" placeholder="비밀번호(8자리 이상)">
					 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
              <button type="submit" class="btn btn-catchjob btn-block"> 로그인</button>
          </form>

					<div class="form-group row">
						<br><center><p>- 또는 -</p></center><br>
						<button class="btn col-xs-12 facebookBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> 페이스북으로  로그인
						</button>
						<button class="btn col-xs-12 googleBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> 구글로 로그인 &nbsp;&nbsp;
						</button>
					</div>

        </div>
        <div class="modal-footer">
          <p>아직 회원이 아니세요? <a href="#myModalSignUp" class="blue-font" data-toggle="modal" id="loginHide">회원가입</a></p>
<!--           <p>Forgot  -->
          <p><span class="blue-font" onclick="passwordModifyForm()">비밀번호 찾기</span></p>
<!--           </p> -->

        </div>
      </div>
    </div>
  </div>

		<!-- 회원가입 모달 -->
		<div class="modal fade" id="myModalSignUp" role="dialog">
			<div class="modal-dialogs">

				<!-- Modal content-->
				<div class="modal-contents">
					<div class="modal-headers">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 회원가입
						</h4>
					</div>

					<div class="modal-body" >
						<form role="form" method="post" id="signUpForm">
							<div class="form-group has-feedback">
								<input	type="email" class="form-control form-text-height" id="signUpId"	placeholder="이메일 주소">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
								<!-- 비밀번호 -->
								<input type="password" class="form-control form-text-height" id="signUpPw" placeholder="비밀번호(8자리 이상)">
								 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
					        <div class="form-group has-feedback">
								<!-- 비밀번호 확인  -->
								<input type="password" class="form-control form-text-height" id="signUpPwCheck"	placeholder="비밀번호 확인">
								 <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
							</div>
							<button type="submit" class="btn btn-catchjob btn-block">
								 이메일로 가입
							</button>
							<!-- 회원가입 실패 시 보이는 창 -->
<!-- 							<div class="form-group has-error has-feedback hidden" -->
<!-- 								id="signUpFail"> -->
<!-- 								<div class="input-group"> -->
<!-- 									<span class="input-group-addon"> -->
<!-- 										<span class="glyphicon glyphicon-exclamation-sign"	aria-hidden="true"></span> -->
<!-- 									</span> -->
<!-- 									<input type="text" class="form-control" id="inputError" -->
<!-- 									aria-describedby="inputGroupSuccess1Status"	value="이메일 혹은 비밀번호가 유효하지 않습니다. 다시 시도하세요"> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</form>

						<div class="form-group row">
							<br><center><p>- 또는 -</p></center><br>

							<button class="btn col-xs-12 facebookBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> 페이스북으로 가입
							</button>
							<button class="btn col-xs-12 googleBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> 구글로 가입 &nbsp;&nbsp;
							</button>
						</div>

					</div>

					<div class="modal-footer">
						 <p>이미 회원이세요? <a  href="#loginModal" data-toggle="modal" id="signUpHide">로그인</a></p>
					</div>
				</div>

			</div>
		</div>

</security:authorize>
<!-- 로그인 후! -->

<security:authorize access="isAuthenticated()">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="f-left nav-logo">
		  	<a class="navbar-brand" href="${pageContext.request.contextPath}" >
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="nav-logo-img"/>
					<span class="f-left">CATCH JOB</span>
				</a>
	  	</div>

			<div class="top-search-div">
				<form  action="${pageContext.request.contextPath}/enterprise/search" id="top-search-form">
					<input type="text" placeholder="기업을 검색해 보세요" name="keyword" class="col-xs-10 jua-font"  data-placement="bottom" autocomplete="off" id="top-search-bar">
					<button type="submit" class="col-xs-1" id="top-search-btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>

			<div class="f-right nav-btn-1">
				<div class="dropdown f-right" >
					<div class="dropdown-toggle cursorOn" data-toggle="dropdown">
						<span class="glyphicon glyphicon-menu-hamburger top-nav-right-btn1"></span>
					</div>
					<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">
						<li class="dropdown-header">내 정보</li>
						<li><a class="cursorOn" onclick="verifyRegularMemberForm()">정회원 인증</a></li>
						<li><a href="#pwModifyModal" data-toggle="modal">비밀번호 수정</a></li>
						<li><a href="${pageContext.request.contextPath}/profile/reviews">마이페이지</a></li>
					 	<li role="presentation" class="divider"></li>
			   		<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					</ul>
				</div>

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

<script>
if(window.location.pathname != "/"){
	if(window.innerWidth < 840){
			$(".navbar-brand > span").css("display","none");
	}
	$(".top-search-div").css("display","inline-block");
}
$(function() {

	topSearchValidation()
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

function topSearchValidation(){
	/* 유효성검사  */
		$('#top-search-form').validate({
			/* 규칙 */
			rules : {
				keyword:{
					required : true,
					laxEmail : true,
				}
			},
			/* 규칙 어길 때, 메시지 */
			messages : {
				keyword:{
					required : "필수로입력하세요",
				}
			},
			focusInvalid: true,
			focusCleanup: true,
			onkeyup: false,
			/* 규칙 어길 때, 툴팁 띄우기  */
			showErrors: function(errorMap, errorList) {
							// Clean up any tooltips for valid elements
							$.each(this.validElements(), function (index, element) {
									var $element = $(element);

									$element.data("title", "") // Clear the title - there is no error associated anymore
											.removeClass("error")
											.tooltip("destroy");
							});
							// Create new tooltips for invalid elements
							$.each(errorList, function (index, error) {
									var $element = $(error.element);

									$element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
											.data("title", error.message)
											.addClass("error")
											.tooltip(); // Create a new tooltip based on the error messsage we just set in the title
							});
				},
					/* 규칙 맞으면, 실행됨 */
			 submitHandler: function(form) {
					var $keyword = $('#top-search-bar').val();
					$keyword = $keyword.replace(/ /gi, "");
					$('#top-search-bar').val($keyword);
					form.submit();
			}

		});
		/* validate-plugin 사용시, 추가로 사용자가 사용할 메서드 선언 */
			jQuery.validator.addMethod("laxEmail", function(value, element) {
			var result = value.replace(/ /gi, "");
			return this.optional( element ) || /^[a-zA-Z가-힇0-9]{1,}$/.test(result);
		 }, '올바른 언어(영어/한글)로 입력했는지 확인해 보세요.');
}
</script>
