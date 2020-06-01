<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	<%
		String CON = application.getContextPath();
	%>
		<div id="trucklist_all_page">
			<div id="trucklist_page" class="tl_page">	
				<div id="trucklist_nav">
					<div id="ranktrucks" style="display: inline-block">
						<em>Top 10 푸드 트럭 리스트</em>
					</div>
				
					<div id="truck_search" style="display: inline-block">
						<input type="search" name="search" placeholder="검색" id="ft_search">
					</div>
				</div>
				<div id="toplist_content">
					<%@include file="top10_truck_list.jsp" %>
				</div>
				
					
					<div id="menu_content">
						<div class="menu1">
							<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=1&toppn=${toppn}");'>간식</button>
						</div>
						<div class="menu2">
							<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=2&toppn=${toppn}")'>식사</button>
						</div>
						<div class="menu3">
							<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=3&toppn=${toppn}")'>디저트</button>
						</div>
						<div class="menu4">
							<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=4&toppn=${toppn}")'>밥차</button>
						</div>
					</div>
					
					<div id="menu_truck_content">
						<c:forEach var="foodtruck" items="${ftList}" varStatus="vs">
							<c:if test="${vs.index % 4 == 0}"><br></c:if>
								<button type="button" onclick="" class="truck_card">
									<img src="<%=CON%>/resources/imgs/foodtruck/${foodtruck.foodtruckImgPath}" width="100px" height="100px"> <br>
									<c:out value="${foodtruck.foodtruckName}" /> <br>
									<c:out value="${foodtruck.foodtruckMainMenu}" /> <br>
									<c:out value="${foodtruck.foodtruckLocation}" /> <br>
									<c:out value="♥${foodtruck.memberLikeCount}" /> <br>
								</button>
						</c:forEach>
					</div>
				</div>	
				
			
			
			<div id="foodtruckList_footer">
				<div class="foodtrucklist_pagenation">
					<c:if test="${pn > 1}">
						<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?pn=${pn-1}&mc=${mc}&toppn=${toppn}")'>
							&laquo;
						</button>
					</c:if>
<!-- 					 &nbsp; &nbsp; -->
					<c:forEach varStatus="vs" 
							begin="1" end="${maxPG}" step="1">
						<c:if test='${vs.current eq pn}'>
							<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?pn=${vs.current}&mc=${mc}&toppn=${toppn}")'
								style='color: orange'>
								${vs.current}
							</button>
						</c:if>	
						<c:if test='${vs.current ne pn}'>
							<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?pn=${vs.current}&mc=${mc}&toppn=${toppn}")'>
								${vs.current}
							</button>
						</c:if>
<!-- 						 &nbsp; -->
						 	
						 ${vs.current eq maxPG ? '': '|'}
					</c:forEach>
<!-- 					 &nbsp; &nbsp; -->
					<c:if test="${pn < maxPG}">
						<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?pn=${pn+1}&mc=${mc}&toppn=${toppn}")'>
							&raquo;
						</button>
					</c:if>
				</div>
			</div>
		</div>





















