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

<script defer src='<c:url value="/script/support/support2.js" />' ></script>
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
<form action='<c:url value="/support/complete" />' method="post">
<input type="hidden" name="catId" value="${cb.catId }">
<input type="hidden" name="id" value="${sessionScope.id }">
<table class="table1">
	<tr><td rowspan="2"><img src='<c:url value="${cb.fileRealName }" />' width="300" height="300"></td>
	<td>${cb.catName }</td></tr>
	<tr><td>입소날짜 : <fmt:formatDate value="${cb.date}" type="both" pattern="yyyy.MM.dd"/> | 나이 : ${cb.catAge } | 성별 : ${cb.catGender }</td></tr>
</table>
<span class="step">후원정보 - 후원자정보 -<span id="step1"> 결제정보</span> - 후원완료</span>

<h2>결제정보</h2>
<hr>
<table class="supinfo" id="payInfo">
<c:choose>
	<c:when test="${sb.supportType eq 'year' }">
		<tr><td>후원 유형</td><td><input type="text" name="supportType" value="년 단위 정기후원" readonly></td></tr>
	</c:when>
	<c:otherwise>
		<tr><td>후원 유형</td><td><input type="text" name="supportType" value="${sb.supportType }" readonly></td></tr>	
	</c:otherwise>
</c:choose>
<tr><td>후원 금액</td><td><input type="text" name="donation" value="${sb.donation }" readonly></td></tr>
<c:if test="${!empty sb.yearCheck }">
<tr>
<td>년 단위 정기후원 종류</td><td><input type="text" name="yearDonation" value='<c:forEach var="yearSup" items="${sb.yearCheck }">${yearSup } </c:forEach>'  readonly></td>
</tr>
</c:if>

<tr><td>결제 방법</td><td class="pay" onclick="type()">
<input type="radio" name="payment" value="account"  class="ckpoint" id="ckaccount" checked >계좌이체 
<input type="radio" name="payment" value="creditCard"  class="ckpoint" id="ckcard">카드결제</td></tr>
<tr><td id="accNum">계좌번호</td><td><input type="text" name="payNum" required></td></tr>
<c:if test="${sb.supportType ne 'once' }">
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
<img src='<c:url value="/images/dry-clean.png" />' class="dot"> 정기후원의 경우 선택한 일에 자동이체가 됩니다.
</td>
</tr>
</c:if>

<tr><td id="accName">예금주명</td><td><input type="text" name="ownerName" required ></td></tr>
</table>
<div id="wbtn">
<input type="button" value="뒤로" class="writeBtn" onclick="history.back()">
<input type="submit" value="후원 완료하기" class="writeBtn">
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