<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${empty qnaList}">
	<hr>
	<h3 style="text-align: center; margin-top: 9px; margin-bottom: 9px;">QnA가
		없습니다.</h3>
	<hr>
</c:if>
<c:forEach var="qna" items="${qnaList}" varStatus="qnavs">
	<div id="qna_id_${qna.qnaId}" class="qna_items"
		style="border: 1px solid #ccc; margin-bottom: -1px; padding-left: 10px;
				<c:if test="${qna.qnaDepth eq 1}">padding-left: 40px;</c:if>
				">
		<ul class="truckDetailUL" style="list-style: none; padding: 0;">
			<li>
				<div style="float: left;"></div>
				<div class="nickname" style="padding-top: 2px;">
					<c:choose>
						<c:when test="${qna.qnaSecret eq false}">
							<c:if test="${qna.qnaDepth eq 0}">${qna.login}</c:if>
							<c:if test="${qna.qnaDepth eq 1}">
								<i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님</c:if>
						</c:when>
						<c:when test="${qna.qnaSecret eq true}">
							<c:choose>
								<c:when test="${qna.qnaDepth eq 0}">
									<c:if test="${qna.login eq LoginName}">
										<i class="fas fa-lock"></i> ${qna.login}
										</c:if>
									<c:if test="${foodT.sellerId eq sellerId}">
										<i class="fas fa-lock"></i> ${qna.login}
										</c:if>
								</c:when>
								<c:when test="${qna.qnaDepth eq 1}">
									<c:if test="${foodT.sellerId eq sellerId}">
										<i class="fas fa-lock"></i>
										<i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님
										</c:if>
									<c:if
										test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum and qnaList[qnavs.index-1].login eq LoginName}">
										<i class="fas fa-lock"></i>
										<i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님
										</c:if>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</div>
				<div class="date" style="padding-top: 4px; font-size: 12px;">
					<span id="fmt_qna_${qna.qnaId}"> <c:choose>
							<c:when test="${qna.qnaSecret eq false}">
								<fmt:formatDate value="${qna.qnaCreatedAt}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</c:when>
							<c:when test="${qna.qnaSecret eq true}">
								<c:choose>
									<c:when test="${qna.qnaDepth eq 0}">
										<c:if test="${qna.login eq LoginName}">
											<fmt:formatDate value="${qna.qnaCreatedAt}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
										<c:if test="${foodT.sellerId eq sellerId}">
											<fmt:formatDate value="${qna.qnaCreatedAt}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
									</c:when>
									<c:when test="${qna.qnaDepth eq 1}">
										<c:if test="${foodT.sellerId eq sellerId}">
											<fmt:formatDate value="${qna.qnaCreatedAt}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
										<c:if
											test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum and qnaList[qnavs.index-1].login eq LoginName}">
											<fmt:formatDate value="${qna.qnaCreatedAt}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</span>

					<c:if test="${qna.qnaContent ne '삭제된 QnA입니다.'}">
						<span style="float: right; margin-right: 15px;"> <c:if
								test="${qna.login eq LoginName}">
								<button id="mod_qna_${qna.qnaId}"
									onclick="modify_qna(${qna.qnaId})" style="margin-bottom: 3px;">수정</button>
								<br>
								<button onclick="del_qna(${qna.qnaId}, ${qna.qnaDepth})"
									style="margin-bottom: 3px;">삭제</button>
								<br>
							</c:if> <c:if
								test="${foodT.sellerId eq sellerId and qna.qnaDepth eq 0 and empty qnaList[qnavs.index+1].qnaPnum}">
								<input type="hidden" id="hdSecret_${qna.qnaId}"
									value="${qnaList[qnavs.index].qnaSecret}">
								<button id="reply_button_qna_${qna.qnaId}"
									onclick="reply_qna(${qna.qnaId})">답변</button>
							</c:if>
						</span>
					</c:if>
				</div>
			</li>
			<li>
				<div id="con_qna_${qna.qnaId}" style="padding-top: 15px;">
					<c:choose>
						<c:when test="${qna.qnaSecret eq false}">
							<c:out value="${qna.qnaContent}" />
						</c:when>
						<c:when test="${qna.qnaSecret eq true}">
							<c:choose>
								<c:when test="${qna.qnaDepth eq 0}">
									<c:if test="${qna.login eq LoginName}">
										<c:out value="${qna.qnaContent}" />
									</c:if>
									<c:if
										test="${qna.login ne LoginName and foodT.sellerId eq sellerId}">
										<c:out value="${qna.qnaContent}" />
									</c:if>
									<c:if
										test="${qna.login ne LoginName and foodT.sellerId ne sellerId}">
										<i class="fas fa-lock" style="padding-bottom: 16px;"></i> 해당 QnA는 비밀글 입니다.
									</c:if>
								</c:when>
								<c:when test="${qna.qnaDepth eq 1}">
									<c:choose>
										<c:when
											test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum}">
											<c:if test="${foodT.sellerId eq sellerId}">
												<c:out value="${qna.qnaContent}" />
											</c:if>
											<c:if test="${qnaList[qnavs.index-1].login eq LoginName}">
												<c:out value="${qna.qnaContent}" />
											</c:if>
											<c:if
												test="${foodT.sellerId ne sellerId and qnaList[qnavs.index-1].login ne LoginName}">
												<i class="fas fa-lock" style="padding-bottom: 16px;"></i> 해당 QnA는 비밀글 입니다.
											</c:if>
										</c:when>
									</c:choose>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</div>
			</li>
		</ul>
	</div>
</c:forEach>