<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../../css/main.css" type="text/css" rel="stylesheet">
<link href="../../css/reset.css" type="text/css" rel="stylesheet">
<!-- <link href="../../css/index.css" type="text/css" rel="stylesheet"> -->
<link href="../../css/bossmain.css" type="text/css" rel="stylesheet">
<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	var ROOT_PATH = '<%= application.getContextPath() %>';
	$(document).ready(function() {
		
		
		$('.login').click(function() {
			var url = ROOT_PATH + '///mb_login_form.jsp';
			$("#main").load(url);
		});
		
		$('.sign_up').click(function() {
			var url = ROOT_PATH +'///mb_sign_up_choice_form.jsp';
			$("#main").load(url);
		});
		
		
		$('.bossmain').click(function() {
			var url = ROOT_PATH
				+'/views/bossmain/bossmain.jsp';
			$("#main").load(url);
		});
		$('.orderlist').click(function() {
			var url = ROOT_PATH
				+'/views/bossorder/orderlist.jsp';
			$("#main").load(url);
		});
		$('.menuregister').click(function() {
			var url = ROOT_PATH
				+'/views/bossmenu/menuregister.jsp';
			$("#main").load(url);
		});
		$('.info').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/infomodify.jsp';
			$("#main").load(url);
		});
		$('.infomodify').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/infomodify.jsp';
			$("#main").load(url);
		});
		$('.review').click(function() {
			var url = ROOT_PATH
				+'/views/bossreview/review.jsp';
			$("#main").load(url);
		});
		$('.sale_graph').click(function() {
			var url = ROOT_PATH
				+'/views/bossorder/graph.jsp';
			$("#main").load(url);
		});
		$('.like_graph').click(function() {
			var url = ROOT_PATH
				+'/views/bossorder/graph.jsp';
			$("#main").load(url);
		});
	});

</script>
<title>bossmain</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
    
	<div id="bossmain">
		<div id="orderlist" class="bs-main-box">
		<!-- 	<iframe id="my_frame" width="600" height="240"></iframe> -->
		<table border="0" >
			<tr>
				<td ><img src="../../css/imgs/imgimg.png"></td>
			</tr>
		</table>		
			
		</div>
		
		<div id="menuregister"  class="bs-main-box">
			<!--  <iframe src="../bossmenu/menumodify.jsp" width="600" height="240" seamless></iframe>-->
			<table border="0" >
			<tr>
				<td width="450" height="300"><img src="../../css/imgs/imgimg.png"></td>
			</tr>
	</table>
		</div>
		
		<div id="sale_graph"  class="bs-main-box">
			<table border="0" >
			<tr>
				<td width="450" height="300"><img src="../../css/imgs/imgimg.png"></td>
			</tr>
		</table>
		</div>
		
		<div id="info"  class="bs-main-box">
		<table border="0" >
			<tr>
				<td width="450" height="300" ><img src="../../css/imgs/imgimg.png"></td>
			</tr>
		</table>
		</div>
		<div id="review"  class="bs-main-box">
		<table border="0" >
			<tr>
				<td width="450" height="300"><img src="../../css/imgs/imgimg.png"></td>
			</tr>
		</table>
		</div>
		<div id="like_graph"  class="bs-main-box">
		<table border="0" >
			<tr>
				<td width="450" height="300"><img src="../../css/imgs/imgimg.png"></td>
			</tr>
		</table>
		</div>
	</div><!-- main -->
	<div id="footer">
		
	</div>
</body>
</html>