<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${mberIndex == null}">

<nav class="navbar navbar-inverse">
  <div class="f-left">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
  </div>
  <div class="f-right nav-btn-1">
    <div class="col-xs-6"><a href="#" id="myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></div>
    <div class="col-xs-6"><a href="#" id="myBtnLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>
  </div>
</nav>

  <!-- Modal -->
  <div class="modal fade" id="myModalLogin" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <div class="form-group">
            <button  id="btnLoginFacebook" class="btn btn-success btn-block">
              <span class="glyphicon glyphicon-off"></span> Login in with <b>Facebook</b>
            </button>
            <button  id="signinButton"
              class="g-signin"
              data-callback="signinCallback"
              data-clientid="179069955047-28grth32od8hr7j9uiis6b8qrbgovb72.apps.googleusercontent.com"
              data-cookiepolicy="single_host_origin"
              data-requestvisibleactions="http://schemas.google.com/AddActivity"
              data-scope="https://www.googleapis.com/auth/plus.login">
            </button>
			    </div>

          <form role="form" method="post" id="loginForm">
            <div class="form-group">
              <label for="loginId"><span class="glyphicon glyphicon-user"></span> Email Address</label>
              <input type="email" class="form-control" id="loginId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="loginPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="loginPw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#myModalSignUp" data-toggle="modal" id="loginHide">Sign Up</a></p>
          <p>Forgot <a href="#">Password</a></p>
        </div>
      </div>
    </div>
  </div>


<script>
   $(document).ready(function() {
      $("#myBtnLogin").click(function() {
         $("#myModalLogin").modal("show");
      });

       $("#loginHide").click(function(){
              $("#myModalLogin").modal("hide");
          });

      $("#loginForm").on("submit", function() {
         $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/login",
            data : {
               "mberId" : $("#loginId").val(),
               "mberPw" : $("#loginPw").val()
            },
            dataType : "json",
            success : function(data) {
               if (data.result) {
                  $("#myModalLogin").modal("hide");
                  window.location.reload();
               } else {
                  alert("비밀번호를 다시 입력해 주세요");
               }
            },
            error : function() {
               alert("아이디를 다시 입력해 주세요")
            }
         });
         return false;
      });
      //모달 초기화
      $('.modal').on('hidden.bs.modal', function (e) {
          $(this).find('form')[0].reset()
      });
   });
</script>


   <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModalSignUp" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Sign Up</h4>
        </div>

        <div class="modal-body" style="padding:40px 50px;">
            <div class="form-group">
               <button  id="btnSignUpFacebook" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Continue with <b>Facebook</b></button>
                <button  id="btnSignUpGoogle" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Continue with <b>Google</b></button>
           </div>
          <form role="form" method="post" id="signUpForm">
            <div class="form-group">
              <label for="signUpId"><span class="glyphicon glyphicon-user"></span> Email Address</label>
              <input type="email" class="form-control" id="signUpId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="signUpPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <!-- 비밀번호 -->
              <input type="password" class="form-control" id="signUpPw" placeholder="Enter password">
              <span style="line-height:50%"><br></span>
              <!-- 비밀번호 확인  -->
               <input type="password" class="form-control" id="signUpPwCheck" placeholder="Enter password">
            </div>
           <!-- 회원가입 실패 시 보이는 창 -->
         <div class="form-group has-error has-feedback hidden" id="signUpFail">
              <div class="input-group">
                <span class="input-group-addon">
                   <span class = "glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                   </span>
                <input type="text" class="form-control" id="inputError" aria-describedby="inputGroupSuccess1Status"
                value="이메일 혹은 비밀번호가 유효하지 않습니다. 다시 시도하세요">
              </div>
           </div>
             <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
          </form>
        </div>

        <div class="modal-footer">
          <p> Member? <a href="#myModalLogin" data-toggle="modal" id="signUpHide">Login</a></p>

        </div>
      </div>

    </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $("#myBtnSignUp").click(function(){
        $("#myModalSignUp").modal("show");
    });

    $("#signUpHide").click(function(){
        $("#myModalSignUp").modal("hide");
    });

   $("#signUpForm").on("submit", function() {
      $.ajax({
         type : "post",
         url : "${pageContext.request.contextPath}/join",
         data : {
            "signUpId" : $("#signUpId").val(),
            "signUpPw" : $("#signUpPw").val(),
            "signUpPwCheck" : $("#signUpPwCheck").val()



         },
         dataType : "json",
         success : function(data) {
            if (data.result) {
               // 회원가입 성공
               alert("해당 이메일로 인증 메일이 발송되었습니다");
               $("#myModalSignUp").modal("hide");
               window.location.reload();
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

/*    페이스북
    $.ajaxSetup({ cache: true });
     $.getScript('https://connect.facebook.net/en_US/sdk.js', function(){
       FB.init({
         appId: '{2015281072116483}',
         version: 'v3.1'
       });
       $('#loginbutton,#feedbutton').removeAttr('disabled');
       FB.getLoginStatus(updateStatusCallback);
     });
      */

});
</script>
</c:if>

<!-- 로그인 후! -->
<c:if test="${mberIndex != null}">

  <nav class="navbar navbar-inverse">

    <div class="f-left">
      <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
    </div>

    <div class="f-right nav-btn-1">

      <div class="dropdown col-xs-6">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-edit"></span> Edit <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
          <li><a href="#">기업리뷰 작성</a></li>
          <li><a href="#">면접후기 작성</a></li>
        </ul>
      </div>

      <div class="dropdown col-xs-6">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
          <li><a href="#">계정</a></li>
          <li><a href="${pageContext.request.contextPath}/profile/interviews">활동내역</a></li>
          <li><a href="#">관심정보</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
        </ul>
      </div>

    </div>

  </nav>

</c:if>
<script type="text/javascript">
    (function() {
     var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
     po.src = 'https://apis.google.com/js/client:plusone.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
   })();

     function signinCallback(authResult) {

      if (authResult['access_token']) {
        console.log(authResult['access_token']);
        googleAuthToken = authResult['access_token'];
        gapi.auth.setToken(authResult); // 반환된 토큰을 저장합니다.
        getEmail();
        // 승인 성공
        // 사용자가 승인되었으므로 로그인 버튼 숨김. 예:
      } else if (authResult['error']) {
        alert('오류 발생: ' + authResult['error'])
        // 오류가 발생했습니다.
        // 가능한 오류 코드:
        //   "access_denied" - 사용자가 앱에 대한 액세스 거부
        //   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
        // console.log('오류 발생: ' + authResult['error']);
      }
    }

    function getEmail(){ // userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
      gapi.client.load('oauth2', 'v2', function() {
        var request = gapi.client.oauth2.userinfo.get();
        request.execute(getEmailCallback);
      });
    }
    function getEmailCallback(obj){
      var el = document.getElementById('email');
      var email = '';
      for (var field in obj) {
        console.log(obj[field]);
      }//for문으로 값이 뭐가 나오는지 일일이 확인
      email = 'Email: ' + obj['email'];
      alert(email)
      // el.innerHTML = email;
      // toggleElement('email');
    }


</script>
