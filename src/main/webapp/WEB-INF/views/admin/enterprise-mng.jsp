<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<title>Admin Page</title>
<script>		
	function newPage() {	
		var url="mngEnt?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()+
			"&keywordOption="+$("#mngSelect option").val()+"&keyword="+$("#keyword").val();		
		window.location=url;
	}
	function searchFunction(){
		  $("#hiddenElement").attr("name", "keywordOption");	  
		if($("#mngSelect option:selected").text()=='기업명'){
		     $("#hiddenElement").attr("value", "entNameKeyword");		
		} else if($("#mngSelect option:selected").text()=='기업코드'){
			 $("#hiddenElement").attr("value", "entIndexKeyword");	      
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
		if(getParameterByName('keywordOption')=='entNameKeyword'){	
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='entIndexKeyword'){		
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}
	}	
	 $('div.modal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget);
		  var modal = $(this)		  
		  modal.find('.modal-body #entIndex').val(button.data('entindex'))
		  modal.find('.modal-body #entName').val(button.data('entname'))
		  modal.find('.modal-body #entBizRegNum').val(button.data('entbizregnum'))
		  modal.find('.modal-body #industryCode').val(button.data('industrycode'))		  
		  modal.find('.modal-body #entStyleType').val(button.data('entstyletype'))
		  modal.find('.modal-body #entSubscriberFlag').val(button.data('entsubscriberflag'))
		  modal.find('.modal-body #entFlag').val(button.data('entflag'))
		  modal.find('.modal-body #entFoundationDate').val(button.data('entfoundationdate'))
		  modal.find('.modal-body #industryName').val(button.data('industryname'))		  
	});
	  $("input[name='chk_all']").click(function () {
	        var chk_listArr = $("input[name='chk_list']");
	        for (var i=0; i < chk_listArr.length; i++) {
	            chk_listArr[i].checked = this.checked;
	        }
	    });	    
	  $("input[name='chk_list']").click(function () { 
	        if ($("input[name='chk_list']:checked").length == 5) {
	            $("input[name='chk_all']")[0].checked = true;
	        } else {       
	            $("input[name='chk_all']")[0].checked = false; 
	        }
	   });           
});
function chkModify(){
    var valueArr = new Array();
    var list = $("input[name='chk_list']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){
            valueArr.push(list[i].value);
        }          
    }
       $.ajax({        	
		type : "post",
		url : "${pageContext.request.contextPath}/admin/modifyEntFlag",
		data : 		
			{"valueArr" : valueArr},
		dataType : "json",
		 success : function(data) {
			if (data.result) {
				alert("기업표출 사용 상태로 변경되었습니다");
				window.location.reload();
			} else {
				alert("기업표출 상태 변경에 실패했습니다");
			}
		},
		error : function() {
			alert("기업표출 변경에 실패했습니다");
		} 
	});  
}
function chkDelete(){
    var valueArr = new Array();
    var list = $("input[name='chk_list']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ 
            var chkedList = valueArr.push(list[i].value);
        }
    }
    $.ajax({        	
		type : "post",
		url : "${pageContext.request.contextPath}/admin/deleteEntFlag",
		data : 		
			{"valueArr" : valueArr},
		dataType : "json",
		 success : function(data) {
			if (data.result) {
				alert("기업표출 삭제 상태로 변경되었습니다");
				window.location.reload();
			} else {
				alert("기업표출 상태 변경에 실패했습니다");
			}
		},
		error : function() {
			alert("기업표출 상태 변경에 실패했습니다");
		} 
	});  
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-md-9 main">
		<h1 class="page-header">[ 기업 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="row">
				<div class="col-sm-7">
					<div class="btn-group" role="group">
						<button onclick="chkModify()" class="btn btn-default"
							id="chkModify">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>사용
						</button>
						<button onclick="chkDelete()" class="btn btn-default"
							id="chkDelete">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>삭제
						</button>
					</div>
					<input type="number" min="5" max="15" step="5" id="quantity"
						value="${viewData.msgPerPage}" onclick="newPage()">&nbsp;
					entries
				</div>

				<div class="col-sm-2">
					<select id="mngSelect" value="${viewData.keywordOption}">
						<option value="entNameKeyword">기업명</option>
						<option value="entIndexKeyword">기업코드</option>
					</select>
				</div>
				<form action="mngEnt" class="form-inline col-sm-3" id="searchForm">
					<div class="input-group">
						<input type="hidden" name="page" value="${viewData.currentPage}">
						<input type="hidden" name="msgPerPage"
							value="${viewData.msgPerPage}"> <input type="hidden"
							id="hiddenElement" /> <input type="text" name="keyword"
							class="form-control" id="keyword" value="${viewData.keyword}"
							style="height: 28px" size="20" placeholder="검색어를 입력해 주세요">
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
						<th style="width: 2%"><input type="checkbox" id="chk_all"
							name="chk_all" /></th>
						<th style="width: 2%"><span class="glyphicon glyphicon-check"></span></th>
						<th style="width: 7%">기업코드</th>
						<th style="width: 20%">기업명</th>
						<th style="width: 8%">세부사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="enterprise" items="${viewData.boardList}">
						<tr>
							<td><input type="checkbox" id="chk_list" name="chk_list"
								value="${enterprise.entIndex}" /></td>
							<c:if test="${enterprise.entFlag==1}">
								<td><span class="glyphicon glyphicon-ok"></span></td>
							</c:if>
							<c:if test="${enterprise.entFlag==2}">
								<td><span class="glyphicon glyphicon-remove"></span></td>
							</c:if>
							<td>${enterprise.entIndex}</td>
							<td>${enterprise.entName}</td>

							<td><input class="btn btn-success btn-sm" type="button"
								data-entindex="${enterprise.entIndex}"
								data-entname="${enterprise.entName}"
								data-entbizregnum="${enterprise.entBizRegNum}"
								data-industrycode="${enterprise.industryCode}"
								data-entstyletype="${enterprise.entStyleType}"
								data-entsubscriberflag="${enterprise.entSubscriberFlag}"
								data-entflag="${enterprise.entFlag}"
								data-entfoundationdate="${enterprise.entFoundationDate}"
								data-industryname="${enterprise.industryName}"
								data-target="div.modal" value="상세보기" data-toggle="modal">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="modalLabel" id="entModal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="modalLabel">세부사항</h4>
						</div>
						<form action="modifyEnt" method="post">
							<div class="modal-body">
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="entIndex" class="control-label">기업코드</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="entIndex" name="entIndex"
											class="form-control">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="entName" class="control-label">기업명</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="entName" name="entName"
											class="form-control" />
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="entBizRegNum" class="control-label">사업자
											등록번호 </label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="entBizRegNum" name="entBizRegNum"
											class="form-control">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="entStyleType" class="control-label">사업장
											형태구분</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control" style="color: gray"
											id="entStyleType" name="entStyleType">
											<option>사업장 형태구분</option>
											<option value="1">1. 법인</option>
											<option value="2">2. 개인</option>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="entSubscriberFlag" class="control-label">사업장
											가입상태</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control" style="color: gray"
											id="entSubscriberFlag" name="entSubscriberFlag">
											<option>사업장 가입상태</option>
											<option value="1">1. 등록</option>
											<option value="2">2. 탈퇴</option>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="industryCode" class="control-label">업종 코드</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="industryCode" readOnly="readOnly"
											name="industryCode" class="form-control" />
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="industryName" class="control-label">업종명</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="industryName" readOnly="readOnly"
											name="industryName" class="form-control" />
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="entFoundationDate" class="control-label">설립일</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="entFoundationDate" readOnly="readOnly"
											name="entFoundationDate" class="form-control" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<button type="reset" class="btn btn-warning">초기화</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="pagenation">
				<ul class="pagination pagination-sm">
					<c:if test="${viewData.startPage != 1}">
						<li class="page-item"><a class="page-link"
							aria-label="Previous"
							href="mngEnt?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
								<span aria-hidden='true'>&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="pageNum" begin="${viewData.startPage}"
						end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
						<c:choose>
							<c:when test="${pageNum == viewData.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="mngEnt?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">${pageNum}<span
										class="sr-only">(current)</span></a>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="mngEnt?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
										${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${viewData.endPage < viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link"
							href="mngEnt?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}"><span
								aria-hidden='true'>&raquo;</span> </a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>