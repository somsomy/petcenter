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
<link href='<c:url value="/css/content.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="sub_img"></div>
<div id="divArticle">
<nav id="sub_menu">
</nav>
<c:if test="${!sessionScope.id eq 'admin'}">
	<c:redirect url="/main"></c:redirect>
</c:if>
<article>
<h1>Q&A 답변 작성</h1>
<form action='<c:url value="/qna/reply" />' method="post">
	<input type="hidden" name="num" value="${qb.num }">
	<input type="hidden" name="re_ref" value="${qb.re_ref }">
	<input type="hidden" name="re_lev" value="${qb.re_lev }" >
	<input type="hidden" name="re_seq" value="${qb.re_seq }">
<table id="cnotice">
<tr id="sub"><td>글제목</td><td colspan="3"><input type="text" name="subject" value="답변입니다." id="title" readonly></td></tr>
<tr id="atd"><td>작성자</td><td class="tdtd"><input type="text" name="name" value="${sessionScope.id }" id="writer" readonly></td></tr>
 <tr class="subsub"><td class="consub">글내용</td>
 <td colspan="3" class="consub"><textarea name="content" placeholder="내용을 입력해주세요." id="conupdate" autofocus required></textarea></td></tr>
</table>
<div class="clear"></div>
<div id="wbtn">
<input type="submit" value="글쓰기" class="writeBtn" >
</div>
</form>
<div class="clear"></div>

</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>