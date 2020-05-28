<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.fdl.foodlee.controller.TruckDetailController" %>
<%
	String CON = application.getContextPath();
%>

<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link href="<%=CON%>/resources/css/truckDetail.css" rel="stylesheet">
<link href="<%=CON%>/resources/css/main.css" type="text/css" rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1zqc0e9b5c"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="resources/js/truckDetail.js"></script>
<body>

<!-- 	<div class="main_box"> -->
<!-- 		<div class="menu common"> -->
<!-- 		<p class="content">메뉴</p> -->
<!-- 		</div> -->
<!-- 		<div class="logo common"> -->
<!-- 			<p class="content">푸들이</p> -->
<!-- 		</div> -->
<!-- 		<div class="login common"> -->
<!-- 			<p class="content" style="padding-top: 25px;">회원가입 로그인</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div id="main-header">
        <div id="menu-list">
            <ul>
                <li><a href="#">위치찾기</a></li>
                <li><a href="#introduce">소개</a></li>
                <li><a href="#truck-list">푸드트럭</a></li>
                <li><a href="#event-list">이벤트</a></li>
            </ul>
        </div>
        <a href="${pageContext.request.contextPath}/main.fdl"><img class="logo" src="resources/css/imgs/logo.png"></a>
        <span id="loginjoin">
			<c:if test="${empty LoginName}">
			<a href="#" id='loginHeader'>로그인</a> / <a href="#" id='join'>회원가입</a>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 4}">
	        <a href="${pageContext.request.contextPath}/my_page.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 5}">
	        <a href="${pageContext.request.contextPath}/boss.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	    </span>
	    <span id="adminlogout">
	        <c:if test="${not empty LoginName and LoginType eq 6}">
	        <a href="${pageContext.request.contextPath}/admin.fdl" id='admin_page'>어드민페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
        </span>
    <hr class="line">
    </div>
	<div id="main_wrap">
	<div id="info">
		<div id="car_detail">
			<img src="<%=CON%>/resources/imgs/truckDetail/car.jpg"
				style="width: 350px; height: 250px; float: left; margin-bottom: 15px;">
			<div id="car_des"
				style="float: left; margin-left: 420px; position: absolute; font-family: '나눔바른고딕', sans-serif;">
				<h2 style="margin-top: 0; margin-bottom: 15px;"><c:out value="${foodT.foodtruckName}"/></h2>
				<div style="min-height: 110px;">
					<p><i class="fas fa-store"></i>   대표 메뉴 : <c:out value="${foodT.foodtruckMainMenu}"/></p>
					<p><i class="far fa-compass"></i>  위치 : <c:out value="${foodT.foodtruckMuni}"/>  <c:out value="${foodT.foodtruckLocation}"/></p>
					<i class="far fa-clock"></i>  영업시간 : <c:out value="${foodT.foodtruckOperationHour}"/>
				</div>
				<p />
				<div id="member_like" style="margin-top: 30px;">
				<!-- 공통 hidden 부분 -->
				<input id="sellerId" type="hidden" value="${foodT.sellerId}">
				<input id="login" type="hidden" value="${LoginName}">
				<input id="name" type="hidden" value="${member.name}">
				<input id="email" type="hidden" value="${member.email}">
				<input id="phoneNumber" type="hidden" value="${member.phoneNumber}">
				<input id="address" type="hidden" value="${member.address}">
				<input id="LoginType" type="hidden" value="${LoginType}">
				<span id="follow" tg_sr='${foodT.sellerId}' ses_mb='${id}' class="mb_follow">
					<i class="fas fa-heart fa-lg follow_${isAlreadyLiked ? 'red': 'orange'}"></i>
				</span>
				<span id="follow_cnt"><c:out value="${cntLikes}" default="0" /></span>
					<div style="float: left;">
						<i class="fas fa-map fa-lg"
							style="margin-left: 80px; position: absolute;"></i>
					</div>
				</div>
				<div id="follow_msg" style="margin-top: 5px; font-size: 11px; display:none; font-color: red;"></div>
				<c:if test="${isAlreadyLiked eq true}">
					<div class="follow_msg already" style="margin-top: 5px; font-size: 11px; font-color: red;">해당 푸드트럭을 좋아요 하고 있습니다.</div>
				</c:if>
			</div>
		</div>

		<div id="mask"></div>
		<div class="window" style="margin-top: 100px;">
			<div class="close_icon" style="vertical-align: middle; font-size:22px; height:35px; margin-top: 10px;">
				<font style="vertical-align: middle;"><c:out value="${foodT.foodtruckName}"/>의 위치</font>
				<input type="hidden" id="foodTName" value="${foodT.foodtruckName}">
				<input type="hidden" id="foodTMuni" value="${foodT.foodtruckMuni}">
				<input type="hidden" id="foodTLocation" value="${foodT.foodtruckLocation}">
				<a href="#" class="close" style="float: right;">
				<i class="fas fa-times fa-lg" style="color:red; padding-top: 3px; margin-right: 5px;"></i>
				</a>
				<!-- <i class="fas fa-times-circle fa-lg" style="color:red; padding-top: 3px;"></i> -->
			</div>
			<div id="map"
				style="width: 1000px; height: 500px; text-align: center; vertical-align: middle;"></div>
		</div>

		<div id="_order"
			style="width: 270px; border: 1px solid gray; margin: -1px; float: left; position: absolute; margin-left: 830px;">
			<div class="subtitle"
				style="width: 270px; height: 60px; background-color: black; display: table-cell; vertical-align: middle; color: white; font-size: 23px;">
				주문표 <i class="fas fa-trash" style="font-size: 17px;"></i>
			</div>
			<div>
				<div id="none">메뉴가 없습니다.</div>
				<ul class="truckDetailUL" id="menu_list"
					style="list-style: none; margin: 0; padding: 0; max-height: 360px; overflow-y: auto;">
				</ul>
			</div>
			<div id="sum" style="text-align: right; border-top: 1px solid gray;">
				합계 : <span id="priceSum">0</span>원
			</div>
			<div class="order_div">주문하기</div>
		</div>
	</div>
	<hr style="width: 90%; border: 0; height: 0px; background: orange;">
	<div class="tab">
		<input id="tab1" type="radio" name="tabs" checked>
		<!--디폴트 메뉴-->
		<label for="tab1">리뷰</label> <input id="tab2" type="radio" name="tabs">
		<label for="tab2">메뉴</label> <input id="tab3" type="radio" name="tabs">
