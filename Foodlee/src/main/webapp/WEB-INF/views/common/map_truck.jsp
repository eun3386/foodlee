<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		

	<li id="truck_${fd.sellerId}">
		<p class="truck_list">${fd.foodtruckName}</p> 
		<img id="fdfn_${fd.sellerId}" src="${pageContext.request.contextPath}/resources/imgs/mapMain/foodtruckImg/${fd.foodtruckImgPath}" />
		<p class="map_text">주소: ${fd.foodtruckLocation}</p>
		<p class="map_text">메뉴: ${fd.foodtruckMainMenu}</p>
		<p class="map_text">♥: ${fd.memberLikeCount}</p>
	</li>

