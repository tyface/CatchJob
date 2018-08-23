<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="include/header.jsp" flush="true" />

<article><!-- div 로 수정할 것 -->
	<c:forEach items="${newsList}" var="newsList">
		<div class="row">
			<span class="col-xs-8 f-left text-left blue-font" onclick="location.href='${newsList.link}'">${newsList.title}</span> 
			<span class="col-xs-4 f-right">${newsList.pubDate}</span>		
		</div>
	</c:forEach>
</article>


<jsp:include page="include/footer.jsp" flush="true" />