<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 | 고양이의 하루</title>
  <link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
  <link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <script src='<c:url value="/script/jquery-3.5.1.js" />'></script>
</head>
<body>
<div id="wrap">
  <jsp:include page="../inc/top.jsp"/>
  <div class="clear"></div>
  <div id="divSub">
    <div id="text">공지사항</div>
    <hr id="texthr">
    <div id="text2">고양이의 하루의 공지사항입니다.</div>
    <jsp:include page="../inc/petcenterSubMenu.jsp"></jsp:include>
  </div>
  <div id="divArticle">
    <article>
      <h1>공지사항</h1>
      <hr>
      <table id="notice">
        <tr>
          <th class="tno">No.</th>
          <th class="ttitle">제목</th>
          <th class="twrite">작성자</th>
          <th class="tdate">작성날짜</th>
          <th class="tread">조회수</th>
        </tr>
        <c:forEach var="nb" items="${nbList }">
          <tr onclick="location.href='<c:url value="/notice/content?num=${nb.num}"/>'" id="atr">
            <td>${nb.num }</td>
            <td class="left">${nb.subject }</td>
            <td>${nb.name }</td>
            <td><fmt:formatDate value="${nb.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
            <td>${nb.readcount }</td>
          </tr>
        </c:forEach>
      </table>
      <div class="clear"></div>
      <div id="wbtn">
        <c:if test="${!(empty sessionScope.id) }">
          <c:if test="${sessionScope.id eq 'admin' }">
            <input type="button" value="글쓰기" class="writeBtn" onclick="location.href='<c:url value="/notice/write"/>'">
          </c:if>
        </c:if>

      </div>
      <div class="clear"></div>
      <div id="table_search">
        <form action='<c:url value="/notice" />' method="get">
          <div id="divSearch">
            <input type="text" name="search" placeholder=" Search" class="input_box" id="search">
            <button><img src='<c:url value="/images/search.png" />' id="searchImg"></button>
          </div>
        </form>
      </div>
      <div class="clear"></div>
      <div id="page_control">
        <c:if test="${pb.startPage > pb.pageBlock }">
          <a href='<c:url value="/notice?pageNum=${pb.startPage - pb.pageBlock }&search=${pb.search}" />'>이전</a>
        </c:if>
        <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
          <a href='<c:url value="/notice?pageNum=${i }&search=${pb.search}" />'>${i }</a>
        </c:forEach>
        <c:if test="${pb.endPage < pb.pageCount }">
          <a href='<c:url value="/notice?pageNum=${pb.startPage + pb.pageBlock }&search=${pb.search}" />'>다음</a>
        </c:if>
      </div>
    </article>
  </div>
  <div class="clear"></div>
  <jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>