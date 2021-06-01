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
<div id="text">입양후기</div>
<hr id="texthr">
<div id="text2">가족을 만나 행복한 하루를 보내는 아이들.</div>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">

<article>
<h1>입양 후기</h1>
<hr>
<table id="cnotice">
<tr id="sub"><td colspan="2">${rb.subject }</td></tr>
<tr><td colspan="2" id="write">${rb.name }</td></tr>
<tr><td class="tdtdtd">  작성일 <fmt:formatDate value="${rb.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td><td id="readtdtd">조회수 ${rb.readcount }</td></tr>
<c:if test="${!empty rb.fileRealName }">
<tr><td colspan="2" id="con2"><img src='<c:url value="/upload/uploadImage/${rb.fileRealName }" />' id=conimg></td></tr>
</c:if>
<tr><td colspan="2" id="con3">${rb.content }</td></tr>
</table>
<div id="wbtn">
<input type="button" value="글목록" class="writeBtn" onclick="location.href='<c:url value="/adopt/review" />'">
<c:if test="${!empty sessionScope.id }">
	<c:if test="${sessionScope.id eq 'admin' }">
		<input type="button" value="글삭제" class="writeBtn" onclick="location.href='<c:url value="/adopt/review/delete?num=${rb.num}" />'">
	</c:if>
	
	<c:if test="${mb.nick eq rb.name }">
		<input type="button" value="글수정" class="writeBtn" onclick="location.href='<c:url value="/adopt/review/update?num=${rb.num}" />'">
		<input type="button" value="글삭제" class="writeBtn" onclick="location.href='<c:url value="/adopt/review/delete?num=${rb.num}" />'">
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