<!-- 		<label for="tab3">정보</label> <input id="tab4" type="radio" name="tabs"> -->
		<label for="tab3">Q&amp;A</label>

		<section class="section" id="content1">
			<div id="reviews_section">
			<div id="reviews_window">
			
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
					<c:if test="${rv.reviewDepth eq 1}">padding-left: 40px;</c:if>
					">
					<ul class="truckDetailUL" style="list-style: none; padding: 0;">
						<li>
							<div style="float: left;">
							</div>
							<div class="nickname" style="padding-top: 2px;">
							<c:if test="${rv.reviewDepth eq 1}"><i class='fas fa-reply fa-rotate-180 fa-lg'></i></c:if>
							<c:choose>
							<c:when test="${rv.reviewDepth eq 0}">${rv.login}</c:when>
							<c:when test="${rv.reviewDepth eq 1}">사장님</c:when>
							</c:choose>
							</div>
							<div class="date" style="padding-top: 4px; font-size: 12px;">
							<span id="fmt_${rv.reviewId}"><fmt:formatDate value="${rv.reviewCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
							
							<c:if test="${rv.reviewContent ne '삭제된 리뷰입니다.'}">
								<span style="float: right; margin-right: 15px;">
								<c:if test="${rv.login eq LoginName}">
									<button id="mod_${rv.reviewId}" onclick="modify_review(${rv.reviewId})" 
									style="margin-bottom: 3px;">수정</button>
									<br><button onclick="del_review(${rv.reviewId}, ${rv.reviewDepth})" style="margin-bottom: 3px;">
									삭제</button>
									<br>
								</c:if>
								<c:if test="${sellerLogin.login eq LoginName and foodT.sellerId eq sellerId and rv.reviewDepth eq 0 and empty reviewList[vs.index+1].reviewPnum}">
									<button id="reply_button_${rv.reviewId}" onclick="reply_review(${rv.reviewId})">답변</button>
								</c:if>
								</span>
							</c:if>
							</div>
						</li>
						<li>
							<div id="con_${rv.reviewId}" style="padding-top: 15px;"><c:out value="${rv.reviewContent}"/>
							</div>
							<c:if test="${!empty rv.reviewPic}">
							
							<c:set var="flName" value="${rv.reviewPic}"></c:set>
							<%
								String filePath = (String)pageContext.getAttribute("flName");
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
							<c:forEach var="fp" items="${pageScope.fps}" varStatus="vs">
								<c:choose>
									<c:when test="${fn:endsWith(fp,'.png')
										or fn:endsWith(fp,'.jpg') 
										or fn:endsWith(fp,'.gif')}">
										<div id="file_show_${fp}" class="image_file">
											<img src="${pageContext.request.contextPath}${fp}" 
												style="margin-top:10px; width: 250px;">
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
							</c:if>
						</li>
					</ul>
				</div>
				</c:forEach>
				</div>
				<div id="read-more-review" style="text-align: center; font-size: 18px; vertical-align: middle; margin-bottom: 20px;
					background-color: DodgerBlue; opacity: 0.7; height: 30px; color: white; padding-top: 7px;">리뷰 더보기</div>
