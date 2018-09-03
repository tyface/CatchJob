<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%@ include file="include/header.jsp" %>

<!-- 유효성 검사 -->
<%-- <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/messages_ko.min.js"></script> --%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<!-- <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"></script> -->

 <style type="text/css">
       #errorContainer {
           display: none;
           overflow: auto;
           background-color: #FFDDDD;
           border: 1px solid #FF2323;
           padding-top: 1;
       }

       #errorContainer label {
           float: none;
           width: auto;
       }

       input.error {
           border: 1px solid #FF2323;
       }

</style>
<script type="text/javascript">

$(function(){
// 	test();

	$('#main-search-form').validate({		
		rules : {
			keyword:{
				required : true,
				laxEmail : true,
			},
		},
		messages : {
			keyword:{
				required : "필수로입력하세요",
			},
		},
		showErrors: function(errorMap, errorList) {
	          // Clean up any tooltips for valid elements
	          $.each(this.validElements(), function (index, element) {
	              var $element = $(element);

	              $element.data("title", "") // Clear the title - there is no error associated anymore
	                  .removeClass("error")
	                  .tooltip("destroy");
	          });
	          // Create new tooltips for invalid elements
	          $.each(errorList, function (index, error) {
	              var $element = $(error.element);

	              $element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
	                  .data("title", error.message)
	                  .addClass("error")
	                  .tooltip(); // Create a new tooltip based on the error messsage we just set in the title
	          });
	      },

// 		errorPlacement: function (error, element) {
//             $(element).tooltipster('update', $(error).text());
//             $(element).tooltipster('show');
//         },
//         success: function (label, element) {
//             $(element).tooltipster('hide');
//         }

// 		errorContainer: $('#errorContainer'),
//         errorLabelContainer: $('#errorContainer ul'),
//         wrapper: 'li',
        
		submitHandler: function(form) {
// 			function(){
				var $keyword = $('#main-search-bar').val();
				$keyword = $keyword.replace(/ /gi, "");
				$('#main-search-bar').val($keyword);
				form.submit();
// 			})		
		}
	});	
	
	 jQuery.validator.addMethod("laxEmail", function(value, element) {
	  var result = value.replace(/ /gi, "");
	  return this.optional( element ) || /^[a-zA-Z가-힇0-9]{1,}$/.test( result );
	 }, '한글을 정확히 입력해 주세요 ');
		 
})

</script>

	<!-- CONTENTS -->
	<section>
<!-- 		<article id="main-center"> -->
<!-- 							검색바 -->
<!-- 				<form action="#" id="main-search-form"> -->
<!-- 						<input type="text" name="key" id="test"  placeholder="  기업을 검색해 보세요 "  > -->
<!-- 						<button type="submit" id="search-btn">서치서치</button> -->
<!-- 				</form> -->
<!-- 		</article> -->
	</section>
<section >
	<article id="main-center">
		<form action="../catchjob/enterprise/search" id="main-search-form" method="get">
					<!-- 면접에 대한 답변 -->
					<div class="row form-group">
						<div class="col-xs-9">
							<input type="text" class="form-control"  name="keyword" id="main-search-bar" 
							 placeholder="기업을 검색해 보세요"  data-placement="bottom"  autocomplete="off"><!-- data-placement="bottom" -->
						</div>
						<div class="col-xs-3">
							<button type="submit" class="glyphicon glyphicon-search">서치서치</button>
						</div>
					</div>

					
			
			</form>
		</article>
	<div id="errorContainer">
<!--         <p> Please correct the following errors and try again:</p> -->
        <ul style="display: none;"></ul>
    </div>
</section>
<%@ include file="include/footer.jsp" %>
