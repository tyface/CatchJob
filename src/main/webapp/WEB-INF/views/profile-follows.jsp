<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="include/header.jsp" flush="true" />
<script>
// var entIndex = ${followView[0].entIndex}
$(function(){
	//alert("실행됨");
	
	 $(".follow-btn").click(function (e) {
	      var $this = $(this).find("i");
	      var fa = $this.hasClass("fa");
	      
		  var entIndex = $this.next().val();
		  //alert(entIndex);
	      
		  if(confirm("팔로잉을 중단하시겠습니까?") != 0 ){
			  /* 팔로잉 기업 해지  */
			  $.ajax({
			  		url:"${pageContext.request.contextPath}/enterprise/revFollow",				  		
			  		data:{entIndex : entIndex},
			  		type: "post",
			  		dataType:"json",
			  		success: function(result){
			  			/* 성공 */
			  			 alert("팔로잉이 해제되었습니다.");
						 $this.toggleClass("fa-heart");
						 $this.toggleClass("fa-heart-o");
						 window.location.reload();
			  		}					  		
			  })					 
		  }	
	      
	});
	
});

</script>

<article class="container  ">
	<div class="contents-wrap ">

		<c:forEach begin="0" varStatus="status" end="9" var="follow" items="${followView}">
			<div class="row ent-list">
	
				<div class="col-sm-8">
					<div class="row">
						<a href="enterprise/view?entIndex=${follow.entIndex}" class="p25">${follow.entName}</a>
						<a href="#" class="follow follow-btn follow">
							<i class="fa fa-heart follow" id="follow"></i><!-- 123 -->
							<input type="hidden" value="${follow.entIndex}">							
						</a>
					</div>
					<div class="row visible-lg visible-md visible-sm">
						${follow.industryName} | ${follow.bcityName} ${follow.signguName}
					</div>
					<div class="row">
						<p class="p-1">평균연봉 ${follow.salaryAvg} 만원 </p>
					</div>
				</div>
	
				<div class="col-sm-4">
					<div class="row text-center">
						<c:forEach begin="1" end="${follow.evaluationAvg}" step="1">
							<span class="stars-on"></span>
						</c:forEach>
						<c:forEach begin="${follow.evaluationAvg}" end="4" step="1">
							 <span class="stars-off"></span>
						</c:forEach>
						<span class="ent-score">${follow.evaluationAvg}</span>
					</div>
					<div class="row">
						<div class="col-xs-6 text-center cell-1">
							<strong>${follow.reviewCount}</strong>
							<a href="${contextPath}/enterprise/view?entIndex=${follow.entIndex}#section2"><br>리뷰코멘트</a>
						</div>
						<div class="col-xs-6 text-center cell-2">
							<strong>${follow.interviewCount}</strong>
							<a href="${contextPath}/enterprise/view?entIndex=${follow.entIndex}#section3"><br>면접정보</a>
						</div>
					</div>
				</div>
	
			</div>
		</c:forEach>	 


	</div>
</article>

   
<jsp:include page="include/footer.jsp" flush="true" />