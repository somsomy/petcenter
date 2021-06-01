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
<link href='<c:url value="/css/board/supportCats.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">1:1후원</div>
<jsp:include page="../inc/supportSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">

<article>
<h1>1:1 후원</h1>
<hr>
<c:forEach var="cb" items="${cbList }">
	<table>
	<tr><td rowspan="2" id="catimg"><img src='<c:url value="/upload/uploadImage/${cb.fileRealName }" />' width="300" height="300"></td>
	<td>안녕하새오! 나는 <span id="catName">${cb.catName }</span> 이애옹.</td>
	<td><input type="button" value="고양이 정보" class="supBtn" onclick="location.href='<c:url value="/cats/content?catId=${cb.catId}" />'" ></td></tr>
	<tr><td class="info">입소날짜 : <fmt:formatDate value="${cb.date}" type="both" pattern="yyyy.MM.dd"/> | 나이 : ${cb.catAge }</td>
	<td><input type="button" value="후원하기" class="supBtn" onclick="location.href='<c:url value="/support/content?catId=${cb.catId }" />' " ></td></tr>
	</table>
</c:forEach>
<div class="clear"></div>
<div id="table_search">
<form action="supportCatsearch.jsp" method="get">
<div id="divSearch">
<input type="text" name="search" placeholder=" Search" class="input_box" >
<button><img src='<c:url value="/resources/images/search.png" />'  id="searchImg"></button>
</div>
</form>
</div>
<div class="clear"></div>
<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/support?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/support?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/support?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>