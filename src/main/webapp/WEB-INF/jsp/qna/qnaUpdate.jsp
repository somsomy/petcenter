<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/css/default.css" />'  rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/content.css" />' rel="stylesheet" type="text/css">

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
<form action='<c:url value="/qna/update" />' method="post">
<input type="hidden" name="num" value="${qb.num }">
<table id="cnotice">
<tr id="sub"><td >제목</td>
<td id="tsub"><input type="text" name="subject" id="title" placeholder="제목을 입력해주세요."  value="${qb.subject }" required></td></tr>
<tr><td class="tdtd">작성자</td>
<td class="tdtd">${qb.name }</td></tr>
<tr class="subsub"><td class="consub">내용</td>
<td class="consub"><textarea name="content" placeholder="내용을 입력해주세요." id="conupdate" autofocus required>${qb.content }</textarea></td></tr>
</table>
<div id="wbtn">
<input type="submit" value="글수정" class="writeBtn" >
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