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
<div id="divSub">
<hr id="texthr">
<div id="text2">아이들의 가족이 되어주세요.</div>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>>
<div id="divArticle">
<article>
<h1>입양 문의</h1>
<form action='<c:url value="/adopt/update" />' method="post">
<input type="hidden" name="num" value="${ab.num }">
<table id="cnotice">
<tr id="sub"><td>글제목</td><td colspan="3" ><input type="text" name="subject" id="title" value="${ab.subject }" placeholder="제목을 입력해주세요."  autofocus required></td></tr>
<tr class="tdtd"><td>작성자</td><td><input type="text" name="name" value="${ab.name }" id="writer" readonly></td>
<td>고양이 이름</td><td>
<select name="catName" id="adwSelect">
<c:forEach var="cb" items="${cbList }">
	<option>${cb.catName }</option>
</c:forEach>
</select>
</td>
</tr>
 <tr class="subsub"><td class="consub">글내용</td><td colspan="3" class="consub">
 <textarea name="content" placeholder="내용을 입력해주세요." id="conupdate" required>${ab.content }</textarea></td></tr>
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