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
<script defer src='<c:url value="/script/support/support2.js" />' ></script>
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
<h1>나의 고양이들</h1>
<hr>
<div id="hinfo">회원님이 후원하고 있는 고양이들</div>
<table class="mycats">
<tr><td colspan="2"><img src='<c:url value="/upload/uploadImage/${scb.fileRealName }" />' class="mycatsImg"></td></tr>
<tr><td class="tdtdtd">고양이 이름</td><td>${scb.catName }</td></tr>
<tr><td class="tdtdtd">고양이 나이</td><td>${scb.catAge }</td></tr>
<tr><td class="tdtdtd">고양이 성별</td><td>${scb.catGender }</td></tr>
</table>
<form action='<c:url value="/mycats/update" />' method="post">
<input type="hidden" name="num" value="${scb.num }">
<h2>후원정보</h2>
<hr>
<table class="supinfo" id="suptype">
<tr><td class="sub">유형</td>
<td class="info_ck" onclick="check()"><input type="radio" name="supportType" value="1회 일시후원" class="ckpoint" checked>1회 일시후원
<input type="radio" name="supportType" value="월 단위 정기후원" class="ckpoint">월 단위 정기후원
<input type="radio" name="supportType" value="year" class="ckpoint">년 단위 정기후원</td></tr>
<tr><td class="sub">후원금액</td>
<td class="info_ck" onclick="check()"><input type="radio" name="donation" value="10000" checked>1만원
<input type="radio" name="donation" value="20000" class="ckpoint">2만원
<input type="radio" name="donation" value="40000" class="ckpoint">4만원
<input type="radio" name="donation" value="60000" class="ckpoint">6만원
<input type="radio" name="donation" value="80000" class="ckpoint">8만원
<input type="radio" name="donation" value="100000" class="ckpoint">10만원
</td></tr>
<tr><td class="sub">년 단위 정기후원 종류 (년 후원 유형을 선택했을 경우만 선택)</td>
<td onclick="check()"><input type="checkbox" name="yearCheck" value="입소날짜 기준 n주년 기념일">입소날짜 기준 n주년 기념일
<input type="checkbox" name="yearCheck" value="세계 고양이의 날(8/8)">세계 고양이의 날(8/8)
</td></tr>
<tr><td></td><td><span id="message"></span></td></tr>
</table>
<h2>결제정보</h2>
<hr>
<table class="supinfo" id="payInfo">
<tr><td>결제 방법</td><td class="pay" onclick="type()">
<input type="radio" name="payment" value="account" class="ckpoint" id="ckaccount" checked >계좌이체 
<input type="radio" name="payment" value="creditCard" class="ckpoint" id="ckaccount">카드결제</td></tr>
<tr><td id="accNum">계좌번호</td><td><input type="text" name="payNum"></td></tr>
<tr><td>이체시작날짜</td>
<td>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
<select name="year">
<c:forEach var="i" begin="${year }" end="${year + 10 }">
	 <option value="${i }">${i }년</option>
</c:forEach>
</select>
<fmt:formatDate var="month" value="${now}" pattern="MM"/>
<select name="month">
 <c:forEach var="i" begin="${month}" end="${12}">
 	 <option value="${i }">${i }월</option>
 </c:forEach>
 </select>
 <select name="day">
 <option value="5">5일</option>
 <option value="10">10일</option>
 <option value="20">20일</option>
</select>
<img src='<c:url value="/images/dry-clean.png" />'  class="dot"> 정기후원의 경우 선택한 일에 자동이체가 됩니다.
</td>
</tr>
<tr><td id="accName">예금주명</td><td><input type="text" name="ownerName" ></td></tr>
</table>
<div class="clear"></div>
<div id="wbtn">
<input type="submit" value="후원정보수정" class="writeBtn" >
</div>
</form>
</article>
</div>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</body>
</html>