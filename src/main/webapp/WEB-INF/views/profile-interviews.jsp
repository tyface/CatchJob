<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true" />
<link href="${pageContext.request.contextPath}/resources/css/enterprise.css" rel="stylesheet">
<!-- jQuery Validation 플러그인을 이용하여 손쉽게 검증하기 -->
<%-- <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/dist/additional-methods.min.js"></script> --%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/messages_ko.min.js"></script>

<script>
$(function(){

	//alert("INTRVW_EXPRNC:" + INTRVW_EXPRNC);
/* 	$(".update").on("click",function(){
		alert("선택된 기업요소: "+$(this).children().val());
		 $.ajax({
			url:"updateInterviewForm",
			data:{"entIndex":$(this).children().val()},
			dataType:"json",
			success: function(){
				alert("성공");				
			},
			error : function(reauest, status, error){
				alert("실패");
			}
			
		}) 
		$("#hiddenEntIndex").val($(this).children().val());
		modal();
		$("#myModal").modal();
	});
	 */
	 interviewValidation(); //인터뷰 유효성 검사 부분
	 

  
		
		 
})

function doUpdate(num){
	 //alert("num: "+num);
	 
	$.ajax({	
		url:"${pageContext.request.contextPath}/profile/interviewForm",
		type:"get",
		//url : "form",
		data : {"entIndex": num},
		dataType: 'json',
		success: function(data){
			//alert("성공~"+data);
				$("#entName").val(data['entName']);
				$("#intrvwReview").val(data['intrvwReview']);
				$("#intrvwQuestion").val(data['intrvwQuestion']);
				$("#intrvwAnswer").val(data['intrvwAnswer']);
				$("#intrvwDate").val(data['intrvwDate']);
				$("#presentationDate").val(data['presentationDate']);
				$("#hiddenEntIndex").val(data['entIndex']);
				
				var INTRVW_DFFLY = data['intrvwDifficulty']+"";				
				var INTRVW_RESULT = data['intrvwResult']+"";	//면접결과
				var INTRVW_ROUTE = data['intrvwRoute']+"";		//면접난이도
				var INTRVW_EXPRNC = data['intrvwExperience']+"";//면접경험 			 
			 
				$("#intrvwDifficulty").find('option[value="'+INTRVW_DFFLY+'"]').prop('selected', true);
				$("#intrvwResult").find('option[value="' + INTRVW_RESULT + '"]').prop('selected', true);
				$("#intrvwRoute").find('option[value="' + INTRVW_ROUTE + '"]').prop('selected', true);
				$("#optionsRadios" + INTRVW_EXPRNC).prop('checked', true); 
				//alert(data['entName']);
			
		}, 
		error: function(request, status, error){
			alert("실패~");
		}
	});

	$("#myModal").modal();
}
/* 면접후기 삭제 */
function doDelete(entIndex){
	swal({
	  title: "삭제하시겠습니까?",
	  text: "Once deleted, you will not be able to recover this file!",
	  type: "info",
	  showCancelButton: true,
	  confirmButtonClass: "btn-info",
	  confirmButtonText: "Yes, delete it!",
	  closeOnConfirm: false,
	},
	function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/profile/deleteInterview",
			type:"post",
			data: {"entIndex": entIndex},
			success: function(result){
				if(result){
					swal({
						title:"Deleted!", 
						text:"Your imaginary file has been deleted.", 
						type:"success",
						confirmButtonClass: "btn-success",
						showCancelButton: false
						}, 
						function(){
							location.reload();
						});
					
				}else{
					swal("Cancelled", "Your imaginary file is safe :)", "error");						
				}
			}
		})
	});
// 	.then((willDelete) => {
// 		if(willDelete){
// 			$.ajax({
// 				url: "${pageContext.request.contextPath}/profile/deleteInterview",
// 				type:"post",
// 				data: {"entIndex": entIndex},
// 				success: function(result){
// 					if(result){
// 						swal("Deleted!", "Your imaginary file has been deleted.", "success").then(
// 						   function(){ 
// 						       location.reload();
// 						   })						
// 					}else{
// 						swal("Cancelled", "Your imaginary file is safe :)", "error");						
// 					}
// 				}
// 			})
// 		}else{
// 			swal("Cancelled", "취소누름)", "error");						
// 		}
			
// 	});

			
}


function interviewValidation(){
	 /* 면접후기 작성시 유효성 검사 */
	$('#updateInterview').validate({		
		rules : {
			
			intrvwDifficulty:{
				required : true
			},
			intrvwDate:{
				required : true,
				date: true
			},
			intrvwRoute:{
				required : true
			},
			intrvwReview:{
				required : true,
				minlength : 10,	
				maxlength : 500
			},
			intrvwQuestion:{
				required : true,
				minlength : 10,	
				maxlength : 500				
			},
			intrvwAnswer:{
				required : true,
				minlength : 10,	
				maxlength : 500				
			},
			presentationDate:{
				digits: true				
			}
		},
		
		messages : {
			
			intrvwDifficulty:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwDate:{
//				required : "필수로입력하세요"
			},
			intrvwRoute:{
				required : "다른 항목을 선택해주세요"
			},
			intrvwReview:{
//				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다",	
				maxlength : "최대 500글자까지 입력할 수 있습니다"	
			},
			intrvwQuestion:{
//				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다"	,	
				maxlength : "최대 500글자까지 입력할 수 있습니다"				
			},
			intrvwAnswer:{
//				required : "필수로입력하세요",
				minlength : "최소 10글자이상이어야 합니다"	,	
				maxlength : "최대 500글자까지 입력할 수 있습니다"				
			}			
		}
		,
		submitHandler: function(form) {
			swal({
				title:"Update", 
				text: "You clicked the button!", 
				type: "success",
				confirmButtonClass: "btn-success",

			},
			function(){
				form.submit();
			})		
			
		}
		
	});	
}
</script>
<jsp:include page="include/profile-article.jsp" flush="true" />

