
/* 비밀번호 재설정 메일 보내기창 */
function passwordModifyForm() {
	$('#loginModal').modal('hide');
	swal({
		title: "비밀번호 재설정하기",
		text: "입력하신 메일로 비밀번호 변경하기 \n\r링크가 전송됩니다.",
		type: "input",
		inputPlaceholder: "email",
		showCancelButton: true,
		closeOnConfirm: false,
		showLoaderOnConfirm: true
	}, function (inputValue) {
		if (inputValue === "") {
    	swal.showInputError("이메일을 입력해주세요");
    	return false
  	}

		$.ajax({
			 type : "get",
			 url : contextPath+"/member/findPasswordMail",
			 data : {
					"email" : inputValue
			 },
			 dataType : "json",
			 success : function(data) {
					if (data.result) {
						swal({
							title:"메일전송 완료!",
							text:"입력하신 이메일로 비밀번호 재설정 링크를 보냈습니다.",
							type: "success",
							confirmButtonClass: "btn-success"
						})
					} else {
						swal({
							title:"비밀번호 재설정에 실패하였습니다.",
							type: "warning",
							confirmButtonClass: "btn-warning"
						})
					}
			 },
			 error : function() {
				 swal({
					 title:"비밀번호 재설정에 실패하였습니다.",
					 type: "warning",
					 confirmButtonClass: "btn-warning"
				 })
			 }
		})
	})
}

/* 정회원 인증 창 */
function entVerifyForm() {
	swal({
		title: "정회원 인증방법",
		text: "1) 명함이나 재직증명서로 인증하기　　\n\r"
          + "관리자 이메일 : catchjob33@gmail.com\n\r\n"
          + "2) 회사 이메일로 인증하기　　　　　　",
		type: "input",
		inputPlaceholder: "email",
		showCancelButton: true,
		closeOnConfirm: false,
		showLoaderOnConfirm: true
	}, function (inputValue) {

		if (inputValue === "") {
    	swal.showInputError("이메일을 입력해주세요");
    	return false
  	}

		$.ajax({
			 type : "get",
			 url : contextPath+"/member/findPasswordMail",
			 data : {
					"email" : inputValue
			 },
			 dataType : "json",
			 success : function(data) {
					if (data.result) {
						swal({
							title:"이메일 전송 완료",
							text:"입력하신 이메일로 비밀번호 재설정 링크를 보냈습니다.",
							type: "success",
							confirmButtonClass: "btn-success"
						})
					} else {
						swal({
							title:"비밀번호 재설정에 실패하였습니다.",
							type: "warning",
							confirmButtonClass: "btn-warning"
						})
					}
			 },
			 error : function() {
				 swal({
					 title:"비밀번호 재설정에 실패하였습니다.",
					 type: "warning",
					 confirmButtonClass: "btn-warning"
				 })
			 }
		})
	})
}
