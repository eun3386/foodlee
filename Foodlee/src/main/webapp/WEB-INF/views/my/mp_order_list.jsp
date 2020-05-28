<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸들이-푸드트럭나들이</title>
</head>
<body>
<section class="main_section" id="section_orderlist">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" enable-background="new 0 0 16 16" xml:space="preserve" fill="rgb(36, 133, 77)" data-svg-content="true"> <g><path d="M 26,2l-6,0 c0-1.104-0.896-2-2-2L 14,0 C 12.896,0, 12,0.896, 12,2L 6,2 C 4.896,2, 4,2.896, 4,4l0,26 c0,1.104, 0.896,2, 2,2l 20,0 c 1.104,0, 2-0.896, 2-2L 28,4 C 28,2.896, 27.104,2, 26,2z M 26,28L 6,28 L 6,4 l 4,0 c0,1.104, 0.896,2, 2,2l 2,0 l 4,0 l 2,0 c 1.104,0, 2-0.896, 2-2l 4,0 L 26,28 zM 8,11C 8,11.552, 8.448,12, 9,12l 14,0 C 23.552,12, 24,11.552, 24,11C 24,10.448, 23.552,10, 23,10l-14,0 C 8.448,10, 8,10.448, 8,11zM 23,16l-14,0 C 8.448,16, 8,16.448, 8,17C 8,17.552, 8.448,18, 9,18l 14,0 C 23.552,18, 24,17.552, 24,17 C 24,16.448, 23.552,16, 23,16zM 23,22l-14,0 C 8.448,22, 8,22.448, 8,23C 8,23.552, 8.448,24, 9,24l 14,0 c 0.552,0, 1-0.448, 1-1 C 24,22.448, 23.552,22, 23,22z"></path></g></svg>
						<div class="msg">주문한 내역</div>
					</div>
				</div>

				<table class="table">
					<thead>
						<tr>
							<th>NO.</th>
							<th>가게</th>
							<th>메뉴</th>
							<th>수량</th>
							<th>결제금액</th>
							<th>리뷰 쓰기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order">
							<tr>
								<td>${order.id}</td>
								<td>${order.foodtruck}</td>
								<td>${order.menu}</td>
								<td>${order.count}</td>
								<td>${order.price}</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pagination">
					<a href="#">&lt;</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">&gt;</a>
				</div>
			</div>
		</section>
</body>
</html>