<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 고양이의 하루</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet"  type="text/css">
<link href='<c:url value="/css/content.css" />' rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">공지사항</div>
<hr id="texthr">
<div id="text2">고양이의 하루의 공지사항입니다.</div>
<jsp:include page="../inc/petcenterSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>공지사항</h1>
<hr>
<table id="cnotice">
<tr id="sub"><td colspan="2">${nb.subject}</td></tr>
<tr><td colspan="2" id="write">${nb.name}</td></tr>
<tr><td class="tdtd">  작성일 ${nb.date}</td><td id="readtd">조회수 ${nb.readcount}</td></tr>
<tr><td colspan="2" id="con">${nb.content}</td></tr>
</table>

<div id="wbtn">
<input type="button" value="목록" class="writeBtn" onclick="location.href='<c:url value="/notice" />'">
<c:if test="${! (empty sessionScope.id) }">
	<c:if test="${sessionScope.id eq 'admin' }">
		<input type="button" value="수정" class="writeBtn" onclick="location.href='<c:url value="/notice/update?num=${nb.num}" />'">
		<input type="button" value="삭제" class="writeBtn" onclick="location.href='<c:url value="/notice/delete?num=${nb.num}" />'">
	</c:if>
</c:if>
</div>
<div class="clear"></div>

</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>