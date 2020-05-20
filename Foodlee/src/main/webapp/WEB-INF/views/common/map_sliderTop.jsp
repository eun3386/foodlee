<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<c:forEach var="bg" items="${baList}" varStatus="status">
				<div class="slider_top">
					<figure>
						<img src="resources/imgs/mapMain/${bg.adImg}">
					</figure>
				</div>
			</c:forEach>
