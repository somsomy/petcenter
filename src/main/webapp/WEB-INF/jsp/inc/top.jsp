<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
 <link rel="stylesheet" href='<c:url value="/css/main/dropdown.css" />' />
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"><header>
	
<c:if test="${empty sessionScope.id }">
	<div id="login"><a href='<c:url value="/" />' >홈 | </a> <a href='<c:url value="/login" />' >로그인</a> | <a href='<c:url value="/join" />' >회원가입</a></div>
</c:if>
<c:if test="${!(empty sessionScope.id) }">
	<div id="login">${sessionScope.id }님 | <a href='<c:url value="/logout" />' >로그아웃</a> | 
		<c:choose>
			<c:when test="${sessionScope.id eq 'admin' }">
				<a href='<c:url value="/admin/cats" />' >관리페이지</a>			
			</c:when>	
			<c:otherwise>
				<a href='<c:url value="/mypage" />' >마이페이지</a>			
			</c:otherwise>
		</c:choose>
	
	
	
	</div>
</c:if>

<div id="catcenter">고양이보호센터</div>

<div class="clear"></div>
<hr color="#EAEAEA">
<div id="logo"><a href='<c:url value="/" />' ><img src='<c:url value="/images/logo.png" />' width="280" height="75" alt="Fun Web"></a></div>

<nav id="top_menu">
<ul class="tmenu">
	<li class="tl"><a href='<c:url value="/welcome" />' class="ta">고양이의 하루</a>
	 <ul class="submenu">
	 	<li><a href='<c:url value="/welcome" />'>보호센터 소개</a></li>
	 	<li><a href='<c:url value="/notice" />'>공지사항</a></li>
	 	<li><a href='<c:url value="/map" />'>센터 위치</a></li>
	 </ul>
	</li>
<!-- 	<li class="tl"><a href="../catfind/catFind.jsp" class="ta">고양이를 찾습니다</a> -->
<!-- 	 <ul class="submenu"> -->
<!-- 	 	<li><a href="../catfind/catFind.jsp" >찾습니다</a></li> -->
<!-- 	 	<li><a href="../catfind/catFound.jsp" >찾았어요</a></li> -->
<!-- 	 </ul> -->
<!-- 	</li> -->
	<li class="tl"><a href='<c:url value="/adopt/info" />' class="ta">고양이를 입양합니다</a>
	 <ul class="submenu">
	 	<li><a href='<c:url value="/adopt/info" />' >입양 안내</a></li>
	 	<li><a href='<c:url value="/cats?state=protected" />'>보호중인 아이들</a></li>
	 	<li><a href='<c:url value="/adopt" />' >입양문의</a></li>
	 	<li><a href='<c:url value="/cats?state=complete" />'>입양 완료</a></li>
	 	<li><a href='<c:url value="/adopt/review" />' >입양 후기</a></li>
	 </ul>
	</li>
	<li class="tl"><a href='<c:url value="/support" />' class="ta">고양이에게 후원합니다</a>
	 <ul class="submenu">
	 	<li><a href="#" >후원 안내</a></li>
	 	<li><a href='<c:url value="/support" />'  >1:1 후원</a></li>
	 </ul>
	</li>
	<li class="tl"><a href='<c:url value="/volunteer" />' class="ta">자원봉사</a></li>
    <li class="tl"><a href='<c:url value="/qna" />' class="ta">문의합니다</a></li>
</ul>
</nav>
</header>