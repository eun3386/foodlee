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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ksauwx09vv"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ksauwx09vv&submodules=geocoder"></script>

<!-- fontawesome, jquery -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
		$('.ad').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/ad.jsp';
			$("#main").load(url);
		});
		$('.infomodify').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/infomodify.jsp';
			$("#main").load(url);
		});
		$('.position').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/position.jsp';
			$("#main").load(url);
		});
		$('.h_search').click (function() {
			$(location).attr('href','main.html');
		});

		$('#s_search').click(function() {
			var offset = $('#map_container').offset();
			$('html').animate({scrollTop : offset.top}, 400);
		});
		$('#d_search').click(function() {
			var offset = $('#gu-list-table').offset();
			$('html').animate({scrollTop : offset.top}, 400);
		});
	});
	});
</script>
<title>bossinfo</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="posmain">
	<nav id=" posmain-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="infomodify" href="#">정보수정</a>
			<a class="ad" href="#">광고노출</a> 
			<a class="position" href="#">위치등록</a>
 		</form>
	</nav>
		<div>
		<table border="1" >
			<tr>
				<td width="300" height="600"></td><!-- 구 동 고르기 -->
				<td id="testmap" width="600" height="600"><%@ include file="../../map/NaverMap.jsp"%></td><!-- 핀으로 내위치 지정하기 -->
			</tr>
			<button>등록</button>
		</table>
		
		</div>

	</div>
	<div id="footer">
		
	</div>
</body>
</html>