<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/_common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="at_show">
		<table border='0'>
			<tr> <td>번호:</td> <td>${event.eventId}</td> <td>시작일:</td> <td>${event.eventStartDate}</td> <td>종료일:</td> <td>${event. eventEndDate}</td> <td><c:if test="${event.eventOngoing} eq 1}">진행</c:if></td></tr>
			<tr> <td>제목:</td> <td>${event.eventTitle}</td>  </tr>
			<tr> <td>내용:</td> 
				<td> <textarea rows="10" cols="64" readonly 
					>${event.eventContent}</textarea> </td>  </tr>
			<tr> <td>조회수:</td> <td>${event.readCount}번</td>  </tr>
			<tr> <td>좋아요수:</td> <td>${event.likeCount}번</td>  </tr>
			
			<tr> <td>좋아요회원들:</td> <td>${event.likeMembers}</td>  </tr>
			<tr> <td>태그들:</td> <td>${event.tags}</td>  </tr>
<!-- 			<tr> <td>첨부파일:</td>  -->
<!-- 			<td> -->
<%-- 				<c:if test="${fpsCount gt 0}"> --%>
<%-- 					<c:forEach var="fp" items="${fps}" varStatus="vs"> --%>
<%-- 						<%@ include file="_file.jsp" %>						 --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<!-- 			</td>  </tr> -->
<%-- 			<tr> <td>작성자ID:</td> <td>${article.memberId}</td>  </tr> --%>
			
			<tr> <td>생성일:</td> <td>
				<fmt:formatDate value="${event.eventCreatedAt}" 
				    pattern="yyyy년 MM월 dd일 - HH시 mm분 ss초" /></td>  </tr>
			<tr> <td>수정일:</td> <td>
				<fmt:formatDate value="${event.eventUpdatedAt}" 
				    pattern="yyyy년 MM월 dd일 - HH시 mm분 ss초" /></td>  </tr>
		</table>
		
		<c:if test="${not empty LoginName}">
		<div id="at_menu">
			<c:if test="${LoginName eq 'admin'}">
			<a href
	="${pageContext.request
.contextPath}/event_edit_form.fdl?evId=${event.eventId}">편집</a> | 
			<a href="#">삭제</a> |
			</c:if>
<!-- 			<a href="#">좋아요</a> |   -->
<%-- 			<a href="${pageContext.request --%>
<%-- .contextPath}/answer/new_form.fdl?mbId=${mbId}&evId=${article.id}">댓글추가</a> --%>
		</div>
		</c:if>		
	</div>
</body>
</html>