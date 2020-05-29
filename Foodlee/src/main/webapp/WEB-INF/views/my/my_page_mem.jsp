<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpreset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script src="resources/js/jquery-3.5.0.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 우편주소 api -->
<style>
#section_edit {
	display: unset;
}
</style>
</head>
<body>
<%@include file="mp_header.jsp" %>
<div class="main">
	<div id="main_nav_spacer">
		<div id="main_nav">
			<button data-to="section_menu" onClick="location.href='../my_page.fdl'">먹고싶은 메뉴</button>
			<button data-to="section_orderlist" >주문내역</button>
			<button data-to="section_manage" >댓글/리뷰 관리</button>
			<button data-to="section_edit" class="active"  onClick="location.href='my_page_mem.fdl'">정보수정</button>
		</div>
	</div>
	
</div>
</body>
</html>