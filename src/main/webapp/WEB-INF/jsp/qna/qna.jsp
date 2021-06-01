<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/css/default.css" />'  rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">Q&A</div>
<div id="sub_img_qna"></div>
<nav id="sub_menu">
</nav>
</div>
<div id="divArticle">
<article>
<h1>Q&A</h1>
<hr>
<table id="notice">
<tr><th class="tno">답변상태</th>
    <th class="ttitle">제목</th>
    <th class="twrite">작성자</th>
    <th class="tdate">작성날짜</th>
    <th class="tread">조회수</th></tr>
		<c:forEach var="qb" items="${qbList }">
			<tr onclick="location.href='<c:url value="/qna/content?num=${qb.num}" />'" id="atr">
			<td>${qb.state }</td>
			<td class="left">
			      <c:if test="${qb.re_lev > 0 }">
			      	<img src='<c:url value="/images/board/level.gif" />' width="${qb.re_lev*10 }" height="15">
			      	<img src='<c:url value="/images/board/re.gif" />'>
			      </c:if>
			${qb.subject }</td>
			<td>${qb.name }</td><td><fmt:formatDate value="${qb.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td><td>${qb.readcount }</td></tr>
	</c:forEach>
</table>
<div class="clear"></div>
<div id="wbtn">
<input type="button" value="글쓰기" class="writeBtn" onclick="location.href='<c:url value="/qna/write" />'">
</div>
<div class="clear"></div>
<div id="table_search">
<form action="qnaSearch.jsp" method="get">
<div id="divSearch">
<input type="text" name="search" placeholder=" Search" class="input_box" >
<button><img src='<c:url value="/images/search.png" />' id="searchImg"></button>
</div>
</form>
</div>
<div class="clear"></div>

<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/qna?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/qna?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/qna?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>