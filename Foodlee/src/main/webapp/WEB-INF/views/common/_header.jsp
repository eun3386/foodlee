<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
 <div class="map_container">
     <div class="map_row">
         <div class="map_header">
             <div class="map_header_login">
             <c:if test="${empty LoginName}">
                 <a class="map_login" href="#">Login</a>
                 <a class="map_join" href="#">Join</a>
             </c:if>
             <c:if test="${not empty LoginName and LoginType eq 4}">	
             	<a href="${pageContext.request.contextPath}/my_page.fdl">마이페이지</a>
             	<a href="${pageContext.request.contextPath}/logout.fdl">로그아웃</a>
             </c:if>
             <c:if test="${not empty LoginName and LoginType eq 5}">
             	<a href="${pageContext.request.contextPath}/boss.fdl">마이페이지</a>
             	<a href="${pageContext.request.contextPath}/logout.fdl">로그아웃</a>
             </c:if>
             <c:if test="${not empty LoginName and LoginType eq 6}">
             	<a href="${pageContext.request.contextPath}/admin.fdl">어드민페이지</a>
             	<a href="${pageContext.request.contextPath}/logout.fdl">로그아웃</a>
             </c:if>
             </div>
             <!-- //header_menu -->
             <div class="map_header_tit">
                 <h1>Food Truck Nadeulee</h1><br>
                 <a class="map_hsub_tit" href="#">푸들이</a>
             </div>
             <!-- //header_tit -->
             <div class="map_header_icon">
                 <ol>
                     <li><a href="#"><i class="fa fa-html5" aria-hidden="true"></i><span>HTML5</span></a></li>
                     <li><a href="#"><i class="fa fa-github" aria-hidden="true"></i><span>GitHub</span></a></li>
                     <li><a href="#" class="facebook"><i class="fa fa-facebook-square" aria-hidden="true"></i><span>Fackbook</span></a></li>
                     <li><a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i><span>twitter</span></a></li>
                 </ol>
             </div>
             <!-- //header_icon -->
         </div>
     </div>
 </div>
 <!-- //nav -->
   <nav id="map_nav">
	<div class="map_container">
		<div class="map_row">
			<div class="map_nav">
				<h2 class="map_ir_su"></h2>
		        <div>
					<ol>
						<li><a class='e_home' href="#">홈</a></li>
					</ol>
		        </div>
		        <div>
					<ol>
						<li><a class="e_introduce" href="${pageContext.request.contextPath}/main.fdl#introduce">소개</a></li>
					</ol>
		        </div>
		        <div>
					<ol>
						<li><a href="${pageContext.request.contextPath}/main.fdl#truck-list">메뉴</a></li>
					</ol>
		        </div>
		        <div>
					<ol>
						<li><a class="e_event" href="${pageContext.request.contextPath}/main.fdl#event-list">이벤트</a></li>
					</ol>
		        </div>
<!-- 		        <div> -->
<!-- 					<ol> -->
<%-- 						<li><a id="s_search" href="#">${param[s_search] ? 's_search' : 'a' }</a></li> --%>
<!-- 					</ol> -->
<!-- 		        </div> -->
			</div>
		</div>
	</div>
</nav>
<!-- //nav -->
<article id="map_title">
	<div class="container">
		<div class="map_title">
			<h2>"푸드 트럭 찾을땐!? 푸들이~~"</h2>
<!-- 			<a href="#" class="btn"><i class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su"></span></a> -->
			<a href="#" class="map_btn"><i class="fas fa-bars fa" aria-hidden="true"></i><span class="ir_su"></span></a>
		</div>
	</div>
</article>
<!-- //title -->