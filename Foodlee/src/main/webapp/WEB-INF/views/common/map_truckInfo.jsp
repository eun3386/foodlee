<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<h3 class="cl_tit">${ts.foodtruckName}</h3>
	<p class="cl_dotted"></p>
	<div class="truck_view">
		<img id="fdfn_${ts.sellerId}" src="${pageContext.request.contextPath}/resources/imgs/mapMain/foodtruckImg/${ts.foodtruckImgPath}" />
	</div>
