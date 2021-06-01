<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고양이의 하루</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/front.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/main/slide.css" />' rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script defer src='<c:url value="/script/main/slidescript.js" />' ></script>
</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>
<div class="clear"></div>
<div id="main_img">
 <ul id="slider">
  <li> <img class="mySlides" src='<c:url value="/images/main/main00.jpg" />' ></li>
  <li> <img class="mySlides" src='<c:url value="/images/main/main01.jpg" />' ></li>
  <li> <img class="mySlides" src='<c:url value="/images/main/main02.png" />' ></li>
 </ul>
<div class="slider-btns" id="next"><span>》</span></div>
<div class="slider-btns" id="previous"><span>《</span></div>
 <div id="slider-pagination-wrap">
   <ul>
   </ul>
 </div>
</div>
<article id="front">
<h1>보호중인 아이들</h1>
<hr>

<div id="divTable">
<table>
	<tr>
		<c:forEach var="cb" items="${cbList }">
			<td>
			<table onclick="location.href='<c:url value="/cats/content?catId=${cb.catId}" />'" class="ctable">
					<tr><td><img src='<c:url value="/upload/uploadImage/${cb.fileRealName }" />' ></td></tr>
			<tr><td>${cb.catName }</td></tr>
			</table>
			</td>
		</c:forEach>
	</tr>
</table>
</div>
<div class="clear"></div>
<div id="table_search">
<form action="../center/catsSearch.jsp" method="get">
<div id="divSearch">
<input type="text" name="search" placeholder=" Search" class="input_box" >
<button><img src='<c:url value="/images/search.png" />' id="searchImg"></button>
</div>
</form>
</div>
<div class="clear"></div>

<div id="page_control">
<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/main?pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/main?pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/main?pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>
</article>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>