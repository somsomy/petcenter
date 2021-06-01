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
<div id="text">자원봉사</div>
<hr id="texthr">
<div id="text2">사랑의 손길을 내어주세요.</div>
<div id="sub_img"></div>
</div>
<div id="divArticle">
<c:if test="${empty sessionScope.id }">
	<c:if test="${!sessionScope.id eq 'admin' }">
		<c:redirect url="/main"></c:redirect>
	</c:if>
</c:if>
<article>
<h1>자원봉사 모집</h1>
<hr>
<form action='<c:url value="/volunteer/write" />' method="post" enctype="multipart/form-data">
<table id="cnotice">
<tr id="sub"><td >제목</td><td id="tsub"><input type="text" name="subject" id="title" placeholder="제목을 입력해주세요." autofocus required></td>
<td>
<select name="state" id="volselect">
 <option value="모집중">모집중</option>
 <option value="모집완료">모집완료</option>
</select>
</td>
</tr>
<tr><td class="tdtd">작성자</td><td class="tdtd" colspan="2"><input type="text" name="name" value="${sessionScope.id }" id="writer" readonly></td></tr>
<tr class="subsub"><td class="consub">내용</td><td class="consub" colspan="2" id="previewId"><textarea name="content" placeholder="내용을 입력해주세요." id="conupdate" required></textarea></td></tr>
 <tr class="subimg"><td>첨부파일</td><td colspan="2">
  <label class="file">
  <input type="file" name="file" id="file"></label>
  </td></tr>
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