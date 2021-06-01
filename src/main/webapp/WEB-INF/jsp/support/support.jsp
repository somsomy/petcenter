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
<link href='<c:url value="/css/board/support.css" />' rel="stylesheet" type="text/css">

<script defer src='<c:url value="/script/support/support.js" />' ></script>

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">1:1후원</div>
<jsp:include page="../inc/supportSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>1:1 후원</h1>
<hr>
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login"></c:redirect>
</c:if>
<table class="table1">
	<tr><td rowspan="2"><img src='<c:url value="/upload/uploadImage/${cb.fileRealName }" />' width="300" height="300" ></td>
	<td>${cb.catName }</td></tr>
	<tr><td>입소날짜 : <fmt:formatDate value="${cb.date}" type="both" pattern="yyyy.MM.dd"/> | 나이 : ${cb.catAge }| 성별 : ${cb.catGender }</td></tr>
</table>
<span class="step"><span id="step1">후원정보 - 후원자정보</span> - 결제정보 - 후원완료</span>
<h2>후원정보</h2>
<hr>
<form action='<c:url value="/support/content" />' method="post" name="supForm">
<input type="hidden" name="catId" value="${cb.catId }">
<table class="supinfo" id="suptype">
<tr><td class="sub">유형</td>
<td class="info_ck" onclick="check()"><input type="radio" name="supportType" value="1회 일시후원" class="ckpoint" checked>1회 일시후원
<input type="radio" name="supportType" value="월 단위 정기후원" class="ckpoint">월 단위 정기후원
<input type="radio" name="supportType" value="year" class="ckpoint">년 단위 정기후원</td></tr>
<tr><td class="sub">후원금액</td>
<td class="info_ck" onclick="check()"><input type="radio" name="donation" value="10000" class="ckpoint" checked>1만원
<input type="radio" name="donation" value="20000" class="ckpoint">2만원
<input type="radio" name="donation" value="40000" class="ckpoint">4만원
<input type="radio" name="donation" value="60000" class="ckpoint">6만원
<input type="radio" name="donation" value="80000" class="ckpoint">8만원
<input type="radio" name="donation" value="100000" class="ckpoint">10만원
</td></tr>
<tr><td class="sub">년 단위 정기후원 종류 (년 후원 유형을 선택했을 경우만 선택)</td>
<td class="info_ck" onclick="check()"><input type="checkbox" name="yearCheck" value="입소날짜 기준 n주년 기념일" class="ckpoint">입소날짜 기준 n주년 기념일
<input type="checkbox" name="yearCheck" value="세계 고양이의 날(8/8)" class="ckpoint">세계 고양이의 날(8/8)
</td></tr>
<tr><td></td><td><span id="message"></span></td></tr>
</table>

<br>
<h2>후원자 정보</h2>
<hr>
<table class="supinfo" id="supporterInfo">
<tr><td>성함 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></td><td><input type="text" name="name" value="${mb.name }" required></td></tr>
<tr><td>휴대전화 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></td><td><input type="text" name="phone" value="${mb.phone }" required></td></tr>
<tr><td>이메일주소 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></td><td><input type="text" name="email" value="${mb.email }" required></td></tr>
</table>
<div id="wbtn">
<input type="submit" value="다음" class="writeBtn">
</div>
<div class="clear"></div>
</form>
</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>