<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>


<!-- 로그인 전! -->
<c:if test="${mberId == null}">
   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CATCH JOB</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" id="myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#" id="myBtnLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      
    </ul>
  </div>
</nav>



<%-- 로 그 인  Login --%>
<div class="container">
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
            <button  id="btnLoginFacebook" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login in with <b>Facebook</b></button>
             <button  id="btnLoginGoogle" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login in with <b>Google</b></button>
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
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password</a></p>
        </div>
      </div>
    </div>
  </div> 
</div>

   <script> 
$(document).ready(function(){
	 $("#myBtnLogin").click(function(){
         $("#myModalLogin").modal("show");
      });

    $("#loginForm").on("submit",function() {
         $.ajax({
            type:"post",
            url:"${contextPath}/login",
            data : {"mberId":$("#loginId").val(), "mberPw":$("#loginPw").val()},
         dataType:"json",
            success:function(data){ 
                  if(data.result){   
                $("#myModalLogin").modal("hide");
                window.location.reload();
             } else {
                alert("비밀번호를 다시 입력해 주세요");
             }
            },
         error:function(request, status, error){
            alert("아이디를 다시 입력해 주세요")
         }
         });
         return false;
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
        
          <form role="form" method="post">
            <div class="form-group">
              <label for="signUpId"><span class="glyphicon glyphicon-user"></span> Email Address</label>
              <input type="email" class="form-control" id="signUpId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="signUpPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <!-- 비밀번호 -->
              <input type="password" class="form-control" id="signUpPw" placeholder="Enter password"><br>
              <!-- 비밀번호 확인  -->
               <input type="password" class="form-control" id="signUpPwCheck" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign UP</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>회원이십니까? <a href="#">Login</a></p>
         
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
    $("#myBtnSignUp").click(function(){
        $("#myModalSignUp").modal();
    });
});
</script>   
</c:if>

<!-- 로그인 후! -->
<c:if test="${mberId != null}">
   

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CATCH JOB</a>
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
          <li><a href="${contextPath}/logout">로그아웃</a></li>
        </ul>
      </li>
    </ul>
   
  </div>
</nav>

</c:if> 