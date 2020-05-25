<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#id_pw_find').on('click', function() {
    		var ROOT_PATH = '${pageContext.request.contextPath}';
    		var url = ROOT_PATH+'/find_form.fdl';
			$("#login_form").load(url);
    	});
		
		
		
	});
</script>
</head>
<body>
<div id="login_wrap" class="slide">
	<div id="login_form">
		<form style="padding-left: 14.59px;" action="${pageContext.request.contextPath}/login.fdl" method="post">
	 		<table border='0'>
	 			<tr id="title"><th>푸들이 로그인</th></tr>
	 			<tr>
	 				<td><label for='login_input' class="lb">아이디:</label></td>			
	 			</tr>
	 			<tr style="height: 40px;">
	 				<td>
	 					<input type="text" id='login_input'
	 						name="login" size='22' style="height: 25px; margin: 3px auto;" 
	 						placeholder="아이디 입력" required> 					
	 				</td>
	 			</tr>
	 			<tr>
	 				<td><label for='password' class="lb">비밀번호:</label></td>
	 			</tr>
	 			<tr>
	 				<td style="height: 25px;">
	 					<input type="password" id='password'
	 						name="password" size='22' 
	 						maxlength="10" style="height: 25px; margin: 3px auto;" 	
	 						placeholder="비밀번호 입력" required> 					
	 				</td>
	 			</tr>
	 			<tr>
	 				<td style="height: 40px; text-align: right;">
	 					<a id="id_pw_find" href="#" style="text-decoration: none; color: gray; font-size: small;">아이디/비밀번호 찾기</a>
	 				</td>
	 			</tr>
	 			<tr id="submit">
	 				<td>
	 					<input type="submit" style="height: 25px; width: 50px;" value="로그인">
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
</div>
</body>
</html>