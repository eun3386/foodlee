<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	
	
		<div id="top_foodtruck_content">
			<c:forEach var="foodtruck" items="${topFtList}" varStatus="vs" >
				<a href="<%=CON%>/truckDetail.fdl?sellerId=${foodtruck.sellerId}">
						<button type="button" onclick="" class="top_truck_card">
							<img src="<%=CON%>/resources/imgs/foodtruck/${foodtruck.foodtruckImgPath}" width="100px" height="100px"> <br>
							<c:out value="${foodtruck.foodtruckName}" /> <br>
							<c:out value="${foodtruck.foodtruckMainMenu}" /> <br>
							<c:out value="${foodtruck.foodtruckLocation}" /> <br>
							<c:out value="♥${foodtruck.memberLikeCount}" /> <br>
		<%-- 					<c:if test="${vs.index == 10}"></c:if> --%>
						</button>
				</a>
			</c:forEach>
		</div>
		<div class="foodtrucklist_pagenation" style="text-align: center">
			<c:if test="${toppn > 1}">
				<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?toppn=${toppn-1}&pn=${pn}&mc=${mc}")'>
					&laquo;
				</button>
			</c:if>
			<c:forEach varStatus="vs" 
				begin="1" end="${maxTopPg}" step="1">
				<c:if test='${vs.current eq toppn}'>
					<button type="button" 
						onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?toppn=${vs.current}&pn=${pn}&mc=${mc}")'
						style='color: orange'>
						${vs.current}
					</button>
				</c:if>	
				<c:if test='${vs.current ne toppn}'>
					<button type="button" 
						onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?toppn=${vs.current}&pn=${pn}&mc=${mc}")'>
						${vs.current}
					</button>
				</c:if>
				${vs.current eq maxTopPg ? '': '|'}
			</c:forEach>
			<c:if test="${toppn < maxTopPg}">
				<button type="button" onclick='$("#truck-list").load("${pageContext.request.contextPath}/truckList.fdl?toppn=${toppn+1}&pn=${pn}&mc=${mc}")'>
					&raquo;
				</button>
			</c:if>
		</div>