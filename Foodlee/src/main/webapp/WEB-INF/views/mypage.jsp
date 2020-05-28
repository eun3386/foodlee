<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpreset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script src="resources/js/jquery-3.5.0.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 우편주소 api -->
</head>
<body>
	<header id="header">
		<%@include file="my/mp_header.jsp" %>
	</header>

	<div class="main">
		<%@include file="my/mp_nav.jsp" %>

		<%@include file="my/mp_like_list.jsp" %>

		<%@include file="my/mp_order_list.jsp" %>

		<%@include file="my/mp_comment_list.jsp" %>
		
		<%@include file="my/mp_profile.jsp" %>

	</div>
	
	<div id='footer'>
		<%@include file="common/_footer.jsp" %>
	</div>
<script>


</script>
</body>
</html>