<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="/css/default.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/subpage.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/content.css" />' rel="stylesheet" type="text/css">
<link href='<c:url value="/css/volunteer/reply.css" />' rel="stylesheet" type="text/css">
<script src='<c:url value="/script/jquery-3.5.1.js" />'></script>
 <script defer src='<c:url value="/script/reply/replyUpdate.js" />'></script>
</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"/>

<div class="clear"></div>
<div id="divSub">
<div id="text">자원봉사</div>
<hr id="texthr">
<div id="text2">사랑의 손길을 내어주세요. </div>
<div id="sub_img"></div>
</div>
<div id="divArticle">
<article>
<h1>자원봉사 모집</h1>
<hr>
<table id="cnotice">
<tr id="sub"><td colspan="2">${vrbList.get(0).subject }</td></tr>
<tr><td colspan="2" id="write">${vrbList.get(0).name }</td></tr>
<tr><td class="tdtd">  작성일 <fmt:formatDate value="${vrbList.get(0).date}" type="both" pattern="yyyy.MM.dd HH:mm"/></td>
<td id="readtd">조회수 ${vrbList.get(0).readcount }</td></tr>
<tr id="cbtr"><td colspan="2" id="con">${vrbList.get(0).content }</td></tr>
<tr><td id="down" colspan="2">첨부파일 
<c:choose>
	<c:when test="${!empty vrbList.get(0).file  }">
		<a href='<c:url value="/images/uploadImage/${vrbList.get(0).file }" />' download>
			<c:set var="f" value="${vrbList.get(0).file }"></c:set>
			<c:set var="length" value="${fn:length(f) }"></c:set>
			<c:set var="idx" value="${fn:indexOf(f,'_')}"></c:set>
			<c:set var="filename" value="${fn:substring(f,idx+1,length)}"></c:set>
		${filename } 다운로드
		</a>	
	</c:when>
	<c:otherwise>
		없음
	</c:otherwise>
</c:choose>
</td></tr>
</table>
<input type="hidden" class="repNick" value="${mb.nick }">
<div class="outerReply">
<c:forEach var="vrb" items="${vrbList }">
	<c:if test="${vrb.repNum ne 0 }">
		<table id="reply">
			<tr>
			<td rowspan="3"><c:if test="${vrb.reLev > 0 }"><img src='<c:url value="/images/board/blank.png"/>' width="${vrb.reLev*5 }" ></c:if>
			</td>
			<c:choose>
				<c:when test="${empty vrb.deleteAt }">
					<td class="rep">${vrb.repName }</td>
					<td>
						<c:if test="${!empty sessionScope.id }">
							<c:if test="${!empty mb }">
								<c:if test="${mb.nick eq vrb.repName }">
									<a class="replyDelete">삭제</a>
									<a class="replyUpdate">수정</a>						
								</c:if>
							</c:if>
							<a class="replyWrite">답글</a>
						</c:if>
					</td>
					<tr><td class="rep" colspan="2"><fmt:formatDate value="${vrb.repDate}" type="both" pattern="yyyy.MM.dd HH:mm"/></td></tr>
					<tr>
					<td class="recon" colspan="2">${vrb.repContent }</td>
					</tr>
				</c:when>
				<c:otherwise>
					<td>삭제된 댓글입니다.</td>
				</c:otherwise>
			</c:choose>
			</tr>
		</table>
		<div class="replyUpdateContainer">
			<input type="hidden" id="repNum" value="${vrb.repNum }">
			<input type="hidden" class="reRef" value="${vrb.reRef}">
			<input type="hidden" class="reLev" value="${vrb.reLev}">
			<input type="hidden" class="reSeq" value="${vrb.reSeq}">
			<textarea name="content" class="repReWrite" >${vrb.repContent }</textarea>
			<input type="button" class="combtn2" value="작성">
			<input type="button" class="repUpdateCancel" value="취소">
		</div>
	</c:if>
</c:forEach>
</div>
<div id="page_control">

<c:if test="${pb.startPage > pb.pageBlock }">
	<a href='<c:url value="/volunteer/content?num=${vrbList.get(0).num}&pageNum=${pb.startPage - pb.pageBlock }" />'>이전</a>
</c:if>
<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
	<a href='<c:url value="/volunteer/content?num=${vrbList.get(0).num}&pageNum=${i }" />'>${i }</a>
</c:forEach>
<c:if test="${pb.endPage < pb.pageCount }">
	<a href='<c:url value="/volunteer/content?num=${vrbList.get(0).num}&pageNum=${pb.startPage + pb.pageBlock }" />'>다음</a>
</c:if>
</div>

<div id="comdiv">
<span id="com">댓글작성</span>
<input type="hidden" class="boardNum" name="boardNum" value="${vrbList.get(0).num }">
<c:choose>
	<c:when test="${!empty sessionScope.id }">
		<textarea name="content" id="comtext" onkeyup="resize(this)" ></textarea>
		<input type="button" class="combtn" value="작성">
	</c:when>
	<c:otherwise>
		<div>로그인이 필요합니다.</div>
	</c:otherwise>
</c:choose>
</div>
<div id="wbtn">
<input type="button" value="목록" class="writeBtn" onclick="location.href='<c:url value="/volunteer" />'" >

<c:if test="${!empty sessionScope.id }">
	<c:if test="${sessionScope.id eq 'admin' }">	
		<input type="button" value="글수정" class="writeBtn" onclick="location.href='<c:url value="/volunteer/update?num=${vrbList.get(0).num }" />'">
		<input type="button" value="글삭제" class="writeBtn" onclick="location.href='<c:url value="/volunteer/delete?num=${vrbList.get(0).num }&file=${f }" />'">
	</c:if>
</c:if>
</div>
<div class="clear"></div>

</article>
</div>
<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"/>
</div>
</body>
</html>