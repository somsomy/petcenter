<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
  <link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
  <link href='<c:url value="/css/volunteer/volunteer.css" />' rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
  <jsp:include page="../inc/top.jsp"/>

  <div class="clear"></div>
  <div id="divSub">
    <div id="text">자원봉사</div>
    <hr id="texthr">
    <div id="text2">사랑의 손길을 내어주세요.</div>
    <div id="sub_img"></div>
  </div>
  <div id="divArticle">
    <article>
      <h1>자원봉사 모집</h1>
      <hr>
      <table id="notice">
        <tr>
          <th class="thno">No.</th>
          <th class="tno">모집상태</th>
          <th class="ttitle">제목</th>
          <th class="twrite">작성자</th>
          <th class="tdate">작성날짜</th>
          <th class="tread">조회수</th>
        </tr>
        <c:forEach var="vb" items="${vbList }">
          <tr onclick="location.href='<c:url value="/volunteer/content?num=${vb.num}"/>'" id="atr">
            <td>${vb.num}</td>
            <td>${vb.state}</td>
            <td id="tdSub">${vb.subject} <img src='<c:url value="/images/board/speech-bubble.png" />'
                                              width="15">${vb.replyCount }</td>
            <td>${vb.name}</td>
            <td><fmt:formatDate value="${vb.date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
            <td>${vb.readcount}</td>
          </tr>
        </c:forEach>
      </table>
      <div class="clear"></div>
      <div id="wbtn">
        <c:if test="${!empty sessionScope.id }">
          <c:if test="${sessionScope.id eq 'admin' }">
            <input type="button" value="글쓰기" class="writeBtn"
                   onclick="location.href='<c:url value="/volunteer/write"/>'">
          </c:if>
        </c:if>

      </div>
      <div class="clear"></div>
      <div id="table_search">
        <form action='<c:url value="/volunteer" />' method="get">
          <div id="divSearch">
            <input type="text" name="search" placeholder=" Search" class="input_box">
            <button><img src='<c:url value="/images/search.png" />' id="searchImg"></button>
          </div>
        </form>
      </div>
      <div class="clear"></div>
      <div id="page_control">
        <c:if test="${pb.startPage > pb.pageBlock }">
          <a href='<c:url value="/volunteer?pageNum=${pb.startPage - pb.pageBlock }&search=${pb.search}" />'>이전</a>
        </c:if>
        <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
          <a href='<c:url value="/volunteer?pageNum=${i }&search=${pb.search}" />'>${i }</a>
        </c:forEach>
        <c:if test="${pb.endPage < pb.pageCount }">
          <a href='<c:url value="/volunteer?pageNum=${pb.startPage + pb.pageBlock }&search=${pb.search}" />'>다음</a>
        </c:if>
      </div>
    </article>
  </div>
  <div class="clear"></div>
  <jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>



    