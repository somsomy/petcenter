<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/member/myCats.css" />' rel="stylesheet" type="text/css">
</head>
<body>
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login"></c:redirect>
</c:if>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">나의 고양이들</div>
<hr id="texthr">
<div id="text2">회원님께서 후원하고 있는 고양이들.</div>
<jsp:include page="../inc/myPageSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>

<h1>나의 고양이</h1>
<hr>
<div id="hinfo">회원님께서 후원하고 있는 고양이</div>
<div id="join">
<div class="wrapper">
<c:forEach var="scb" items="${scbList }">
	<div class="mycats" onclick="location.href='<c:url value="/mycats/content?num=${scb.num}" />'">
	<div class="catImg">
	<div><img src='<c:url value="${scb.fileRealName }" />' class="mycatsImg"></div>
	<div class="mycatsName">행복한 고양이 ${scb.catName }</div>		
	</div>
	</div>
</c:forEach>
</div>
<div class="clear"></div>
<div id="buttons">
</div>
</div>
</article>
</div>
<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/mycats?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/mycats?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/mycats?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>