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
<c:choose>
	<c:when test="${cb.catIng eq '보호중' }">
		<div id="text">보호중인 아이들</div>
		<hr id="texthr">
		<div id="text2">고양이의 하루에서 안전하게 보호중인 아이들.</div>
	</c:when>
	<c:otherwise>
		<div id="text">입양완료</div>
		<hr id="texthr">
		<div id="text2">새로운 가족을 맞이한 아이들.</div>
	</c:otherwise>
</c:choose>
<jsp:include page="../inc/adoptSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<c:choose>
	<c:when test="${cb.catIng eq '보호중' }">
	<h1>보호중인 아이들</h1>
	</c:when>
	<c:otherwise>
	<h1>입양완료</h1>
	</c:otherwise>
</c:choose>
<hr>
<table id="cnotice">
<tr id="sub"><td colspan="2" >저는 고양이 '<span>${cb.catName }</span>' 입니다.</td></tr>
<tr><td class="td"><span>${cb.catGender }</span> 이구요.</td><td id="readtd">중성화 ${cb.catNeuter }</td></tr>
<tr><td class="td">나이는 <span>${cb.catAge }</span> 입니다.</td><td id="readtd">접종 ${cb.catVaccination }</td></tr>
<tr><td class="td">이곳에는 <span>${cb.catDate }</span> 에 왔어요!</td><td id="readtd">조회수 ${cb.readcount }</td></tr>
<tr><td id="con" colspan="2" ><img src='<c:url value="/upload/uploadImage/${cb.fileRealName }" />' id="conimg"></td></tr>
<tr><td colspan="2" id="con3">${cb.catInfo }</td></tr>
</table>
<div id="wbtn">
<%-- <input type="button" value="입양 문의하기" class="writeBtn" onclick="location.href='cadoptWriteForm.jsp?catId=<%=catId%>'"> --%>
</div>
<div class="clear"></div>

</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>