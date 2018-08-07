<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 전! -->
<c:if test="${mberIndex == null}">

<nav class="navbar navbar-inverse">
  <div class="f-left">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
  </div>
  <div class="f-right nav-btn-1">
    <a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a>&nbsp;&nbsp;
    <a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a>
  </div>
</nav>

<%-- 로 그 인  Login --%>
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
            <span class="glyphicon glyphicon-off"></span> Login in with <b>Facebook</b></button>
              <button  id="btnLoginGoogle" class="btn btn-success btn-block">
              <span class="glyphicon glyphicon-off"></span> Login in with <b>Google</b></button>


 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login">
     <a id="naverIdLogin_loginButton" href="#">
        <img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" height="60">
     </a>
  </div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/naver-login-sdk-2.0.js"></script>
<script type="text/javascript">
   var url = "http://localhost:8081/catchjob";
   var naver_id_login = new naver_id_login(
         "l2e7IfACkCtDXVSFiwXY",
         url+"/naverlogin");
   var state = naver_id_login.getUniqState();
   naver_id_login.setButton("green", 5, 30);
   naver_id_login.setDomain(url);
   naver_id_login.setState(state);
   naver_id_login.setPopup();
   naver_id_login.init_naver_id_login();




/*    var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "l2e7IfACkCtDXVSFiwXY",
         callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/oauth/sample/callback.html",
         isPopup: false,
         loginButton: {color: "green", type: 3, height: 60}
      }
   );
   (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출
   naverLogin.init();

   (4-1) 임의의 링크를 설정해줄 필요가 있는 경우
   $("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

    (5) 현재 로그인 상태를 확인
   window.addEventListener('load', function () {
      naverLogin.getLoginStatus(function (status) {
         if (status) {
             (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다.
            setLoginStatus();
         }
      });
   });

    (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다.
   function setLoginStatus() {
      var profileImage = naverLogin.user.getProfileImage();
      var nickName = naverLogin.user.getNickName();
      $("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
      $("#gnbLogin").html("Logout");
      $("#gnbLogin").attr("href", "#");
       (7) 로그아웃 버튼을 설정하고 동작을 정의합니다.
      $("#gnbLogin").click(function () {
         naverLogin.logout();
         location.reload();
      });
   }
 */
</script>




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

   <%-- 회 원 가 입 Sign Up  --%>
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
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
    </div>

    <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>

    <ul class="nav navbar-nav navbar-right">
<!--        <li class="active"><a href="#">Home</a></li>
       <li><a href="#">Page 1</a></li>
       <li><a href="#">Page 2</a></li> -->
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-edit"></span> Edit <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">기업리뷰 작성</a></li>
          <li><a href="#">면접후기 작성</a></li>
        </ul>
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">계정</a></li>
          <li><a href="#">활동내역</a></li>
          <li><a href="#">관심정보</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
        </ul>
      </li>
    </ul>

  </div>
</nav>

</c:if>
