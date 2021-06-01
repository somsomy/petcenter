<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub_img_center"></div>
<nav id="sub_menu">
<ul>
<li onclick="location.href='<c:url value="/adopt/info" />'">입양안내</li>
<li onclick="location.href='<c:url value="/cats?state=protected" />'">보호중인 아이들</li>
<li onclick="location.href='<c:url value="/adopt" />' ">입양문의</li>
<li onclick="location.href='<c:url value="/cats?state=complete" />'">입양완료</li>
<li onclick="location.href='<c:url value="/adopt/review" />'">입양후기</li>
</ul>
</nav>