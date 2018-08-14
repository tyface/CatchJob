<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/late/fontawesome-stars.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>



<script>
$(function(){
	$('.stars').barrating({
	    theme: 'fontawesome-stars',
	   	onSelect: function(value, text, event){
	    	     // alert(value);
	    	      $("#evaluationScore").text(value);	    	      
	    	      $("#hiddenEvaluationScore").val(value);
	    	      

	    	      
	    }
	});
	 $("#update-btn").on("click",function(){
		 $("#writeForm").submit(); 
		 alert("수정되었습니다^^")
	 });
})
function updateForm(num, questionNum){
	//alert("수정!"+num+questionNum)
	$.ajax({
		url:"${pageContext.request.contextPath}/profile/reviewForm",
		type: 'get',
		data: {"entIndex": num, 
			"questionNum":questionNum},
		dataType: "json",
		success: function(review){
			var evaluationScore = review.evaluationScore;
			//alert("성공~evaluationScore:"+evaluationScore+"만족도:");
			$("#entName").val(review.entName);
			$("#question").val(review.question);
			$("#evaluationScore").text(evaluationScore);
			$("#contents").text(review.contents);
			$("#hiddenQuestionNum").val(review.questionNum);
			$("#hiddenEntIndex").val(review.entIndex)			
			$('#stars').barrating('set', evaluationScore);
		},
		error: function(request, status, error){
			alert("실패~");
		}
	});
	
	$("#myModal").modal();
}
function deleteReview(entIndex,questionNum){
	//alert("삭제하시겠습니까?");
	var msg ="삭제하시겠습니까?";
	if(confirm(msg)!=0){
		//Yes click
		$.ajax({
			url:"${pageContext.request.contextPath}/profile/deleteReview",
			data: {"entIndex":entIndex,
				"questionNum":questionNum},
// 			data:"json",
			type:"post",
			success  : function(data){
				//alert("삭제됨data:"+data);
				if(data){
					alert("삭제되었습니다.");
					window.location.reload();
				}else{
					alert("삭제실패!");
				}
			},
			error : function(request,status,error){
				alert("request :" + request + "\n"+
						"status :" + status + "\n"+
						"error :" + error);
			}
			
		})
	}else{
		//No click
	}
}
</script>


<article class="container">
	<div class="module">
	  <h2>리뷰 코멘트</h2>
	  <p>The .table-responsive class creates a responsive table which will scroll horizontally on small devices (under 768px). When viewing on anything larger than 768px wide, there is no difference:</p>                                                                                      
	  <div class="table-responsive">          
	  <table class="table">
	    <thead>
	      <tr>
<!-- 	        <th>#</th> -->
	        <th>기업명</th>
	        <th>질문내용</th>
	        <th>작성일</th>  
	        <th>
	        	수정 / 삭제
	        </th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach  items="${reviewList}" var="reviewList" varStatus="status">
		      <tr>
<%-- 		        <td>${status.index}</td> --%>
		        <td><a class="non-line" onclick="location.href='${pageContext.request.contextPath}/enterprise/view?entIndex=${reviewList.entIndex}'">${reviewList.entName}</a></td>
		        <td>${reviewList.question}</td>
		        <td>${reviewList.regDate}</td>
		        <td>
		        	<a class="update non-line" onclick="updateForm(${reviewList.entIndex},${reviewList.questionNum})">수정  </a> |
		        	<%-- <a class="delete" onclick="doDelete(${viewData.entIndex})">삭제</a> --%>
		        	<a class="delete non-line" onclick="deleteReview(${reviewList.entIndex},${reviewList.questionNum})">삭제  </a>
	<%-- 	        	<a class="delete" onclick="location.href='${pageContext.request.contextPath}/profile/deleteReview?entIndex=${reviewList.entIndex}&questionNum=${reviewList.questionNum}'">삭제</a> --%>
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
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/profile/updateReview" id="writeForm" method="post">
				<input type="hidden" name="entIndex" id="hiddenEntIndex" >
				<input type="hidden" name="questionNum" id="hiddenQuestionNum" >
				<input type="hidden" name="evaluationScore" id="hiddenEvaluationScore" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">면접후기 수정</h4>
				</div>
				<div class="modal-body">
					<!-- 리뷰 코멘트/ 기업명 -->
					<div class="form-group">
						<label>기업명</label> 
						<input type="text" class="form-control" id="entName" name="entName"	 readonly="readonly">
					</div>
					<!-- 리뷰 코멘트/ 질문내용 -->
					<div class="form-group">
						<label>질문내용</label>
						<input type="text" class="form-control" id="question" name="question"	 readonly="readonly">
					</div>
					<!-- 리뷰 코멘트/ 만족도  -->
					<div class="form-group">
						<label>만족도</label>
						<div>
							<select class="stars" id="stars">
							    <option value="1">1</option>
							    <option value="2">2</option>
							    <option value="3">3</option>
							    <option value="4">4</option>
							    <option value="5">5</option>
							</select>
							<output for="star-input" >
								<b id="evaluationScore" >0</b> 점
							</output>

					</div>
					</div>
					<!-- 리뷰 코멘트/ 내용 -->
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="2" name="contents" id="contents"></textarea> 
						<!-- <input type="text" class="form-control" id="contents" name="contents"	 > -->
					</div>
	
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-infofault" id="update-btn">제출</button>
					<!-- data-dismiss="modal" -->
				</div>
			</form>
		</div>

	</div>
</div>

   
<jsp:include page="include/footer.jsp" flush="true" />