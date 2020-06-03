<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <c:choose>
			<c:when test="${!empty asSize}">
				<ul>
					<c:forEach var="as" items="${answers}">
					<li>
<%-- 					 <b id="ascmp_${as.evAsId}"> --%>
<%-- 					<span class="heart" onclick="cmp_inc(${as.evAsId},${as.memberId},${as.articleId})">♥</span> --%>
<%-- 					${as.compassion}</b>  --%>
						 [${as.memberId}회원] 
						 ${as.evAsReply} - 
						 <fmt:formatDate  
						 value="${as.createdAt}"  
		pattern="yyyy년MM월dd일 (HH시mm분ss초)"/> / 
						 <fmt:formatDate  
						 value="${as.updatedAt}"  
		pattern="yyyy년MM월dd일 (HH시mm분ss초)"/>
				
				<c:if test="${!empty loginName and 
					 id eq as.memberId}">					
					<input type="button" value="편집" 
					 onclick
			="editAnswer(${as.evAsId},${as.memberId},${as.eventId})">
				</c:if>	
		
					</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:when test="${empty asSize}">
				<i>"아직 댓글이 없습니다!"</i>
			</c:when>
		</c:choose>