<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="include/header.jsp" flush="true" />
<style>
 .panels {
      border: 1px solid #B5B2FF; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
      background-color: #fff;
      margin-bottom: 20px;
      
  }
  .panels:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
/*   .panel-footer .btn:hover { */
/*       border: 1px solid #f4511e; */
/*       background-color: #fff !important; */
/*       color: #f4511e; */
/*   } */
  .panel-headings {
      color: #fff !important;
      background-color: #B5B2FF !important;
      text-align: right; 
       padding: 0px;  
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footers {
      background-color: white !important;
  }


</style>
<script>

$(function(){
	
	saramin();

});

function saramin(){
	var saraminList = JSON.parse('${saraminList}');
	for(var i in saraminList){
		var url 					= saraminList[i].url
		var name 					= saraminList[i].name
		var expirationTimestamp 	= saraminList[i].expirationTimestamp
		var title 					= saraminList[i].title
		var experienceLevel			= saraminList[i].experienceLevel
		var requiredEducationLevel	= saraminList[i].requiredEducationLevel
		var location				= saraminList[i].location
		var industry				= saraminList[i].industry
		var href					= saraminList[i].href
		
		var trimLocation = location.substring(0,2);
		var trimRequiredEducationLevel;
		if(requiredEducationLevel != "학력무관"){
			trimRequiredEducationLevel = requiredEducationLevel.substring(0,1)+"졸↑";
		}else{
			trimRequiredEducationLevel = requiredEducationLevel;
		}
			$(".name").text(name)
			$(".expirationTimestamp").text(expirationTimestamp)
			$(".title").text(title)
			$(".experienceLevel").text(experienceLevel)
			$(".requiredEducationLevel").text(requiredEducationLevel)
			$(".location").text(location)
			$(".industry").text(industry)
// 		if(i<3){
// 	 		var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'><div class='panel-headings'> <span class='expirationTimestamp f-right'>"+expirationTimestamp+"</span><h3 class='name'>"+name+"</h3></div><div class='panel-body'><h4><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h4></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
// 			data.appendTo(saraminRow1);
// 		}else if(i<6){
// 			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'><div class='panel-headings'> <span class='expirationTimestamp f-right'>"+expirationTimestamp+"</span><h3 class='name'>"+name+"</h3></div><div class='panel-body'><h4><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h4></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
// 			data.appendTo(saraminRow2);
// 		}else if(i<9){
// 			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'><div class='panel-headings'> <span class='expirationTimestamp f-right'>"+expirationTimestamp+"</span><h3 class='name'>"+name+"</h3></div><div class='panel-body'><h4><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h4></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
// 			data.appendTo(saraminRow3);
// 		}else{
// 			var data = $("<div class='col-sm-4' ><div class='panels panel-default text-center'><div class='panel-headings'> <span class='expirationTimestamp f-right'>"+expirationTimestamp+"</span><h3 class='name'>"+name+"</h3></div><div class='panel-body'><h4><a class='title blue-font' href='"+url+"'><b>"+title+"</b></a></h4></div><div class='panel-footers'><p><small>	<span class='experienceLevel'>"+experienceLevel+"</span> | <span class='requiredEducationLevel'>"+trimRequiredEducationLevel+"</span> | <span class='location'>"+trimLocation+"</span> | 	<span class='industry'>"+industry+"</span></small></p></div></div></div>");
// 			data.appendTo(saraminRow4);
// 		}
	}
}
</script>

<article>
<div  id="saramin">
</div>     
</article>
<!-- 	<div class="row" id="saraminRow1">	 -->
<!-- 	</div> -->
<!-- 	<div class="row" id="saraminRow2">	 -->
<!-- 	</div> -->
<!-- 	<div class="row" id="saraminRow3">	 -->
<!-- 	</div> -->
<!-- 	<div class="row" id="saraminRow4">	 -->
<!-- 	</div> -->

<article>
	<div class="row">
		<div class="col-sm-4" > 
		     <div class="panels panel-default text-center">
		       <div class="panel-headings">
               		<span class="expirationTimestamp">마감</span>
		       </div>
		       <div class="panel-body">
			       <h3 class="name">회사명</h3>
		       		<h4><a class="title blue-font" ><b>제목</b></a></h4>
		       </div>
		       <div class="panel-footers">
		       		<p><small>
		       			<span class="experienceLevel">ㅎ</span> | 
		       			<span class="requiredEducationLevel">ㅎ</span> | 
		       			<span class="location">ㅎ</span> | 
		       			<span class="industry">ㅎ</span>
		       		</small></p>	       		
		       </div>
		     </div> 
	     </div> 
     </div>
</article>




<jsp:include page="include/footer.jsp" flush="true"/>