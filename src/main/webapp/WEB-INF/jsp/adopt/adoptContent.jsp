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
<link href='<c:url value="/css/content.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>

<div class="clear"></div>
<div id="divSub">
<hr id="texthr">
<div id="text2">아이들의 가족이 되어주세요.</div>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>입양 문의</h1>
<hr>
<table id="cnotice">
<tr><td colspan="2" class="tdtd">고양이 ${ab.catName } 입양 문의</td></tr>
<tr id="sub"><td colspan="2">${ab.subject }</td></tr>
<tr><td colspan="2" id="write">${ab.name }</td></tr>
<tr><td class="tdtd"><fmt:formatDate value="${ab.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
<td id="readtd">조회수 ${ab.readcount }</td></tr>
<tr id="cbtr"><td colspan="2" id="con">${ab.content }</td></tr>
</table>

<div id="wbtn">
<c:if test="${!empty sessionScope.id }">
	<c:if test="${sessionScope.id eq 'admin' }">
		<input type="button" value="글삭제" class="writeBtn" onclick="location.href='<c:url value="/adopt/delete?num=${ab.num}" />'">
	</c:if>
	
	<c:if test="${mb.nick eq ab.name }">
		<input type="button" value="글수정" class="writeBtn" onclick="location.href='<c:url value="/adopt/update?num=${ab.num}" />'">
		<input type="button" value="글삭제" class="writeBtn" onclick="location.href='<c:url value="/adopt/delete?num=${ab.num}" />'">
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