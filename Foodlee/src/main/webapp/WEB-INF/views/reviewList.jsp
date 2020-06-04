<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fdl.foodlee.controller.TruckDetailController"%>
<%
	String CON = application.getContextPath();
%>

<c:choose>
<c:when test="${empty reviewList}">
	<c:if test="${empty LoginName}">
		<hr>
			<h3 style="text-align: center; margin-top: 9px; margin-bottom: 9px;">
				로그인 하셔서 첫 번째 리뷰를 달아주세요.
			</h3>
		<hr>
	</c:if>
	<c:if test="${not empty LoginName}">
		<hr>
			<h3 style="text-align: center; margin-top: 9px; margin-bottom: 9px;">
				첫 번째 리뷰를 달아주세요.
			</h3>
		<hr>
	</c:if>
</c:when>
</c:choose>

<c:forEach var="rv" items="${reviewList}" varStatus="vs">
	<div id="reply_${rv.reviewId}" class="reply"
		style="border: 1px solid #ccc; margin-bottom: -1px; padding-left: 10px;
	<c:if test="${rv.reviewDepth eq 1}">padding-left: 40px;</c:if>">
		<ul class="truckDetailUL" style="list-style: none; padding: 0;">
			<li>
				<div style="float: left;"></div>
				<div class="nickname" style="padding-top: 2px;">
					<c:if test="${rv.reviewDepth eq 1}">
						<i class='fas fa-reply fa-rotate-180 fa-lg'></i>
					</c:if>
					<c:choose>
						<c:when test="${rv.reviewDepth eq 0}">${rv.login}</c:when>
						<c:when test="${rv.reviewDepth eq 1}">사장님</c:when>
					</c:choose>
				</div>
				<div class="date" style="padding-top: 4px; font-size: 12px;">
					<span id="fmt_${rv.reviewId}"><fmt:formatDate
							value="${rv.reviewCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /> </span>
					
					<c:if test="${rv.reviewContent ne '삭제된 리뷰입니다.'}">
						<span style="float: right; margin-right: 15px;"> <c:if
								test="${rv.login eq LoginName}">
								<button id="mod_${rv.reviewId}"
									onclick="modify_review(${rv.reviewId})"
									style="margin-bottom: 3px;">수정</button>
								<br>
								<button onclick="del_review(${rv.reviewId}, ${rv.reviewDepth})"
									style="margin-bottom: 3px;">삭제</button>
								<br>
							</c:if> 
							
							<c:if test="${foodT.sellerId eq sellerId and rv.reviewDepth eq 0 and empty reviewList[vs.index+1].reviewPnum}">
								<button id="reply_button_${rv.reviewId}"
									onclick="reply_review(${rv.reviewId})">답변</button>
							</c:if>
						</span>
					</c:if>
				</div>
			</li>
			<li>
				<div id="con_${rv.reviewId}" style="padding-top: 15px;">
					<c:out value="${rv.reviewContent}" />
				</div> <c:if test="${!empty rv.reviewPic}">

					<c:set var="flName" value="${rv.reviewPic}"></c:set>
					<%
						String filePath = (String) pageContext.getAttribute("flName");
					String fps[] = null;
					int fpsCount = 1;
					if (filePath != null && !filePath.isEmpty()) {
						if (filePath.indexOf("|") != -1) {
							fps = filePath.split("\\" + "|");
							fpsCount = fps.length;
						} else {
							fpsCount = 1;
							fps = new String[] { filePath };
						}
					} else {
						fpsCount = 0;
					}
					pageContext.setAttribute("fps", fps);
					%>
					<div id="file_show" class="image_file">
					<c:forEach var="fp" items="${pageScope.fps}" varStatus="vs">
						<c:choose>
							<c:when
								test="${fn:endsWith(fp,'.png')
						or fn:endsWith(fp,'.jpg') 
						or fn:endsWith(fp,'.gif')}">
									<img src="${pageContext.request.contextPath}${fp}" 
										style="margin-top: 10px;
										width: 250px; ">
							</c:when>
						</c:choose>
					</c:forEach>
					</div>
				</c:if>
			</li>
		</ul>
	</div>
</c:forEach>