<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		$('.menumodify').click(function() {
			var url = ROOT_PATH
				+'/views/bossmenu/menumodify.jsp';
			$("#main").load(url);
		});
		$('.menuregister').click(function() {
			var url = ROOT_PATH
				+'/views/bossmenu/menuregister.jsp';
			$("#main").load(url);
		});
		$('.storeinfo').click(function() {
			var url = ROOT_PATH
				+'/views/bossmenu/storeinfo.jsp';
			$("#main").load(url);
		});
		
		
		
	});
</script>
<title>메뉴추가/수정</title>
</head>
<body id="wrapper">
<div>
	
</div>

<div id="footer">
		
</div>
</body>
</html>