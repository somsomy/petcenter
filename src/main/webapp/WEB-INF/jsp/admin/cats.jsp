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
<c:if test="${empty sessionScope.id || sessionScope.id ne 'admin' }">
	<c:redirect url="/main"></c:redirect>
</c:if>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">관리자 고양이 등록</div>
<hr id="texthr">
<div id="text2">고양이 등록 / 취소 관리</div>
<jsp:include page="../inc/catsSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>고양이 목록</h1>
<hr>
<div class="wrapper">
<c:forEach var="cb" items="${cbList }">
	<div class="mycats" onclick="location.href='<c:url value="/admin/cats/content?catId=${cb.catId}" />'">
	<div class="catImg">
	<div><img src='<c:url value="/upload/uploadImage/${cb.fileRealName }" />' class="mycatsImg"></div>
	<div class="mycatsName">${cb.catName }</div>	
	<div>등록날짜 <fmt:formatDate value="${cb.date}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>	
	</div>
	</div>
</c:forEach>
</div>

<table class="tTab">
<tr>
</table>
<div class="clear"></div>
<div id="wbtn">
<input type="button" value="고양이등록" class="writeBtn" onclick="location.href='<c:url value="/admin/cats/register" />' ">
</div>
<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/admin/cats?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/admin/cats?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/admin/cats?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>