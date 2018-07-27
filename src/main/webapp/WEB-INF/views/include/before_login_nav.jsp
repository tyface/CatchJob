<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>


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
        	 <button  id="btnLogin" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login in with <b>Facebook</b></button>
        	  <button  id="btnLogin" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login in with <b>Google</b></button>
        	</div>
        
          <form role="form">
            <div class="form-group">
              <label for="mberId"><span class="glyphicon glyphicon-user"></span> Email Address</label>
              <input type="email" class="form-control" id="mberId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="mberPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="mberPw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" id="btnLogin" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
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
   
    $("#btnLogin").on("submit",function() {
    	var d = $(this).serialize();//이벤트가 발생한 요소 this
		//윗줄 : member?memberForm&userid = "홍길동"&pw = "123"&email=email.gmail.com
		alert("d : " + d);
        $.ajax({
            type:"POST",
            url:"/catchjob/login",
			dataType:"json",
         /*    success:function(result){                    
                if (result.result == '1') { // 로그인 성공시 
                    $("#myModalLogin").modal("hide");
                   // location.href = "${contextPath}/";
                } else { //로그인 실패시 
                    $(".warning").text(result.msg);
                    //'아이디나 비번이 틀립니다' 문구 출력 후 바로 창이 닫힘
                }
            },
            error:function(xhr, status, error) {
                console.log(xhr.status + " : " + error + " : " + xhr.responseText);
            } */
        });
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
        	
        
          <form role="form">
            <div class="form-group">
              <label for="mberId"><span class="glyphicon glyphicon-user"></span> Email Address</label>
              <input type="email" class="form-control" id="mberId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="mberPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="mberPw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
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


</body>
</html>