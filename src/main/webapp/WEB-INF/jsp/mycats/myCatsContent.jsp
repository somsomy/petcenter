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
<link href='<c:url value="/css/member/myCats.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">나의 고양이들</div>
<hr id="texthr">
<div id="text2">회원님께서 후원하고 있는 고양이들.</div>
<jsp:include page="../inc/myPageSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>나의 고양이</h1>
<hr>
<div id="hinfo">회원님이 후원하고 있는 고양이</div>
<table class="mycatsTable">
<tr><td colspan="2"><img src='<c:url value="/upload/uploadImage/${scb.fileRealName }" />' width="300" height="300"></td></tr>
<tr><td class="tdtdtd">고양이 이름</td><td>${scb.catName }</td></tr>
<tr><td class="tdtdtd">고양이 나이</td><td>${scb.catAge }</td></tr>
<tr><td class="tdtdtd">고양이 성별</td><td>${scb.catGender }</td></tr>
</table>
<table class="mycatsTable" id="supInfo">
<tr><td colspan="2" id="supporter">후원정보</td></tr>
<tr><td class="tdtdtd">후원 유형</td><td>${scb.supportType }</td></tr>
<tr><td class="tdtdtd">후원 금액</td><td>${scb.donation }원</td></tr>
<c:if test="${!empty scb.yearDonation }">
<tr><td class="tdtdtd">년 단위 정기후원 종류</td><td>${scb.yearDonation}</td></tr>
</c:if>
<c:choose>
<c:when test="${scb.payment eq 'account' }">
	<tr><td class="tdtdtd">후원 결제방법</td><td>계좌이체</td></tr>
</c:when>
<c:otherwise>
	<tr><td class="tdtdtd">후원 결제방법</td><td>카드결제</td></tr>
</c:otherwise>
</c:choose>
<tr><td class="tdtdtd">후원 시작일</td><td>${scb.supportStart }</td></tr>
</table>
<div class="clear"></div>
<div id="wbtn">
<input type="button" value="후원정보수정" class="writeBtn" onclick="location.href='<c:url value="/mycats/update?num=${scb.num}" />'">
<input type="button" value="후원취소" class="writeBtn" onclick="location.href='<c:url value="/mycats/cancel?num=${scb.num}" />'">
</div>
</article>
</div>

</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>