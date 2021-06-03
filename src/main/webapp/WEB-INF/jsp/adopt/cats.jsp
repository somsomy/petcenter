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
<link href='<c:url value="/css/board/cats.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<c:choose>
	<c:when test="${param.state eq 'protected' }">
		<div id="text">보호중인 아이들</div>
		<hr id="texthr">
		<div id="text2">고양이의 하루에서 안전하게 보호중인 아이들.</div>
	</c:when>
	<c:otherwise>
		<div id="text">입양완료</div>
		<hr id="texthr">
		<div id="text2">새로운 가족을 맞이한 아이들.</div>
	</c:otherwise>
</c:choose>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<c:choose>
	<c:when test="${param.state eq 'protected' }">
	<h1>보호중인 아이들</h1>
	</c:when>
	<c:otherwise>
	<h1>입양완료</h1>
	</c:otherwise>
</c:choose>
<hr>
<div class="wrapper">
<c:forEach var="cb" items="${cbList }">
	<div class="mycats" onclick="location.href='<c:url value="/cats/content?catId=${cb.catId}" />'">
	<div class="catImg">
	<div><img src='<c:url value="${cb.fileRealName }" />' class="mycatsImg"></div>
	<div class="mycatsName">${cb.catName }</div>	
	<div>등록날짜 <fmt:formatDate value="${cb.date}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>	
	</div>
	</div>
</c:forEach>
</div>
<div class="clear"></div>
<div id="table_search">
<form action="catsSearch.jsp" method="get">
<div id="divSearch">
<input type="text" name="search" placeholder=" Search" class="input_box" >
<button><img src='<c:url value="/images/search.png" />' id="searchImg"></button>
</div>
</form>
</div>
<div class="clear"></div>

<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/cats?state=${param.state }&pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/cats?state=${param.state }&pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/cats?state=${param.state }&pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>