<%-- 				<c:if test="${foodT.sellerId ne sellerId}"> 리뷰 달기 판매자 금지--%>
				<div id="review-insert">
					<h3 style="padding-top: 10px;">리뷰달기</h3>
<!-- 					<div id="writeTextarea" style="border: 1px gray solid; min-height: 80px; overflow-x: hidden; -->
<!--  						max-height: 250px; border-radius: 3px 3px 3px 3px; overflow-y: auto; white-space: pre-line;"> -->
<!-- 					</div> -->
					<form action="${pageContext.request.contextPath}/new_review.fdl" method="post" enctype="multipart/form-data">
					<textarea name="reviewContent" id="re_area" wrap="hard" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="사진 업로드는 4개까지 가능합니다."
						style="resize:none; width: 800px; min-height: 80px; max-height: 180px;">${!empty rv ? rv.review_content:''}</textarea>
						<input type="hidden" name="sellerId" value="${foodT.sellerId}">
						<input type="hidden" name="login" value="${LoginName}">
						<input type="file" name="imgfiles" id="file_add" multiple="multiple" style="dispaly: none;">
						<button type="button" class="btn btn-primary" onclick="document.all.file_add.click();" 
						style="width: 100px; height: 30px; float: left; margin-top: 25px; font-size: 14px; font-color: #FF8868; 
	 						margin-left: -3px; background-color: orange; border: 1px solid gray;">이미지 추가</button>
						<button type="submit" id="review_add" style="width: 100px; height: 30px; float: right; margin-top: 25px; 
						margin-bottom: 30px; margin-left: -3px; background-color: orange; border: 1px solid gray;">리뷰달기</button>
				        <div id="img_pr" style="position: absolute; display:none; margin-top: 40px;"><br>이미지 미리보기</div>
				        <div class="imgs_wrap">
				            <img id="img"/>
				        </div>
					</form>
				</div>
<%-- 			</c:if> --%>
			</div>
