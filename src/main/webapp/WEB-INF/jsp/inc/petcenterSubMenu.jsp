<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub_img"></div>
<nav id="sub_menu">
<ul>
<li onclick="location.href='<c:url value="/welcome" />' ">보호센터 소개</li>
<li onclick="location.href='<c:url value="/notice" />' ">공지사항</li>
<li onclick="location.href='<c:url value="/map" />'">센터 위치</li>
</ul>
</nav>
