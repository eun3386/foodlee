
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/main.css" type="text/css" rel="stylesheet">
<link href="../../css/reset.css" type="text/css" rel="stylesheet">
<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script><!-- 구글 차트-->
<script type="text/javascript">
	$(document).ready(function() {
		var ROOT_PATH = '<%= application.getContextPath() %>';
		
		$('.login').click(function() {
			var url = ROOT_PATH
				+'///mb_login_form.jsp';
			$("#main").load(url);
		});
		
		$('.sign_up').click(function() {
			var url = ROOT_PATH
				+'///mb_sign_up_choice_form.jsp';
			$("#main").load(url);
		});
		$('.graph').click(function() {
			var url = ROOT_PATH
				+'/views/bossorder/graph.jsp';
			$("#main").load(url);
		});
		$('.orderlist').click(function() {
			var url = ROOT_PATH
				+'/views/bossorder/orderlist.jsp';
			$("#main").load(url);
		});
	});
</script>
<title>Insert title here</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="main">
	<nav>
		<a class="orderlist" href="#">주문현황</a> 
		<a class="graph" href="#">판매그래프</a> 
	</nav>
		<h3>판매량 / 좋아요(트럭.메뉴) / 주간매출 / 월매출</h3>
		<div>
			<table border="1">
				<tr>
				<td width="230" height="150"></td>
				<td width="230" height="150"></td>
				<td width="230" height="150"></td>
				<td width="230" height="150"></td>
				</tr>
			</table>
		</div>
		<h3>그래프 / 남여비율 / 1회 주문당 주문 금액?1미만.2.3.4.5이상-만원</h3>
		<div>
			<table border="1">
				<tr>
				<td width="600" height="300"></td>
				<td width="250" height="300"></td>
				<td width="250" height="300"></td>
				</tr>
			</table>
		</div>
		<h3>페이지 방문자 수 / 리뷰 수</h3>
		<div>
			<table border="1">
				<tr>
				<td width="550" height="300"></td>
				<td width="550" height="300"></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer">
		
	</div>
</body>
</html>