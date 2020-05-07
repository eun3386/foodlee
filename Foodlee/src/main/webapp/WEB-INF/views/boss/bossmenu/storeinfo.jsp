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
	});
</script>
<title>storeinfo</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="main">
		<nav id=" menust-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="login" href="#">메뉴등록</a> 
			<a class="sign_up" href="#">메뉴수정</a>
			<a class="sign_up" href="#">가게정보</a>
 	</form>
	</nav>
	<div>
		<table border="0">
			<tr><td>메인사진</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
			<tr  ><td rowspan="5" ><img alt="" src="../../css/imgs/gu-truck-img.jpg" width="256" height="256"></td><td><textarea rows="" cols=""></textarea></td><td>영업시간:</td><td>시간부터</td><td>~</td><td>시간까지</td></tr>
			<tr><td></td><td></td><td>휴게시간 : </td><td>시간부터</td><td></td><td>~</td><td>시간까지</td><td></td></tr>
			<tr><td></td><td></td><td></td><td>대표번호 : </td><td>010</td><td>-</td><td>1234</td><td>-</td><td>5678</td></tr>
			<br>
			<tr><td></td><td>jpg,png 파일만 넣을실 수 있습니다. </td></tr>
			<tr><td></td><td>최대 10mb용량까지 넣으실 수 있습니다.</td></tr>
			<tr><td>로고사진</td><td></td><td>인스타그램주소</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td><img alt="" src="../../css/imgs/gu-truck-img.jpg" width="64" height="64"></td><td></td><td><textarea rows="" cols=""></textarea></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
		</table>
	</div>
	<div><button>적용</button><button>취소</button></div>
	</div><!-- main -->
	<div id="footer">
		
	</div>
</body>
</html>