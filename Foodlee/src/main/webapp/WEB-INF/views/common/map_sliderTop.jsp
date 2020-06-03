<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="bg" items="${baTopList}" varStatus="status">
	<div class="slider_top" onclick="selectTopOneBanner(${bg.selNum})">
		<figure>
			<img src="resources/imgs/mapMain/foodtruckBanner${bg.imgPath}">
		</figure>
	</div>
</c:forEach>
