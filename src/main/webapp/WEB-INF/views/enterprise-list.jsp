<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" flush="true" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<style>
#entListPage {
	border: 1px solid lightgray;
	width: 730px;
	margin: 10px auto;
	background-color: white;
	box-sizing: border-box;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px 1px rgba(127,127,127,0.3);
    box-shadow: 0 1px 1px 1px rgba(127,127,127,0.3);
}
#entListEachPage {
	width: 700px;
	height: 200px;
	margin: 0 auto;
	border-bottom: 1px dashed #ccc;
	padding: 30px 30px 0px 30px;
	overflow: hidden;
	font-size: 15px;
}

.fa {
	font-size: 17px;
}

#entName {
	font-size: 25px;
}


#btnFollow{
	color: #ffcc00;
	font-size: 20px;
	padding:0px;
}

#btnReview {
	display: inline-block;
	float: right;
}

.clear {
	clear: left;
}

body {
    position: relative;
    background-color: #EAEAEA;
}
</style>
<script>
$(document).ready(function() {
	$(".mailbox-star").click(function (e) {
		e.preventDefault();
		//detect type
		var $this = $(this).find("a > i");
		var glyph = $this.hasClass("glyphicon");
		var fa = $this.hasClass("fa");
		
		//Switch states
		if (glyph) {
		  $this.toggleClass("glyphicon-heart");
		  $this.toggleClass("glyphicon-heart-empty");
		}
		
		if (fa) {
		  $this.toggleClass("fa-heart");
		  $this.toggleClass("fa-heart-o");
		}
	 });
});
</script>
</head>
<body>

<%-- ${entList}
 --%>
<article>

<div id="entListPage">	
	<c:forEach begin="0" varStatus="status" end="10" var="entList" items="${entList}">
		<div id="entListEachPage">
				<div class="row-fluid">
					<div style="display: inline-block; overflow: hidden; height: auto;">
						<a href="#" id="entName">${entList.entName}</a>

						<div class="btn mailbox-star" id="btnFollow">
							<a href="#"><i class="fa fa-heart"
								style="color: red; font-size: 20px;"></i></a>
						</div>
					</div>
					<div id="btnReview">
						<button type="button" class="btn btn-info" onclick="#">
							<span class="glyphicon glyphicon-pencil"> 리뷰작성 </span>
						</button>
					</div>
					<div class="addrName clear">
						<strong><a tag="#">${entList.industryName}</a></strong>
						<strong> │ </strong> 
						<strong><a tag="#"> </a></strong>
					</div>
					<br>
					<div class="row-fluid">
						<div style="display: inline-block;" class="col-md-5">
							<span class="fa fa-money"> 연봉 <a tag="#" id="salaryAvg">10,009<!--연봉넣기 -->
							</a>만원
							</span>
							<div class="stars" >
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> 기업평가 3.9 <small>/
								</small> 5<!--기업평가넣기 -->
							</div>
						</div>
						<div style="display: inline-block">
							<button type="button" class="btn btn-default btn-lg" onclick="#"
								style="bg-color: transparent; border: 0;">
								기업리뷰 <br>3119 <!--count 넣기 -->
							</button>
							<button type="button" class="btn btn-default btn-lg" onclick="#"
								style="bg-color: transparent; border: 0;">
								연봉정보 <br>6613<!--count 넣기 -->
							</button>
							<button type="button" class="btn btn-default btn-lg" onclick="#"
								style="bg-color: transparent; border: 0;">
								면접정보 <br>2262<!--count 넣기 -->
							</button>
						</div>
					</div>
				</div>
			</div>
	
   </c:forEach>

			<div style="text-align: center">
				<nav>
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</div>

</article>
		<jsp:include page="include/footer.jsp" flush="true" />