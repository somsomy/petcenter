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
<link href='<c:url value="/css/member/myPage.css" />' rel="stylesheet" type="text/css">

<script defer src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/script/jquery-3.5.1.js" />'></script>

<script defer src='<c:url value="/script/postcode.js" />'></script>
<script defer src='<c:url value="/script/member/nickcheck.js" />'></script>
<script defer src='<c:url value="/script/member/dupcheck.js" />'></script>
<script defer src='<c:url value="/script/member/memberUpdate.js" />'></script>
</head>
<body>
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login"></c:redirect>
</c:if>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">마이페이지</div>
<hr id="texthr">
<div id="text2">회원정보</div>
<jsp:include page="../inc/myPageSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>나의 정보</h1>
<hr>
<div id="join" >
<div id="myinfo">
<fieldset>
<h3>아이디 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="id" class="myPageid"  maxlength="20" value="${mb.id }" readonly>
<h3>이름 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="name" maxlength="10" id="name"
placeholder="10자리 이하 사용 가능" value="${mb.name }" required><br>
<h3>닉네임 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="nick" value="${mb.nick }" maxlength="10" class="id" id="nick" onkeyup="nickCheck()" required>
<input type="button" value="중복확인" class="nickdup"><br>
<input type="hidden" id="nick_dup" value="fail">
<span id="nickCheck"></span>
<h3>이메일 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="email" name="email" id="myPageEmail" value="${mb.email }" required>
<h3>휴대전화 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="tel" name="phone" id="myPagePhone" value="${mb.phone }" maxlength="16" required>
<span class="phoneReg"></span>
<br>
</fieldset>

<fieldset>
<h3>우편번호</h3>
<input type="text" name="postCode" class="postCode" id="postCode" value="${mb.postCode }" readonly>
<input type="button" value="우편번호 검색" class="dup" onclick="execDaumPostcode()"><br>
<h3>주소</h3>
<input type="text" name="address" id="address" placeholder="주소" value="${mb.address }"><br>
<h3>상세주소</h3>
<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${mb.detailAddress }">
</fieldset>
</div>
<div class="clear"></div>
<div id="buttons1">
<input type="button" value="회원정보수정" class="submit">
<input type="reset" value="취소" class="cancel">
</div>
</div>
</article>
</div>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>