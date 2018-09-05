<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<title>Admin Page</title>
<script>
	function newPage() {	
		var url="mngDomain?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()
			 +"&keywordOption="+$("#mngSelect option").val()+"&keyword="+$("#keyword").val(); 		
		window.location=url;
	}
		//서치
	 function searchFunction(){
		  $("#hiddenElement").attr("name", "keywordOption");	  
		if($("#mngSelect option:selected").text()=='도메인명'){
		     $("#hiddenElement").attr("value", "domainNameKeyword");
		
		} else if($("#mngSelect option:selected").text()=='도메인 주소'){
			 $("#hiddenElement").attr("value", "domainAddressKeyword");
		      
		} 
		$("#hiddenElement").appendChild($("#searchForm"));	
	}		
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	 
$(function(){
	if(getParameterByName('keywordOption')!=null){
		if(getParameterByName('keywordOption')=='domainNameKeyword'){	
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='domainAddressKeyword'){
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}
	}	 
	
	 $('#modifyDomainModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget);
		  var modal = $(this)	  
		  modal.find('.modal-body #domainIndex').val(button.data('domainindex'))
		  modal.find('.modal-body #domainAddress').val(button.data('domainaddress'))
		  modal.find('.modal-body #domainName').val(button.data('domainname'))
	});
	
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-md-9 main">
		<h1 class="page-header">[ 도메인 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="row">
				<div class="col-sm-7">
					<label for="quantity"> <input type="number" min="5"
						max="10" step="5" id="quantity" value="${viewData.msgPerPage}"
						onclick="newPage()"> &nbsp; entries
					</label>
				</div>
			 	<div class="col-sm-2">
					<select id="mngSelect" value="${viewData.keywordOption}">
						<option value="domainNameKeyword">도메인명</option>
						<option value="domainAddressKeyword">도메인 주소</option>
					</select>
				</div>
				<form action="mngDomain" class="form-inline col-sm-3"
					id="searchForm">
					<div class="input-group">
						<input type="hidden" name="page" value="${viewData.currentPage}">
						<input type="hidden" name="msgPerPage"
							value="${viewData.msgPerPage}"> <input type="hidden"
							id="hiddenElement" /> <input type="text" name="keyword"
							class="form-control" id="keyword" value="${viewData.keyword}"
							style="height:28px" size="20" placeholder="검색어를 입력해 주세요">
						<div class="input-group-btn">
							<button type="submit" class="btn" onclick="searchFunction()">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form> 
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th style="width: 7%">NO</th>
						<th style="width: 15%">도메인명</th>
						<th style="width: 15%">도메인 주소</th>
						<th style="width: 5%">수정하기</th>
						<th style="width: 5%">삭제하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="domain" items="${viewData.boardList}">
						<tr>
							<td>${domain.domainIndex}</td>
							<td>${domain.domainAddress}</td>
							<td>${domain.domainName}</td>
							<td>
							<input class="btn btn-info btn-sm" type="button" data-target="#modifyDomainModal" data-toggle="modal"
							data-domainindex="${domain.domainIndex}"
							data-domainaddress="${domain.domainAddress}" data-domainname="${domain.domainName}" value="수정하기">
							</td>
							<td><input class="btn btn-danger btn-sm" type="button" 
							onclick="location.href='${pageContext.request.contextPath}/admin/deleteDomain?domainIndex=${domain.domainIndex}'" value="삭제하기">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagenation">
				<ul class="pagination pagination-sm">
					<c:if test="${viewData.startPage != 1}">
						<li class="page-item"><a class="page-link"
							aria-label="Previous"
							href="mngDomain?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}">
								<span aria-hidden='true'>&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="pageNum" begin="${viewData.startPage}"
						end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
						<c:choose>
							<c:when test="${pageNum == viewData.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="mngDomain?page=${pageNum}&msgPerPage=${viewData.msgPerPage}">${pageNum}<span
										class="sr-only">(current)</span></a>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="mngDomain?page=${pageNum}&msgPerPage=${viewData.msgPerPage}">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${viewData.endPage < viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link"
							href="mngDomain?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}">
								<span aria-hidden='true'>&raquo;</span>
						</a></li>
					</c:if>
				</ul>
				<div class="pull-right" style="margin-top: 20px">
					<input class="btn btn-primary" type="button" data-target="#regDomainModal" value="등록하기" data-toggle="modal">
				</div>
			</div>
				<!-- 수정하기 modal  -->
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" id="modifyDomainModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="modalLabel">세부사항</h4>
						</div>
						<form action="updateDomain" method="post">
						
							<div class="modal-body">
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="domainAddress" class="control-label">도메인 주소</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="domainAddress" name="domainAddress"
											class="form-control" />
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="domainName" class="control-label">도메인명</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="domainName" name="domainName" 
										class="form-control">
									</div>
										<input type="hidden" id="domainIndex" name="domainIndex" class="form-control">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">등록하기</button>
								<button type="reset" class="btn btn-warning">초기화</button>
							</div>
							</div>
						</form>
					</div>
				</div>  
		<!-- 등록하기 modal -->
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" id="regDomainModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="modalLabel">세부사항</h4>
						</div>
						<form action="registDomain" method="post">
							<div class="modal-body">
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="domainName" class="control-label">도메인명</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="domainName" name="domainName"
											class="form-control">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="domainAddress" class="control-label">도메인 주소</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="domainAddress" name="domainAddress"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">등록하기</button>
								<button type="reset" class="btn btn-warning">초기화</button>
							</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div><!--<div class="row"> end -->
</div>
	<!--<div class="container-fluid"> end -->

</body>
</html>