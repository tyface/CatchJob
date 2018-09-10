
/*페이지네 스크롤 위치 이동*/
function fnMove(seq){
        var offset = $(seq).offset();
				var topNavHeight = 100; //상단 네비 길이
        $('html, body').animate({scrollTop : offset.top - topNavHeight}, 600);
}

/* 비밀번호 재설정 메일 보내기창 */
function passwordModifyForm() {
	$('#loginModal').modal('hide')
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
    	swal.showInputError("이메일을 입력해주세요")
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
function verifyRegularMemberForm() {
	swal({
		title: "정회원 인증방법\n\r",
		text: "1) 명함이나 재직증명서로 인증하기　　\n\r"
          & "관리자 이메일 : catchjob33@gmail.com\n\r\n"
          & "2) 회사 이메일로 인증하기　　　　　　",
		type: "input",
		inputPlaceholder: "email",
		showCancelButton: true,
		showLoaderOnConfirm: true,
		closeOnConfirm: false
	}, function (inputValue) {
		if (inputValue === false) return false
		if (inputValue === "") {
    	swal.showInputError("이메일을 입력해주세요")
			return false
  	}

		$.ajax({
			 type : "get",
			 url : contextPath+"/member/regularMemberMail",
			 data : {
					"email" : inputValue
			 },
			 dataType : "json",
			 success : function(data) {

					if (data.result == "CODE_01") {
						swal({
							title:"이메일 전송 완료",
							text:"입력하신 이메일로 비밀번호 재설정 링크를 보냈습니다.",
							type: "success",
							confirmButtonClass: "btn-success"
						})
					} else if(data.result == "CODE_02"){
						swal({
							title:"회사 이메일만 인증 가능합니다.",
							type: "warning",
							confirmButtonClass: "btn-warning"
						})
					} else if(data.result == "CODE_03"){
						swal({
							title:"이메일 전송 실패, 이메일주소를 확인하여 주세요",
							type: "error",
							confirmButtonClass: "btn-danger"
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

Paging = function(totalCnt, dataSize, pageSize, pageNo, token){
	 totalCnt = parseInt(totalCnt);// 전체레코드수
	 dataSize = parseInt(dataSize); // 페이지당 보여줄 데이타수
	 pageSize = parseInt(pageSize); // 페이지 그룹 범위 1 2 3 5 6 7 8 9 10
	 pageNo = parseInt(pageNo); // 현재페이지
	 var html = new Array();
	 if(totalCnt == 0){
		  return "";
 	 }

	 // 페이지 카운트
	 var pageCnt = totalCnt % dataSize;

	 if(pageCnt == 0){
		 pageCnt = parseInt(totalCnt / dataSize);
	 }else{ pageCnt = parseInt(totalCnt / dataSize) + 1;
	 }

	 var pRCnt = parseInt(pageNo / pageSize);
	 if(pageNo % pageSize == 0){
		 pRCnt = parseInt(pageNo / pageSize) - 1;
	 }

	 //이전 화살표
	 if(pageNo > pageSize){
		 var s2;
		 if(pageNo % pageSize == 0){
			 s2 = pageNo - pageSize;
		 }else{ s2 = pageNo - pageNo % pageSize;
		 }
		 html.push('<a href=javascript:goPaging_' + token + '("');
		 html.push(s2); html.push('");>');
		 html.push('◀'); html.push("</a>");
	 }else{
		 html.push('<a href="#">\n');
		 html.push('◀');
		 html.push('</a>');
	 }

	 //paging Bar
	 for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){
		 if(index == pageNo){
			 html.push('<strong>');
			 html.push(index);
			 html.push('</strong>');
		 }else{
			 html.push('<a href=javascript:goPaging_' + token + '("');
			 html.push(index);
			 html.push('");>');
			 html.push(index);
			 html.push('</a>');
		 }

		 if(index == pageCnt){
			 break;
		 }else
		 html.push('|');
	 }

	 //다음 화살표
	 if(pageCnt > (pRCnt + 1) * pageSize){
		 html.push('<a href=javascript:goPaging_' + token + '("');
		 html.push((pRCnt + 1)*pageSize+1);
		 html.push('");>');
		 html.push('▶');
		 html.push('</a>');
	 }else{
		 html.push('<a href="#">');
		 html.push('▶');
		 html.push('</a>');
	 }
	 return html.join("");
 };
