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
<title>Insert title here</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="menu-re-main">
	<nav id="menu-re-header" class="navbar navbar-light bg-light justify-content-between">
	<form class="form-inline">
		<a class="login" href="#">메뉴등록</a> 
		<a class="sign_up" href="#">메뉴수정</a>
		<a class="sign_up" href="#">가게정보</a>
 	</form>
	</nav>
		<div>
		<table border="0">
			<tr><td rowspan="4"><img alt="" src="../../css/imgs/gu-truck-img.jpg" width="256" height="256"></td><td><label>메뉴 종류 카테고리</label></td><td><input></td></tr>
			<tr><td>메뉴 이름</td><td><input></td></tr>
			<tr><td>가격</td><td><input></td></tr>
			<tr><td>요리소요시간</td><td><input></td></tr>
			<tr><td>원산지</td><td colspan="2"><input></td></tr>
			<tr><td>알레르기</td>
				<td colspan="2">
				
				<input type="radio" name="Allergie" value="egg" id="egg"><label for="egg">메밀</label>
				
				<input type="radio" name="Allergie" value="egg1" id="egg1"><label for="egg1">밀</label>
				
				<input type="radio" name="Allergie" value="egg2" id="egg2"><label for="egg2">대두</label>
				
				<input type="radio" name="Allergie" value="egg3" id="egg3"><label for="egg3">견과류</label>
				
				<input type="radio" name="Allergie" value="egg4" id="egg4"><label for="egg4">육류</label>
				
				<input type="radio" name="Allergie" value="egg5" id="egg5"><label for="egg5">갑각류</label>
				
				
				<input type="radio" name="Allergie" value="egg6" id="egg6"><label for="egg6">복숭아</label>
				
				<input type="radio" name="Allergie" value="egg7" id="egg7"><label for="egg7">토마토</label>
				
				<input type="radio" name="Allergie" value="egg8" id="egg8"><label for="egg8">난류</label>
				
				<input type="radio" name="Allergie" value="egg9" id="egg9"><label for="egg9">우유</label>
				
				<input type="radio" name="Allergie" value="egg10" id="egg10"><label for="egg10">조개류(굴,전복,홍합)</label>
				
				<input type="radio" name="Allergie" value="egg11" id="egg11"><label for="egg11">아황산포함식품</label>
				</td></tr>
			<tr ><td colspan="3"><textarea rows="" cols="">메뉴간략소개</textarea></td></tr>			
		</table>
		</div>
		<button>등록</button><button>취소</button>
		
	</div><!-- main -->
	<div id="footer">
		
	</div>
</body>
</html>