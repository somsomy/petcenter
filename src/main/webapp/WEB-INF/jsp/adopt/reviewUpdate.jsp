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
<div id="text">입양후기</div>
<hr id="texthr">
<div id="text2">가족을 만나 행복한 하루를 보내는 아이들.</div>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">

<article>
<h1>입양 후기</h1>
<hr>
<form action='<c:url value="/adopt/review/update" />'  method="post" enctype="multipart/form-data" >
<input type="hidden" name="num" value="${rb.num }">
<table id="cnotice">
<tr id="sub"><td >제목</td><td id="tsub"><input type="text" name="subject" id="title" placeholder="제목을 입력해주세요." value="${rb.subject }" required></td></tr>
<tr><td class="tdtd">작성자</td><td class="tdtd"><input type="text" name="name" value="${rb.name }" id="writer" readonly></td></tr>
<tr class="subsub"><td class="consub">내용</td><td class="consub" id="previewId">
<c:if test="${!empty rb.fileRealName }">
<img src='<c:url value="/upload/uploadImage/${rb.fileRealName }" />' id=conimg>
</c:if>
<textarea name="content" placeholder="내용을 입력해주세요." id="conupdate" required>${rb.content }</textarea></td></tr>
<tr id="abtd"><td>이미지</td><td colspan="3">
  <label class="file">
  <input type="file" name="file" id="file" onchange="previewImage(this,'previewId')"></label>
  <input type="hidden" name="oldfile" value="${rb.fileRealName }">
  </td></tr>
</table>
<div id="wbtn">
<input type="submit" value="글수정" class="writeBtn">
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