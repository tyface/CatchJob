<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 재설정 하기</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%-- <style>
.swal-overlay {
			  background-color: rgb(86,98,112);
			  }
</style> --%>
</head>
<body>
	<script type="text/javascript">
	swal({
	  title: '재설정 비밀번호를 입력해 주세요',
	  input: 'text',
	  confirmButtonText: '재설정하기',
	}).then(function(result) {
		var memberId = '${memberId}';
		var oauthId = '${oauthId}';
		$.ajax({
			type : "post",
			url : "passwordModify2",
			data : {
        password : result.value,
				memberId : memberId
       },
			success : function(data) {
		      swal({
		        type: 'success',
		        html: '재설정된 비밀번호는 : <strong>' + result.value + '</strong> 입니다.'
		      }).then(function() {
             location.href="${pageContext.request.contextPath}";
           });
      }
     });
      return false;
	})
	</script>
</body>
</html>
