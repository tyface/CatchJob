<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">			
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	select {
		width: 190px;
		height: 20px;
	}
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
		margin-bottom: 50px;
	}
	#quantity{
		width: 90px; 
		height: 26px;
		border-radius:3px;	
	}

	#pagenation{
		text-align:center;
	}
	table{	
        table-layout: fixed;
        word-wrap: break-word;
    }

    table th, table td {
        overflow: hidden;
        
	}
	select{
		height:27px;
		border-radius:4px;
		border-line: 1px solid #ccc;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	}

	#chkDelete{		
		margin-right:10px;
	}
	.glyphicon-ok{
		color:green;
	}
	.glyphicon-remove{
		color:darkRed;
	}
	.row.form-group{
		padding:0;
	}
</style>
<script>		
	function newPage() {	
		var url="mngReview?page="+${viewData.currentPage}+"&msgPerPage="+$("#quantity").val()+
			"&keywordOption="+$("#reviewSelect option").val()+"&keyword="+$("#keyword").val();		
		window.location=url;
	}
		//서치
	function searchFunction(){
		  $("#hiddenElement").attr("name", "keywordOption");	  
		if($("#reviewSelect option:selected").text()=='기업명'){
		     $("#hiddenElement").attr("value", "entNameKeyword");
		
		} else if($("#reviewSelect option:selected").text()=='기업코드'){
			 $("#hiddenElement").attr("value", "entIndexKeyword");
		      
		} else if($("#reviewSelect option:selected").text()=='질문 식별번호'){
			 $("#hiddenElement").attr("value", "questionNumKeyword");
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
	
/* 	alert(getParameterByName('keywordOption'));
		키워드 변경  + mberFlag
	if(getParameterByName('keywordOption')!=null){
		if(getParameterByName('keywordOption')=='entIndexKeyword'){	
			$("#reviewSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='entIndexKeyword'){		
			$("#reviewSelect").val(getParameterByName('keywordOption'))
		}else if(getParameterByName('keywordOption')=='questionNumKeyword'){
			$("#reviewSelect").val(getParameterByName('keywordOption'))
		}

	} */
	
		//모달
	 $('div.modal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget);
		  var modal = $(this)
		  
		  modal.find('.modal-body #contents').val(button.data('contents'))
		  modal.find('.modal-body #evaluation').val(button.data('evaluation'))
		  modal.find('.modal-body #regDate').val(button.data('regdate'))
		  modal.find('.modal-body #reviewIndex').val(button.data('reviewindex'))		  
		  modal.find('.modal-body #mberId').val(button.data('mberid'))
		  modal.find('.modal-body #entIndex').val(button.data('entindex'))
		  
		  var qNum = button.data('qnum')
		  modal.find('.modal-body #qnum').val(qNum)
		
	});
	 	//체크박스
	  $("input[name='chk_all']").click(function () {
	        var chk_listArr = $("input[name='chk_list']");
	        for (var i=0; i < chk_listArr.length; i++) {
	            chk_listArr[i].checked = this.checked;
	        }
	    });
	    
	    $("input[name='chk_list']").click(function () { //리스트 항목이 모두 선택되면 전체 선택 체크
	        if ($("input[name='chk_list']:checked").length == 5) {
	            $("input[name='chk_all']")[0].checked = true;
	        } else  {          //리스트 항목 선택 시 전체 선택 체크를 해제함
	            $("input[name='chk_all']")[0].checked = false; 
	        }
	    });    
	          
});
	//체크박스
function chkModify(){
    var valueArr = new Array();
    var list = $("input[name='chk_list']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }          
    }
        $.ajax({        	
			type : "post",
			url : "${pageContext.request.contextPath}/admin/modifyReviewFlag",
			data : 		
				{"valueArr" : valueArr},
			dataType : "json",
			 success : function(data) {
				if (data.result) {
					alert("리뷰 사용 상태로 변경되었습니다");
					window.location.reload();
				} else {
					alert("리뷰 상태 변경에 실패했습니다");
				}
			},
			error : function() {
				alert("리뷰 상태 변경에 실패했습니다");
			} 
		});  
}

