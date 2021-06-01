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
<c:if test="${empty sessionScope.id || sessionScope.id ne 'admin' }">
	<c:redirect url="/main"></c:redirect>
</c:if>
<jsp:useBean id="today" class="java.util.Date"/>
<article>
<h1>고양이 정보 수정</h1>
<hr>
<form action='<c:url value="/admin/cats/update" />'  method="post" enctype="multipart/form-data" name="fr">
<input type="hidden" name="catId" value="${cb.catId }">
<table id="catUpdateTab">
<tr><td class="sub"><label for="subject">고양이이름</label></td>
<td colspan="3" class="sub"><input type="text" name="catName" placeholder="고양이 이름을 입력해주세요." value="${cb.catName }" autofocus class="ttd" id="subject"></td></tr>
<tr><td colspan="4" id="writer">작성자 ${sessionScope.id }</td></tr>
<tr><td class="line" id="ph">나이</td><td class="line"><input type="text" name="catAge"  value="${cb.catAge }" class="input_ch"></td>
<td class="line" id="do">보호중/입양완료</td>
<td class="line">
<select name="catIng">
<option <c:if test="${cb.catIng eq '보호중'}">selected</c:if>>보호중</option>
<option <c:if test="${cb.catIng eq '입양완료'}">selected</c:if>>입양완료</option>
</select>
</td>
</tr>
<tr><td class="subsub">성별</td><td>
<input type="radio" name="catGender" value="수컷" <c:if test="${cb.catGender eq '수컷'}">checked</c:if>>수컷
 <input type="radio" name="catGender" value="암컷" <c:if test="${cb.catGender eq '암컷'}">checked</c:if>> 암컷</td>
<td class="subsub">중성화</td><td>
<input type="radio" name="catNeuter" value="O" <c:if test="${cb.catNeuter eq 'O'}">checked</c:if>>완료
 <input type="radio" name="catNeuter" value="X" <c:if test="${cb.catNeuter eq 'X'}">checked</c:if>> 안함
</tr>
<tr><td class="subsub">입소날짜</td><td>
<input type="date" name="catDate" max='<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>' value="${cb.catDate }" >
</td>
<td class="subsub">접종유무</td><td>
<input type="radio" name="catVaccination" value="O" <c:if test="${cb.catVaccination eq 'O'}">checked</c:if>>완료 
<input type="radio" name="catVaccination" value="X" <c:if test="${cb.catVaccination eq 'X'}">checked</c:if>>안함
</td></tr>
<tr><td class="subsub">특이사항</td><td colspan="3" id="previewId"><textarea name="catInfo" placeholder="내용을 입력해주세요.">${cb.catInfo }</textarea></td></tr>
 <tr id="abtd"><td class="subsub">이미지</td><td colspan="3">
  <label class="file">
  <input type="file" name="file" id="file" onchange="previewImage(this,'previewId')"></label>
   <input type="hidden" name="oldfile" value="${cb.fileRealName }">
  </td></tr>
</table>
<div id="wbtn">
<input type="submit" value="수정" class="writeBtn" >
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