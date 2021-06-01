<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 고양이의 하루</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">

<script defer src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/script/jquery-3.5.1.js" />'></script>
<script defer src='<c:url value="/script/postcode.js" />'></script>
<script defer src='<c:url value="/script/member/password.js" />'></script>
<script defer src='<c:url value="/script/member/dupcheck.js" />'></script>
<script defer src='<c:url value="/script/member/idcheck.js" />'></script>
<script defer src='<c:url value="/script/member/nickcheck.js" />'></script>
<script defer src='<c:url value="/script/member/email.js" />'></script>
<script defer src='<c:url value="/script/member/join.js" />'></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">회원가입</div>
<div id="sub_img_member"></div>
</div>
<article id="joinArticle">
<h1>회원가입</h1>
<hr>
<form action='<c:url value="/join" />'  name="fr" id="join" method="post" >
<fieldset>
<h3>아이디 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="id" class="id"  id="id" onkeyup="idCheck()" maxlength="20" required>
<input type="button" value="중복확인" class="iddup"><br>
<input type="hidden" id="id_dup" value="fail">
<span id="idCheck"></span>
<h3>비밀번호 <img src='<c:url value="images/dry-clean.png" />' class="dot"></h3>
<input type="password" name="pass" id="pass" maxlength="16"
placeholder="영문 대소문자, 숫자, 특수문자(!,@,#) 중 2가지 이상 포함한 8~16자리" 
onkeyup="check()" required/><br>
<input type="hidden" id="pass_reg" value="fail">
<span id="passCheck"></span>
<h3>비밀번호 확인 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="password" name="confirmPassword" id="confirmPassword" onkeyup='check()' maxlength="16" required /><br>
<input type="hidden" id="pass_confirm" value="fail">
<span id="message"></span>
<h3>성함 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="name" maxlength="10" required>
<h3>닉네임 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="nick" maxlength="10" class="id" id="nick" onkeyup="nickCheck()" required>
<input type="button" value="중복확인" class="nickdup"><br>
<input type="hidden" id="nick_dup" value="fail">
<span id="nickCheck"></span>
<h3>이메일 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="emailId" class="emailId" id="emailId" required>@
<input type="text" name="email" class="email" id="email" required>
<select name="customSelect" id="customSelect" onchange="emailSelect();">
 <option>직접입력</option>
  <option>naver.com</option>
  <option>gmail.com</option>
</select> <br>
<h3>휴대전화 <img src='<c:url value="/images/dry-clean.png" />' class="dot"></h3>
<input type="text" name="phone1" class="phone" maxlength="4" required> -
<input type="text" name="phone2" class="phone" maxlength="4" required> -
<input type="text" name="phone3" class="phone" maxlength="4" required>
</fieldset>

<fieldset>
<h3>우편번호</h3>
<input type="text" name="postCode" class="postCode" id="postCode" readonly>
<input type="button" value="우편번호 검색" class="dup" onclick="execDaumPostcode()"><br>
<h3>주소</h3>
<input type="text" name="address" id="address" placeholder="주소"><br>
<h3>상세주소</h3>
<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" >
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
</div>
</fieldset>
<div class="clear"></div>
</form>
</article>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>