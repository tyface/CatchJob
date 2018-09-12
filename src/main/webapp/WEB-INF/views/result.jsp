<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="shortcut icon">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sweetalert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/public.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<script type="text/javascript">
	//alert("${msg}");

	$(function(){
		swal({
	    title:"${msg}",
	     type:"success",
	     confirmButtonClass: "btn-success"
	  },function(){
			location.href="${url}";
		})
	})

</script>