function chkDelete(){
    var valueArr = new Array();
    var list = $("input[name='chk_list']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            var chkedList = valueArr.push(list[i].value);
        }
    }
    $.ajax({        	
		type : "post",
		url : "${pageContext.request.contextPath}/admin/deleteReviewFlag",
		data : 		
			{"valueArr" : valueArr},
		dataType : "json",
		 success : function(data) {
			if (data.result) {
				alert("리뷰 삭제 상태로 변경되었습니다");
				window.location.reload();
			} else {
				alert("리뷰 상태 변경에 실패했습니다");
			}
		},
		error : function() {
			alert("리뷰 상태 변경에 실패했습니다");
		} 
	});  
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%>
	<div class="col-md-9 main">
		<h1 class="page-header">[ 리뷰 관리 ]</h1>
		<br>
		<div class="col-md-offset-1">
			<div class="row">
				<div class="col-sm-7">
					<div class="btn-group" role="group">
						 <button onclick="chkModify()" class="btn btn-default" id="chkModify">
						 <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>사용</button>
	  					 <button onclick="chkDelete()" class="btn btn-default" id="chkDelete">
	  					 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>삭제</button>
  					</div>	
					<input type="number" min="5"
						max="15" step="5" id="quantity" value="${viewData.msgPerPage}"
						onclick="newPage()">&nbsp; entries			
				</div>			
				<div class="col-sm-2">
					<select id="reviewSelect">
						<option value="entNameKeyword">기업명</option>
						<option value="entIndexKeyword">기업코드</option>
						<option value="questionNumKeyword">질문번호</option>
					</select>
					
				</div>
				<form action="mngReview" class="form-inline col-sm-3" id="searchForm">
					<div class="input-group">
						<input type="hidden" name="page" value="${viewData.currentPage}">
						<input type="hidden" name="msgPerPage" value="${viewData.msgPerPage}">
						<input type="hidden" id="hiddenElement"/>
						<input type="text" name="keyword" class="form-control" id="keyword" value="${viewData.keyword}"
						style="height:28px" size="20">
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
							<th style="width:2%;">
  								 <input type="checkbox" id="chk_all" name="chk_all"/>
                            </th>
                            <th style="width:2%"><span class="glyphicon glyphicon-check"></span></th>
							<th style="width:5%">NO</th>
							<th style="width:11%">작성자</th>
							<th style="width:10%">기업명</th>
							<th style="width:6%">기업코드</th>
							<th style="width:6%">질문번호</th>
							<th style="width:8%">리뷰코멘트</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="reviews" items="${viewData.boardList}" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" id="chk_list" name="chk_list" value="${reviews.reviewIndex}"/>
                            </td>
                            <c:if test="${reviews.reviewFlag==1}"><td><span class="glyphicon glyphicon-ok"></span></td></c:if>
							<c:if test="${reviews.reviewFlag==2}"><td><span class="glyphicon glyphicon-remove"></span></td></c:if>
							<td>${reviews.reviewIndex}</td>
							<td>${reviews.mberId}</td> 
							<td>${reviews.entName}</td>
							<td>${reviews.entIndex}</td>
							<td>${reviews.questionNum}</td>
							<td>
								<input class="btn btn-info btn-sm" type="button" data-reviewindex="${reviews.reviewIndex}"
								data-contents="${reviews.contents}" data-qnum="${reviews.questionNum}" 
								data-evaluation="${reviews.evaluationScore}" data-toggle="modal" 
								data-mberid="${reviews.mberId}" data-entindex="${reviews.entIndex}" 
								data-regdate="${reviews.regDate}" data-target="div.modal" value="수정하기" 
								>
							</td>							
						</tr>
					</c:forEach>
					</tbody>
				</table>

			<!-- modal -->
			<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog"
				aria-labelledby="modalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="modalLabel">리뷰 코멘트</h4>							
						</div>
						<form action="modifyComment" method="post">
							<div class="modal-body">
								<input type="hidden" name="reviewIndex" id="reviewIndex">
									<div class="row form-group">
										<div class="col-xs-2 form-group">
											<label for="entIndex" class="control-label">기업코드</label></div>
										<div class="col-xs-3">	
											<input type="text" id="entIndex" name="entIndex" class="form-control">
										</div> 
										<div class="col-xs-2 col-xs-offset-1 form-group" style="text-align:right">
											<label for="regDate" class="control-label">등록일 </label></div>
										<div class="col-xs-4">	
											<input type="text" readOnly="readOnly" id="regDate" name="regDate" class="form-control">
										</div> 
		     				     		
									</div>								
		     				     	<div class="row form-group">
		     				     		<div class="col-xs-2">
											<label for="evaluation" class="control-label">리뷰 점수</label></div>
										<div class="col-xs-3">
											<input type="text" id="evaluation" name="evaluation" class="form-control"/></div>
										<div class="col-xs-2 col-xs-offset-1 form-group" style="text-align:right">
											<label for="mberId" class="control-label">작성자</label></div>
										<div class="col-xs-4">
											<input type="text" id="mberId" name="mberId" class="form-control"/></div>
									</div>
									<div class="form-group row">		
										<div class="col-xs-2" style="text-align:right">
											<label for="qnum" class="control-label">질문 내용 </label></div>
											
										<div class="col-xs-5">	
										<select class="form-control" style="color:gray" id="qnum" name="questionNum">
											
											<option value="1">1.승진 기회 및 가능성</option>
											<option value="2">2.복지 및 급여</option>
											<option value="3">3.업무와 삶의 균형</option>
											<option value="4">4.사내문화</option>
											<option value="5">5.경영진</option>
											
										</select>
										
										</div> 
										
									</div>
									<div class="form-group row">
										<div class="col-xs-2">
											<label for="contents" class="control-label">코멘트<br>내용</label>
										</div>
										<div class="col-xs-10">
											<textarea class="form-control" name="contents" id="contents" rows="6" cols="50"></textarea>
										</div>
									</div>
							</div>
							 <div class="modal-footer">
							 	
						        <button type="submit" class="btn btn-primary">수정하기 </button>
						        <button type="reset" class="btn btn-warning">초기화</button>							
						      </div>
						     </form>  
						    </div>  
						  
					</div>
				</div>
			</div>

				<div id="pagenation">
						<ul class="pagination pagination-sm">
							<c:if test="${viewData.startPage != 1}">
								<li class="page-item"><a class="page-link"
									aria-label="Previous"
									href="mngReview?page=${viewData.startPage-1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
										<span aria-hidden='true'>&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${viewData.startPage}"
								end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
								<c:choose>
									<c:when test="${pageNum == viewData.currentPage}">
										<li class="page-item active"><a class="page-link"
											href="mngReview?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}"
											>${pageNum}<span class="sr-only">(current)</span></a>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" 
										href="mngReview?page=${pageNum}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}">
										${pageNum}</a>								
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${viewData.endPage < viewData.pageTotalCount}">
								<li class="page-item"><a class="page-link"
									href="mngReview?page=${viewData.endPage+1}&msgPerPage=${viewData.msgPerPage}&keywordOption=${viewData.keywordOption}&keyword=${viewData.keyword}"><span aria-hidden='true'>&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div><!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->
</body>
</html>