<article class="container non-padding-top">
	<div class="contents-wrap">
	
	  <h2>면접후기</h2>
	  <div class="table-responsive">          
	  <table class="table table-hover text-center mypage-table-width">
	    <thead>
	      <tr>
	<!--         <th>#</th> -->
	        <th>기업명</th>
	        <th>면접결과</th>
	        <th>작성일</th>
	<!--         <th>등록여부</th> -->
	        <th>
	        	수정 | 삭제
	        </th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach  items="${viewData}" var="viewData" varStatus="status">
		      <tr>
		        <td><span class="blue-font" onclick="location.href='${pageContext.request.contextPath}/enterprise/view?entIndex=${viewData.entIndex}'">${viewData.entName}</span></td>
		        <td>${viewData.intrvwResult}</td>
		        <td>${viewData.regDate}</td>
		        <td>
		        	<span class="update blue-font" onclick="doUpdate(${viewData.entIndex})">수정  </span> |
		        	<span class="delete blue-font" onclick="doDelete(${viewData.entIndex})">삭제</span>
		        </td>
		      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
	  </div>
	
	</div>
</article>
<!--  <button type="button" class="btn btn-info" id="myBtn">수정</button>
<button type="button" class="btn btn-info" id="">삭제</button>

 -->


<!-- Modal ----------------------------------------------------------------------------------------------------------------------------- -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/profile/updateInterview" id="updateInterview" method="post">
				<input type="hidden" name="entIndex" id="hiddenEntIndex" > 
				<div class="modal-header cat-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">면접후기 수정</h4>
				</div>
				<div class="modal-body ">

					<div class="row form-group">
						<div class="col-xs-3">
							<label>기업명</label> 
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="entName" name="entName"
								 readonly="readonly">
						</div>						
					</div>
					<!-- 면접난이도 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접난이도</label> 
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwDifficulty" id="intrvwDifficulty">
								<option value="">면접난이도</option>
								<option value="1">매우 쉬움</option>
								<option value="2">쉬움</option>
								<option value="3">보통</option>
								<option value="4">어려움</option>
								<option value="5">매우 어려움</option>
							</select>
						</div>
					</div>
					
					<!--면접일자 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접일자</label>
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control pull-right" name="intrvwDate" id="intrvwDate">
						</div>
					</div>
					<!-- 면접경로 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접경로</label> 
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwRoute" id="intrvwRoute">
								<option value="">면접경로</option>
								<option value="1">공채</option>
								<option value="2">온라인지원</option>
								<option value="3">직원추천</option>
								<option value="4">헤드헌터</option>
								<option value="5">학교 취업지원센터</option>
								<option value="6">기타</option>
							</select>
						</div>
					</div>
					<!--면접후기// 면접에서 채용까지의 과정 요약 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접에서 채용까지의 과정 요약</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwReview" id="intrvwReview"
							 placeholder="최대한 자세하게 작성해주세요. 최초 연락부터 인터뷰 횟수, 분위기, 면접관의 특징, 면접 팁 등"></textarea>
						</div>
					</div>
					<!-- 면접질문 입력하기 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접질문 입력하기</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwQuestion" id="intrvwQuestion" 
							placeholder="조별 주제, 개별 과제, 대면 질문 등 가장 어려웠던 질문을 정확하고 구체적으로 작성해 주세요."></textarea>
						</div>
					</div>
					<!-- 면접에 대한 답변 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>작성한 면접질문에 대한 답변을 입력하세요.</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="3" name="intrvwAnswer" id="intrvwAnswer"
							 placeholder="작성한 면접질문에 대한 답변을 입력하세요."></textarea>
						</div>
					</div>

					
					<!-- 면접결과 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>이 기업에 합격하셨나요?</label> 
						</div>
						<div class="col-xs-9">
							<select class="form-control" name="intrvwResult" id="intrvwResult">
								<option value="">기업에 합격하셨나요?</option>
								<option value="1">합격</option>
								<option value="2">불합격</option>
								<option value="3">대기중</option>
								<option value="4">합격했으나 취업하지 않음</option>
							</select>
						</div>
					</div>
					<!-- 면접일자/발표시기  -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>발표시기</label>
						</div>
						<div class="col-xs-9">
							<div class="row">
								<div class="col-sm-11">
									<input type="text" class="form-control" name="presentationDate"
										id="presentationDate">
								</div>
								<div class="col-sm-1">
									<p>일</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 면접경험 radio...........intrvwExperience-->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>면접 경험 </label>
						</div>
						<div class="col-xs-9">
							<div class="radio">
								<label> <input type="radio" name="intrvwExperience"
									id="optionsRadios1" value="1">부정적
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="intrvwExperience"
									id="optionsRadios2" value="2">보통
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="intrvwExperience"
									id="optionsRadios3" value="3">긍정적
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn cat-header" id="update-btn">제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>

<jsp:include page="include/footer.jsp" flush="true" />
