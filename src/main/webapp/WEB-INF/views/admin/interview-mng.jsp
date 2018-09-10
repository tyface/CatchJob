<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	input.form-control.input-sm{
		font-size:12px;
		height:30px;
	}
	select.form-control{
		font-size:12px;
		height:37px;
	}
	textArea.form-control.input-sm{
		font-size:12px;
	}
	
</style>
<script>		
	function newPage() {	
		var url="mngReview?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()+
			"&keywordOption="+$("#mngSelect option").val()+"&keyword="+$("#keyword").val();		
		window.location=url;
	}
	function searchFunction(){
		  $("#hiddenElement").attr("name", "keywordOption");	  
		if($("#mngSelect option:selected").text()=='기업명'){
		     $("#hiddenElement").attr("value", "entNameKeyword");		
		} else if($("#mngSelect option:selected").text()=='기업코드'){
			 $("#hiddenElement").attr("value", "entIndexKeyword");		      
		} else if($("#mngSelect option:selected").text()=='면접난이도'){
			 $("#hiddenElement").attr("value", "intrvwDifficultyKeyword");
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
		if(getParameterByName('keywordOption')=='entIndexKeyword'){	
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='entIndexKeyword'){		
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='intrvwDifficultyKeyword'){
			$("#mngSelect").val(getParameterByName('keywordOption'))
		}
	} 
	
	 $('div.modal').on('show.bs.modal', function (event) {

		  var button = $(event.relatedTarget);
		  var modal = $(this)		  
		  modal.find('.modal-body #intrvwIndex').val(button.data('intrvwindex'))
		  modal.find('.modal-body #mberId').val(button.data('mberid'))
		  modal.find('.modal-body #entName').val(button.data('entname'))
		  modal.find('.modal-body #entIndex').val(button.data('entindex'))		  
		  modal.find('.modal-body #intrvwDifficulty').val(button.data('intrvwdifficulty'))
		  modal.find('.modal-body #intrvwDate').val(button.data('intrvwdate'))
		  modal.find('.modal-body #intrvwRoute').val(button.data('intrvwroute'))
		  modal.find('.modal-body #intrvwReview').val(button.data('intrvwreview'))
		  modal.find('.modal-body #intrvwQuestion').val(button.data('intrvwquestion'))
		  modal.find('.modal-body #intrvwAnswer').val(button.data('intrvwanswer'))
		  modal.find('.modal-body #intrvwResult').val(button.data('intrvwresult'))
		  modal.find('.modal-body #intrvwExperience').val(button.data('intrvwexperience'))
		  modal.find('.modal-body #presentationDate').val(button.data('presentationdate'))
		  modal.find('.modal-body #regDate').val(button.data('regdate'))

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
	        } else  {      
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
			url : "${pageContext.request.contextPath}/admin/modifyInterviewFlag",
			data : 		
				{"valueArr" : valueArr},
			dataType : "json",
			 success : function(data) {
				if (data.result) {
					alert("면접 사용 상태로 변경되었습니다");
					window.location.reload();
				} else {
					alert("면접 상태 변경에 실패했습니다");
				}
			},
			error : function() {
				alert("면접 상태 변경에 실패했습니다");
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
		url : "${pageContext.request.contextPath}/admin/deleteInterviewFlag",
		data : 		
			{"valueArr" : valueArr},
		dataType : "json",
		 success : function(data) {
			if (data.result) {
				alert("면접 삭제 상태로 변경되었습니다");
				window.location.reload();
			} else {
				alert("면접 상태 변경에 실패했습니다");
			}
		},
		error : function() {
			alert("면접 상태 변경에 실패했습니다");
		} 
	});  
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-md-9 main">
		<h1 class="page-header">[ 면접 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="row">
				<div class="col-sm-7">
					<div class="btn-group" role="group">
						<button onclick="chkModify()" class="btn btn-default" id="chkModify">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>사용
						</button>
						<button onclick="chkDelete()" class="btn btn-default" id="chkDelete">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>삭제
						</button>
					</div>
					<input type="number" min="5" max="15" step="5" id="quantity"
						value="${viewData.msgPerPage}" onclick="newPage()">&nbsp; entries
				</div>
				<div class="col-sm-2">
					<select id="mngSelect" value="${viewData.keywordOption}">
						<option value="entNameKeyword">기업명</option>
						<option value="entIndexKeyword">기업코드</option>
						<option value="intrvwDifficultyKeyword">면접난이도</option>
					</select>

				</div>
				<form action="mngReview" class="form-inline col-sm-3"
					id="searchForm">
					<div class="input-group">
						<input type="hidden" name="page" value="${viewData.currentPage}">
						<input type="hidden" name="msgPerPage"
							value="${viewData.msgPerPage}"> <input type="hidden"
							id="hiddenElement" /> <input type="text" name="keyword"
							class="form-control" id="keyword" value="${viewData.keyword}"
							 size="20" placeholder="검색어를 입력해 주세요">
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
						<th style="width: 2%;"><input type="checkbox" id="chk_all" name="chk_all" /></th>
						<th style="width: 2%"><span class="glyphicon glyphicon-check"></span></th>
						<th style="width: 3%">NO</th>
						<th style="width: 9%">작성자</th>
						<th style="width: 9%">기업명</th>
						<th style="width: 5%">기업코드</th>
						<th style="width: 4%">면접난이도</th>
						<th style="width: 7%">세부사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="interview" items="${viewData.boardList}">
						<tr>
							<td><input type="checkbox" id="chk_list" name="chk_list"
								value="${interview.intrvwIndex}" /></td>
							<c:if test="${interview.intrvwFlag==1}">
								<td><span class="glyphicon glyphicon-ok"></span></td>
							</c:if>
							<c:if test="${interview.intrvwFlag==2}">
								<td><span class="glyphicon glyphicon-remove"></span></td>
							</c:if>
							<td>${interview.intrvwIndex}</td>
							<td>${interview.mberId}</td>
							<td>${interview.entName}</td>
							<td>${interview.entIndex}</td>
							<td>${interview.intrvwDifficulty}</td>
							<td>
							<input class="btn btn-primary btn-sm" type="button"
								data-intrvwindex="${interview.intrvwIndex}"
								data-mberid="${interview.mberId}"
								data-entname="${interview.entName}"
								data-entindex="${interview.entIndex}" 
								data-intrvwdifficulty="${interview.intrvwDifficulty}"
								data-intrvwdate="${interview.intrvwDate}"
								data-intrvwroute="${interview.intrvwRoute}"
								data-intrvwreview="${interview.intrvwReview}"
								data-intrvwquestion="${interview.intrvwQuestion}"
								data-intrvwanswer="${interview.intrvwAnswer}"
								data-intrvwresult="${interview.intrvwResult}"
								data-intrvwexperience="${interview.intrvwExperience}"
								data-presentationdate="${interview.presentationDate}"
								data-regdate="${interview.regDate}"
								data-target="div.modal" data-toggle="modal" value="수정하기"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
		<div class="modal fade" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" id="interviewModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="modalLabel">세부사항</h4>
						</div>
					<form action="modifyInterview" method="post">
												
							<div class="modal-body">
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="entIndex" class="control-label">기업코드</label>
										<input type="hidden" name="intrvwIndex" id="intrvwIndex">	
									</div>
									<div class="col-xs-9">
										<input type="text" id="entIndex" name="entIndex"
											class="form-control input-sm">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="entName" class="control-label">기업명</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="entName" name="entName"
											class="form-control input-sm" />
									</div>
								</div>	  	
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="mberId" class="control-label">작성자</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="mberId" name="mberId"
											class="form-control input-sm" />
									</div>
								</div>	
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwDifficulty" class="control-label">면접 난이도</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control"
											id="intrvwDifficulty" name="intrvwDifficulty">
											<option>면접 난이도</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3 form-group">
										<label for="intrvwDate" class="control-label">면접 날짜</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="intrvwDate" name="intrvwDate"
											class="form-control input-sm">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwRoute" class="control-label">면접 경로</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control"
											id="intrvwRoute" name="intrvwRoute">
											<option>면접 경로</option>
											<option value="1">1:공채</option>
											<option value="2">2:온라인지원</option>
											<option value="3">3:직원추천</option>
											<option value="4">4:헤드헌터</option>
											<option value="5">5:학교 취업지원센터</option>
											<option value="6">6:기타</option>
										</select>
									</div>
								</div>			
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwReview" class="control-label">면접 후기</label>
									</div>
									<div class="col-xs-9">
										<textArea id="intrvwReview" name="intrvwReview" class="form-control input-sm"></textArea>
									</div>
								</div>
								
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwQuestion" class="control-label">면접 질문</label>
									</div>
									<div class="col-xs-9">
										<textArea id="intrvwQuestion" name="intrvwQuestion" class="form-control input-sm"></textArea>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwAnswer" class="control-label">면접 답변</label>
									</div>
									<div class="col-xs-9">
										<textArea id="intrvwAnswer"	name="intrvwAnswer" class="form-control input-sm"></textArea>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwResult" class="control-label">면접 결과</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control"
											id="intrvwResult" name="intrvwResult">
											<option>면접 결과</option>
											<option value="1">1:합격</option>
											<option value="2">2:불합격</option>
											<option value="3">3:대기중</option>
											<option value="4">4:합격했으나 취업하지않음</option>
										</select>
									</div>
								</div>	
								
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="presentationDate" class="control-label">발표 시기</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="presentationDate" 
										name="presentationDate" class="form-control input-sm"/>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="intrvwExperience" class="control-label">면접 경험</label>
									</div>
									<div class="col-xs-9">
										<select class="form-control"
											id="intrvwExperience" name="intrvwExperience">
											<option value="0"></option>
											<option value="1">부정적</option>
											<option value="2">보통</option>
											<option value="3">긍정적</option>
										</select>
									</div>
								</div>							
						
								<div class="row form-group">
									<div class="col-xs-3">
										<label for="regDate" class="control-label">작성일</label>
									</div>
									<div class="col-xs-9">
										<input type="text" id="regDate" readOnly
											name="regDate" class="form-control input-sm" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<button type="reset" class="btn btn-warning">초기화</button>
							</div>
						</form>
					</div>
				</div>
			</div>
					<div id="pagenation">
						<ul class="pagination pagination-sm">
							<c:if test="${viewData.startPage != 1}">
								<li class="page-item"><a class="page-link"
									aria-label="Previous"
									href="mngInterview?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
										<span aria-hidden='true'>&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${viewData.startPage}"
								end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
								<c:choose>
									<c:when test="${pageNum == viewData.currentPage}">
										<li class="page-item active"><a class="page-link"
											href="mngInterview?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">${pageNum}<span
												class="sr-only">(current)</span></a>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="mngInterview?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
												${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${viewData.endPage < viewData.pageTotalCount}">
								<li class="page-item"><a class="page-link"
									href="mngInterview?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}"><span
										aria-hidden='true'>&raquo;</span> </a></li>
							</c:if>
							</ul>
						</div>			
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>
</body>
</html>