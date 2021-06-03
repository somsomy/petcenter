<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/board/review.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">입양후기</div>
<hr id="texthr">
<div id="text2">가족을 만나 행복한 하루를 보내는 아이들.</div>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>입양 후기</h1>
<hr>
<table id="comment">
<c:forEach var="rb" items="${rbList }">
	<tr onclick="location.href='<c:url value="/adopt/review/content?num=${rb.num}" />'" id="ctr">
	<td rowspan="2" id="itd">
	<c:choose>
		<c:when test="${!empty rb.fileRealName }">
			<img src='<c:url value="${rb.fileRealName }" />' width="60" height="60">
		</c:when>
		<c:otherwise>
			<img src='<c:url value="/images/board/image.png" />' width="60" height="60">	
		</c:otherwise>
	</c:choose>
	</td>
	<td class="std" colspan="2">${rb.subject }</td>
	<td rowspan="2" > <fmt:formatDate value="${rb.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td></tr>
	<tr onclick="location.href='<c:url value="/adopt/review/content?num=${rb.num}" />'" id="ntr">
	<td class="sntd">작성자 ${rb.name } | 조회수 ${rb.readcount }</td>
	</tr>
</c:forEach>

</table>
<div class="clear"></div>
<div id="wbtn">
<input type="button" value="글쓰기" class="writeBtn" onclick="location.href='<c:url value="/adopt/review/write" />' ">
</div>
<div class="clear"></div>
<div id="table_search">
<form action="commentSearch.jsp" method="get">
<div id="divSearch">
<input type="text" name="search" placeholder=" Search" class="input_box" >
<button><img src='<c:url value="/images/search.png" />'  id="searchImg"></button>
</div>
</form>
</div>
<div class="clear"></div>
<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/adopt/review?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/adopt/review?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/adopt/review?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>