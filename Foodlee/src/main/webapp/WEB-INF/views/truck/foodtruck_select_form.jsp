<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="wrapper">
	<div id="main-header">
		<div id="menu-list">
            <ul>
                <li><a href="#">위치찾기</a></li>
                <li><a href="#introduce">소개</a></li>
                <li><a href="#truck-list">푸드트럭</a></li>
                <li><a href="#event-list">이벤트</a></li>
            </ul>
        </div>
        <a href="${pageContext.request.contextPath}/main.fdl"><img class="logo" src="resources/css/imgs/logo.png"></a>
    	<hr class="line">
	</div>
	
	<div id="main-content">
		
	</div>
	
	<div id="foot">
		<%@ include file="../common/_footer.jsp" %>
	</div>
</body>
</html>