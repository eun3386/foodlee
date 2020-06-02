<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/_common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!-- slider -->
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<!-- <link rel="stylesheet" type="text/css" href="resource/js/slick/slick-theme.css"/> -->

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- CSS -->
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">

<link href="resources/css/index.css" type="text/css" rel="stylesheet">
<link href="resources/css/truckList.css" type="text/css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://d3js.org/topojson.v1.min.js"></script>

<script type="text/javascript" src="resources/js/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#id_pw_find').on('click', function() {
    		var ROOT_PATH = '${pageContext.request.contextPath}/';
    		var url = ROOT_PATH+'find_form.fdl';
			$("#login_form").load(url);
    	});
		
		$('#login_submit_btn').on('click', function() {
			var login = $('input[name=login]').val();
			var password = $('input[name=password]').val();
			var tUrl = "${pageContext.request.contextPath}/";
			tUrl += 'login.fdl';
			var param = $('form[name=login_form1]').serialize();
			$.ajax ({
				type: 'post',
				url: tUrl,
				data: param,
				success: function(res) {
					var a = "${pageContext.request.contextPath}/";
					switch (res) {
					case 'memberLogin':
						location.href = "${pageContext.request.contextPath}/main.fdl";
						alert('일반 로그인 성공');
						break;
					case 'sellerLogin':
						location.href = "${pageContext.request.contextPath}/main.fdl";
						alert('판매자 로그인 성공');
						break;
					case 'adminLogin':
						location.href = "${pageContext.request.contextPath}/admin.fdl";
						alert('어드민 로그인 성공');
						break;
					case 'loginNone':
						alert('로그인 실패: 아이디를 정확하게 입력해 주세요.');
						$('input[name=login]').focus();
						break;
					case 'pwMismatch':
						alert('로그인 실패: 비밀번호를 정확하게 입력해 주세요.');
						$('input[name=password]').focus();
						break;
					case 'loginFail':
						alert('로그인 실패: 정보를 정확하게 입력해 주세요.');
						$('input[name=login]').focus();
						break;
					}
				}
			});
		});
		
	});
</script>
	<title> 푸들이 - 푸드트럭 나들이 </title>
</head>
<body id="wrapper">
    <div id="main-header">
        <a href="${pageContext.request.contextPath}/main.fdl"><img class="logo" src="resources/css/imgs/logo.png"></a>
        <span id="loginjoin">
			<c:if test="${empty LoginName}">
			<a href="${pageContext.request.contextPath}/login_form.fdl" id='login'>로그인</a> / <a href="${pageContext.request.contextPath}/join_choice_form.fdl" id='join'>회원가입</a></span>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 4}">
	        <a href="${pageContext.request.contextPath}/my_page.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 5}">
	        <a href="${pageContext.request.contextPath}/boss.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	    </span>
	    <span id="adminlogout">
	        <c:if test="${not empty LoginName and LoginType eq 6}">
	        <a href="${pageContext.request.contextPath}/admin.fdl" id='admin_page'>어드민페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
        </span>
    <hr class="line">
    </div>
    <div id="main-content">
		<div id="login_wrap">
			<div id="login_form">
				<form id="form" name="login_form1">
			 		<table border='0'>
			 			<tr class="title">
			 				<th>푸들이 로그인</th>
			 			</tr>
			 			<tr>
			 				<td>
			 					<label for='login_input' class="lb">아이디:</label>
			 				</td>			
			 			</tr>
			 			<tr>
			 				<td>
			 					<input type="text" id='login_input'	name="login" 
			 						size='22' placeholder="아이디 입력" required> 					
			 				</td>
			 			</tr>
			 			<tr>
			 				<td>
			 					<label for='password' class="lb">비밀번호:</label>
			 				</td>
			 			</tr>
			 			<tr>
			 				<td>
			 					<input type="password" id='password'
			 						name="password" size='22' 
			 						maxlength="20" placeholder="비밀번호 입력" required> 					
			 				</td>
			 			</tr>
			 			<tr>
			 				<td id="find_td">
			 					<a id="id_pw_find" href="#">아이디/비밀번호 찾기</a>
			 				</td>
			 			</tr>
			 			<tr class="submit">
			 				<td>
								<input id="login_submit_btn" type="button" value="로그인">
			 				</td>
			 			</tr>
			 		</table>
			 	</form>
			</div>
		</div>
    </div>
    <div id="footer">
    	<%@include file="common/_footer.jsp" %>
    </div>
</body>
</html>