<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>비밀번호 재설정 하기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sweetalert.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<%-- <style>
.swal-overlay {
			  background-color: rgb(86,98,112);
			  }
</style> --%>
</head>
<body>
	<script type="text/javascript">
		swal({
			title: '재설정 비밀번호를 \n\r입력해 주세요',
			type: 'input'

		},function(inputValue) {
			var memberId = '${memberId}';
			var oauthId = '${oauthId}';
			$.ajax({
				type : "post",
				url : "passwordModify2",
				data : {
	        password : inputValue,
					memberId : memberId,
					oauthId : oauthId
	      },
				dataType : "json",
				success : function(data) {
						if(data.result){
							swal({
								title:"",
								type: 'success',
								text:'재설정된 비밀번호는 : ' + inputValue + ' 입니다.',
				        confirmButtonClass: "btn-success"
				      },function() {
		             location.href="${pageContext.request.contextPath}";
		          });
						}else{
							swal({
								title:"",
				        type: 'danger',
				        text: '비밀번호 재설정 실패 메일을 다시 받아주세요.',
								confirmButtonClass: "btn-danger"
				      },function() {
		             location.href="${pageContext.request.contextPath}";
		          });
						}
	      }
	     });
	     return false;
		})
	</script>

</body>
</html>
