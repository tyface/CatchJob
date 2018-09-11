<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/late/fontawesome-stars.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>

<%-- <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/dist/additional-methods.min.js"></script> --%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/messages_ko.min.js"></script>

<script>
$(function(){
	reviewValidation();
	$('.stars').barrating({
	    theme: 'fontawesome-stars',
	   	onSelect: function(value, text, event){
	    	      $("#evaluationScore").text(value);
	    	      $("#hiddenEvaluationScore").val(value);
	    }
	});
})
function updateForm(num, questionNum){
	$.ajax({
		url:"${pageContext.request.contextPath}/profile/reviewForm",
		type: 'get',
		data: {"entIndex": num,
			"questionNum":questionNum},
		dataType: "json",
		success: function(review){
			var evaluationScore = review.evaluationScore;
			$("#entName").val(review.entName);
			$("#question").val(review.question);
			$("#evaluationScore").text(evaluationScore);
			$("#contents").text(review.contents);
			$("#hiddenQuestionNum").val(review.questionNum);
			$("#hiddenEntIndex").val(review.entIndex)
		    $("#hiddenReviewFlag").val(review.reviewFlag)
		    $("#hiddenReviewIndex").val(review.reviewIndex)
			$('#stars').barrating('set', evaluationScore);
		},
		error: function(request, status, error){
			alert("실패~");
		}
	});

	$("#myModal").modal();
}
function deleteReview(entIndex,questionNum){

	swal({
		  title: "삭제하시겠습니까?",
		  type: "info",
		  showCancelButton: true,
		  confirmButtonClass: "btn-info",
		  confirmButtonText: "Yes, delete it!",
		  closeOnConfirm: false,
		},
		function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/profile/deleteReview",
				data: {"entIndex":entIndex,
					"questionNum":questionNum},
				type:"post",
				success: function(result){
					if(result){
						swal({
							title:"삭제되었습니다",
							type:"success",
							confirmButtonClass:"btn-success",
							showCancelButton: false
							},
							function(){
								location.reload();
							})

					}else{
						swal({
							title: "Cancelled",
							text: "Your imaginary file is safe :",
							type: "error",
							confirmButtonClass:"btn-error"
							})
					}
				}
			})
		});

}
function reviewValidation(){
	$('#writeForm').validate({
		rules : {

			stars:{
				required : true
			},
			contents:{
				required : true,
				minlength : 10,
				maxlength : 500
			}
		},

		messages : {
			stars:{
				required : "다른 항목을 선택해 주세요"
			},
			contents:{
				minlength : "최소 10 글자 이상이어야 합니다",
				maxlength : "최대 500 글자까지 입력할 수 있습니다"
			}
		}
		,
		submitHandler: function(form) {
			swal({
				title:"수정되었습니다", 
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
	  <h2 class="godo-font text-left p-01">리뷰 코멘트</h2>
	  <hr style="border: 1px solid #c7d5f8; padding: 0px;">
	  <div class="table-responsive">          
<!-- 	  <div class="table-responsive">           -->
	  <table class="table table-hover text-center mypage-table-width">
	    <thead>
	     <tr class="info">
	        <th>기업명</th>
	        <th>질문내용</th>
	        <th>작성일</th>
	        <th>
	        	수정 | 삭제
	        </th>

	      </tr>
	    </thead>
	    <tbody>
	    
	     <c:choose>
	    	<c:when test="${reviewList.size() > 0 }">
	    		<c:forEach  items="${reviewList}" var="reviewList" varStatus="status">
			      <tr>
			        <td><span class="blue-font" onclick="location.href='${pageContext.request.contextPath}/enterprise/view?entIndex=${reviewList.entIndex}'">${reviewList.entName}</span></td>
			        <td>${reviewList.question}</td>
			        <td>${reviewList.regDate}</td>
			        <td>
			        	<span class="update blue-font" onclick="updateForm(${reviewList.entIndex},${reviewList.questionNum})">수정  </span> |
			        	<span class="delete blue-font" onclick="deleteReview(${reviewList.entIndex},${reviewList.questionNum})">삭제  </span>
			        </td>
			      </tr>
		      </c:forEach>
	    	</c:when>
	    	<c:otherwise>
	    		 <tr>
	    		 	  <td colspan="4"><div class='well well-lg'>작성한 리뷰 코멘트가 없습니다</div></td>
	    		 </tr>
	    	</c:otherwise>
	    </c:choose>
	    
	    

	    </tbody>
	  </table>
	  </div>
	</div>


</article>



<!-- Modal ----------------------------------------------------------------------------------------------------------------------------- -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
	<div class="modal-content">
		<form action="${pageContext.request.contextPath}/profile/updateReview" id="writeForm" method="post">
        <input type="hidden" name="reviewIndex" id="hiddenReviewIndex" >
        <input type="hidden" name="entIndex" id="hiddenEntIndex">
          <input type="hidden" name="reviewFlag" id="hiddenReviewFlag">
				<input type="hidden" name="questionNum" id="hiddenQuestionNum" >
				<input type="hidden" name="evaluationScore" id="hiddenEvaluationScore" >
				<div class="modal-headers cat-header"> <!--  -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">면접후기 수정</h4>
				</div>
				<div class="modal-body">
					<!-- 리뷰 코멘트/ 기업명 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>기업명</label>
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="entName" name="entName"	 readonly="readonly">
						</div>
					</div>
					<!-- 리뷰 코멘트/ 질문내용 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>질문내용</label>
						</div>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="question" name="question"	 readonly="readonly">
						</div>
					</div>
					<!-- 리뷰 코멘트/ 만족도  -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>만족도</label>						
						</div>
						<div class="col-xs-9 stars01">
							<select class="stars" id="stars" name="stars" >
<!-- 								<option value="" >별점</option> -->
							    <option value="1">1</option>
							    <option value="2">2</option>
							    <option value="3">3</option>
							    <option value="4">4</option>
							    <option value="5">5</option>
							</select>
							<output for="star-input" class="stars02">
								<b id="evaluationScore" >0</b> 점
							</output>

						</div>
					</div>
					<!-- 리뷰 코멘트/ 내용 -->
					<div class="row form-group">
						<div class="col-xs-3">
							<label>내용</label>
						</div>
						<div class="col-xs-9">
							<textarea class="form-control" rows="2" name="contents" id="contents"  placeholder="기업리뷰를 추가로 입력해주세요."></textarea>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-catchjob" id="update-btn">제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>

<%@ include file="include/footer.jsp"%>