<!-- 			<div id="test_list"></div> -->
		</section>

		<section class="section" id="content2">
			<div class="wrap2"
				style="overflow-x: auto; width: 800px; white-space: nowrap;">
				<c:forEach var="menu" items="${menuList}" varStatus="menuvs">
				<div class="add"
					style="border: 1px solid gray; width: 250px; margin-right: 5px; cursor: pointer;"
					onclick="addToList(${menuvs.count})">
					<img src="<%=CON%>/resources/imgs/truckDetail/sellerid/${menu.sellerId}/${menu.menuPic}"
						style="width: 250px; height: 150px;">
					<h3 id="pname${menuvs.count}"><c:out value="${menu.menuName}"/></h3>
					<span id="pprice${menuvs.count}"><c:out value="${menu.menuPrice}"/></span>원
				</div>
				</c:forEach>
			</div>
			<div>
				<h3>메뉴 목록</h3>
				<ul class="truckDetailUL" style="list-style: none; margin: 0; padding: 0;">
					<li>
						<table id="menu_table" style="margin-top: 10px;">
						<c:forEach var="menu" items="${menuList}" varStatus="menuvs">
							<tr style="cursor: pointer; border: 1px solid gray;" onclick="addToList(${menuvs.count})">
								<td>
									<div style="width: 650px;"><b><c:out value="${menu.menuName}"></c:out></b>
									<br><c:out value="${menu.menuPrice}"/>원
										<div style=""><c:out value="${menu.menuInfor}"/></div>
									</div>
								</td>
								<td style="border-left: none;"><img
									src="<%=CON%>/resources/imgs/truckDetail/sellerid/${menu.sellerId}/${menu.menuPic}"
									style="width: 130px; height: 100px;"></td>
						</c:forEach>
						</table>
					</li>
				</ul>
			</div>
		</section>

	<!-- 
	<section id="content3">
	<div style="margin-left: 15px; padding-bottom: 3px; border-bottom: 1px solid gray;">
		<i class="fas fa-store"></i> 업체정보
		<div style="padding: 5px;"><i style="color: #999; font-style: normal; width: 195px;
         	letter-spacing: -1px;">영업시간</i><span style="margin-left: 70px;">11:00 - 01:00</span></div>
	</div>
	</section>
	 -->
	
	<section class="section" id="content3">
	<div id="QnA_Section">
		<c:if test="${empty qnaList}">
			<hr>
				<h3 style="text-align: center; margin-top: 9px; margin-bottom: 9px;">QnA가 없습니다.</h3>
			<hr>
		</c:if>
		<c:forEach var="qna" items="${qnaList}" varStatus="qnavs">
			<div id="qna_id_${qna.qnaId}" class="qna_items"
				style="border: 1px solid #ccc; margin-bottom: -1px; padding-left: 10px;
				<c:if test="${qna.qnaDepth eq 1}">padding-left: 40px;</c:if>
				">
				<ul class="truckDetailUL" style="list-style: none; padding: 0;">
					<li>
						<div style="float: left;">
						</div>
						<div class="nickname" style="padding-top: 2px;">
						<c:choose>
							<c:when test="${qna.qnaSecret eq false}">
								<c:if test="${qna.qnaDepth eq 0}">${qna.login}</c:if>
								<c:if test="${qna.qnaDepth eq 1}"><i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님</c:if>
							</c:when>
							<c:when test="${qna.qnaSecret eq true}">
								<c:choose>
									<c:when test="${qna.qnaDepth eq 0}">
										<c:if test="${qna.login eq LoginName or sellerLogin.login eq LoginName}">
											<i class="fas fa-lock"></i> ${qna.login}
										</c:if>
									</c:when>
									<c:when test="${qna.qnaDepth eq 1}">
										<c:if test="${foodT.sellerId eq sellerId}">
											<i class="fas fa-lock"></i> <i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님
										</c:if>									
										<c:if test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum and qnaList[qnavs.index-1].login eq LoginName}">
											<i class="fas fa-lock"></i> <i class='fas fa-reply fa-rotate-180 fa-lg'></i>사장님
										</c:if>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
						</div>
						<div class="date" style="padding-top: 4px; font-size: 12px;">
						<span id="fmt_qna_${qna.qnaId}">
						<c:choose>
							<c:when test="${qna.qnaSecret eq false}">
								<fmt:formatDate value="${qna.qnaCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:when>
							<c:when test="${qna.qnaSecret eq true}">
								<c:choose>
									<c:when test="${qna.qnaDepth eq 0}">
										<c:if test="${qna.login eq LoginName or sellerLogin.login eq LoginName}">
											<fmt:formatDate value="${qna.qnaCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</c:if>
									</c:when>
									<c:when test="${qna.qnaDepth eq 1}">
									<c:if test="${foodT.sellerId eq sellerId}">
										<fmt:formatDate value="${qna.qnaCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</c:if>	
									<c:if test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum and qnaList[qnavs.index-1].login eq LoginName}">
										<fmt:formatDate value="${qna.qnaCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</c:if>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
						</span>
						
						<c:if test="${qna.qnaContent ne '삭제된 QnA입니다.'}">
							<span style="float: right; margin-right: 15px;">
							<c:if test="${qna.login eq LoginName}">
								<button id="mod_qna_${qna.qnaId}" onclick="modify_qna(${qna.qnaId})" 
								style="margin-bottom: 3px;">수정</button>
								<br><button onclick="del_qna(${qna.qnaId}, ${qna.qnaDepth})" style="margin-bottom: 3px;">
								삭제</button>
								<br>
							</c:if>
							<c:if test="${sellerLogin.login eq LoginName and foodT.sellerId eq sellerId and qna.qnaDepth eq 0 and empty qnaList[qnavs.index+1].qnaPnum}">
								<input type="hidden" id="hdSecret_${qna.qnaId}" value="${qnaList[qnavs.index].qnaSecret}">
								<button id="reply_button_qna_${qna.qnaId}" onclick="reply_qna(${qna.qnaId})">답변</button>
							</c:if>
							</span>
						</c:if>
						</div>
					</li>
					<li>
					<div id="con_qna_${qna.qnaId}" style="padding-top: 15px;">
					<c:choose>
						<c:when test="${qna.qnaSecret eq false}"><c:out value="${qna.qnaContent}"/></c:when>
						<c:when test="${qna.qnaSecret eq true}">
							<c:choose>
								<c:when test="${qna.qnaDepth eq 0}">
									<c:if test="${qna.login eq LoginName}">
										<c:out value="${qna.qnaContent}"/>
									</c:if>
									<c:if test="${qna.login ne LoginName and foodT.sellerId eq sellerId}">
										<c:out value="${qna.qnaContent}"/>
									</c:if>
									<c:if test="${qna.login ne LoginName and foodT.sellerId ne sellerId}">
										<i class="fas fa-lock" style="padding-bottom: 16px;"></i> 해당 QnA는 비밀글 입니다.
									</c:if>
								</c:when>
								<c:when test="${qna.qnaDepth eq 1}">
									<c:choose>
										<c:when test="${qnaList[qnavs.index-1].qnaId eq qnaList[qnavs.index].qnaPnum}">
											<c:if test="${foodT.sellerId eq sellerId}">
												<c:out value="${qna.qnaContent}"/>
											</c:if>
											<c:if test="${qnaList[qnavs.index-1].login eq LoginName}">
												<c:out value="${qna.qnaContent}"/>
											</c:if>
											<c:if test="${foodT.sellerId ne sellerId and qnaList[qnavs.index-1].login ne LoginName}">
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
			<div id="read-more-qna" style="text-align: center; font-size: 18px; vertical-align: middle;
				background-color: DodgerBlue; opacity: 0.7; height: 30px; color: white; padding-top: 7px;">Q&amp;A 더보기</div>
				<div id="qna-insert">
					<h3 style="padding-top: 10px;">QnA달기</h3>
					<form action="${pageContext.request.contextPath}/new_qna.fdl" method="post">
					<span style="float: left; margin-bottom: 3px;">
					<!-- <input type='hidden' name="secret"> -->
					<input type="checkbox" name="secret" value="true" style="display: inline;">비밀글 여부</span>
					<input type="hidden" name="login" value="${LoginName}">
					<input type="hidden" name="sellerId" value="${foodT.sellerId}">
					<textarea name="qnaContent" id="re_area_qna" wrap="hard" onkeydown="resize(this)" onkeyup="resize(this)"
						style="resize:none; width: 800px; min-height: 80px; max-height: 180px;">${!empty qna ? qna.qna_content:''}</textarea>
						<button type="submit" id="qna_add" style="width: 100px; height: 30px; float: right; margin-top: 25px; 
						margin-bottom: 30px; margin-left: -3px; background-color: orange; border: 1px solid gray;">QnA달기</button>
					</form>
				</div>
		</div>
		
	</section>
	
	</div>
		<!-- 		<section id="content3"> -->
		<!-- 			<p>tab menu3의 내용</p> -->
		<!-- 		</section> -->

		<!-- 		<section id="content4"> -->
		<!-- 			<p>tab menu4의 내용</p> -->
		<!-- 		</section> -->
	<footer id="map_footer">
		<jsp:include page="common/_footer.jsp" />
	</footer>
</div>
</body>

</html>
