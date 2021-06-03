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
<link href='<c:url value="/css/board/findUpdate.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<jsp:useBean id="today" class="java.util.Date"/>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="divSub">
<div id="text">관리자 고양이 등록</div>
<hr id="texthr">
<div id="text2">고양이 등록 / 취소 관리</div>
<jsp:include page="../inc/catsSubMenu.jsp"></jsp:include>
</div>
<div id="divArticle">
<article>
<h1>고양이 정보</h1>
<hr>
<table id="catUpdateTab">
<tr><td class="sub"><label for="subject">고양이이름</label></td><td colspan="3" class="sub"><input type="text" name="catName" value="${cb.catName }" class="ttd" id="subject"></td></tr>
<tr><td colspan="4" id="writer">작성자 ${sessionScope.id }</td></tr>
<tr><td class="line" id="ph">나이</td><td class="line">${cb.catAge }</td>
<td class="line" id="do">보호중/입양완료</td>
<td class="line">
${cb.catIng }
</td>
</tr>
<tr><td class="subsub">성별</td><td>
${cb.catGender }</td>
<td class="subsub">중성화</td><td>
${cb.catNeuter }
</tr>
<tr><td class="subsub">입소날짜</td><td>
<input type="date" name="catDate" max='<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>'  value="${cb.catDate }" readonly>
</td>
<td class="subsub">접종유무</td><td>
${cb.catVaccination }
</td></tr>
<tr><td class="subsub">이미지</td><td colspan="3"><img src='<c:url value="${cb.fileRealName }" />' width="300" height="300"></td></tr>
<tr><td class="subsub">특이사항</td><td colspan="3" id="previewId"><textarea name="catInfo" placeholder="내용을 입력해주세요." readonly>${cb.catInfo }</textarea></td></tr>
</table>
<div id="wbtn">
<input type="button" value="수정하기" class="writeBtn" onclick="location.href='<c:url value="/admin/cats/update?catId=${cb.catId}" />' " >
<input type="button" value="삭제하기" class="writeBtn" onclick="location.href='<c:url value="/admin/cats/delete?catId=${cb.catId}" />'">
</div>
<div class="clear"></div>

</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>