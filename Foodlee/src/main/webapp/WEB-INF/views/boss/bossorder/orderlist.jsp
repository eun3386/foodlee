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
<title>orderlist</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="ordermain">
	<nav id="order_header">
		<a class="orderlist" href="#">주문현황 orderlist2 활용하기</a> 
		<a class="graph" href="#">판매그래프</a> 
	</nav>
		<h1>주문 리스트 </h1>
		주문 하면 상단에 자동 추가 되기 0시 리셋<br><br>
	<div id=order_list>
	<table >
	<tr > <td rowspan="3"><img alt="" src="../../css/imgs/gu-truck-img.jpg"></td><td >메뉴이름 : </td> <td colspan="2">메뉴</td> <td> 주문시간</td>
	</tr>
	<tr> <td>주문자 이름 : </td> <td colspan="2">주문자</td> 
	</tr>
	<tr> <td>요청사항</td><td colspan="2">요청내용입니다.</td>   
	</tr>
	</table>
	<br>
	
	
	<table >
	<tr > <td rowspan="3"><img alt="" src="../../css/imgs/gu-truck-img.jpg"></td><td >메뉴이름 : </td> <td colspan="2">메뉴</td> <td> 주문시간</td>
	</tr>
	<tr> <td>주문자 이름 : </td> <td colspan="2">주문자</td> 
	</tr>
	<tr> <td>요청사항</td><td colspan="2">요청내용입니다.</td>   
	</tr>
	</table>
	<br>
	
	<table >
	<tr > <td rowspan="3"><img alt="" src="../../css/imgs/gu-truck-img.jpg"></td><td >메뉴이름 : </td> <td colspan="2">메뉴</td> <td> 주문시간</td>
	</tr>
	<tr> <td>주문자 이름 : </td> <td colspan="2">주문자</td> 
	</tr>
	<tr> <td>요청사항</td><td colspan="2">요청내용입니다.</td>   
	</tr>
	</table>
	<br>
	
	<table >
	<tr > <td rowspan="3"><img alt="" src="../../css/imgs/gu-truck-img.jpg"></td><td >메뉴이름 : </td> <td colspan="2">메뉴</td> <td> 주문시간</td>
	</tr>
	<tr> <td>주문자 이름 : </td> <td colspan="2">주문자</td> 
	</tr>
	<tr> <td>요청사항</td><td colspan="2">요청내용입니다.</td>   
	</tr>
	</table>
	
	</div><!--  -->
		
	</div><!-- main -->
	<div id="footer">
		
	</div>
</body>
</html>