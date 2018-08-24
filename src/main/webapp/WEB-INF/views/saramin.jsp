<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="include/header.jsp" flush="true" />
<style>
 .panel {
      border: 1px solid #B5B2FF; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-headings {
      color: #fff !important;
      background-color: #B5B2FF !important;
      text-align: right;
/*       padding: 10px; */
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
</style>

<article><!-- div 로 수정할 것 -->
	<c:forEach items="${saraminList}" var="saraminList">
		<div class="row">
			href ${saraminList.href}<br>
			name ${saraminList.name}<br>
			title ${saraminList.title}<br>
			location ${saraminList.location}<br>
			jobType ${saraminList.jobType}<br>
			industry ${saraminList.industry}<br>
			jobCategory ${saraminList.jobCategory}<br>
			openQuantity ${saraminList.openQuantity}<br>
			experienceLevel ${saraminList.experienceLevel}<br>
			requiredEducationLevel ${saraminList.requiredEducationLevel}<br>
		</div>		
	</c:forEach>
</article>

<!-- <div class="row" > -->
<%-- 	<c:forEach items="${saraminList}" var="saraminList" begin="0" end="2"> --%>
<!-- 	   <div class="col-sm-4" >  -->
	   
	     
<!-- 	     <div class="panel panel-default text-center" > -->
	     
<!-- 	       <div class="panel-heading"> -->
<%-- 	         <h1>${saraminList.title}</h1> --%>
<!-- 	       </div> -->
	       
<!-- 	       <div class="panel-body"> -->
<!-- 	         <p><strong>20</strong> Lorem</p> -->
<!-- 	         <p><strong>15</strong> Ipsum</p> -->
<!-- 	         <p><strong>5</strong> Dolor</p> -->
<!-- 	         <p><strong>2</strong> Sit</p> -->
<!-- 	         <p><strong>Endless</strong> Amet</p> -->
<!-- 	       </div> -->
	       
<!-- 	       <div class="panel-footer"> -->
<%-- 	       		<p>${saraminList.experienceLevel} | ${saraminList.requiredEducationLevel} | ${saraminList.location} | ${saraminList.industry}</p> --%>
<!-- 	       </div> -->
	       
<!-- 	     </div>  -->
<!-- 	   </div>  -->
<%-- 	</c:forEach> --%>
<!-- </div> -->

<div class="row" >

   <div class="col-sm-4" > 
     <div class="panel panel-default text-center">
       <div class="panel-headings">
         <p>~08/31</p>
       </div>
       <div class="panel-body">
       		<h4><b>르노삼성자동차 전문영업인 채용</b></h4>
       </div>
       <div class="panel-footer">
       		<p><small>경력무관 | 고졸↑ | 서울 | 영업`고객상담</small></p>	       		
       </div>
     </div> 
   </div> 
   
   <div class="col-sm-4" > 
     <div class="panel panel-default text-center">
       <div class="panel-headings">
         <p>~08/31</p>
       </div>
       <div class="panel-body">
       		<h4><b>르노삼성자동차 전문영업인 채용</b></h4>
       </div>
       <div class="panel-footer">
       		<p><small>경력무관 | 고졸↑ | 서울 | 영업`고객상담</small></p>	       		
       </div>
     </div> 
   </div> 
   
   <div class="col-sm-4" > 
     <div class="panel panel-default text-center">
       <div class="panel-headings">
         <p>~08/31</p>
       </div>
       <div class="panel-body">
       		<h4><b>르노삼성자동차 전문영업인 채용</b></h4>
       </div>
       <div class="panel-footer">
       		<p><small>경력무관 | 고졸↑ | 서울 | 영업`고객상담</small></p>	       		
       </div>
     </div> 
   </div> 
   
</div>

<jsp:include page="include/footer.jsp" flush="true" />