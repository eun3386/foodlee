<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <link href="<%= application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet"> --%>
<link href="<%= application.getContextPath()%>/resources/css/login.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="login_wrap" class="slide">
	<div id="login_form">
		<form style="padding-left: 14.59px;" action="<%= application.getContextPath()%>/login.fdl" method="post">
	 		<table border='0'>
	 			<tr id="title"><th>푸들이 로그인</th></tr>
	 			<tr>
	 				<td><label for='login_input' class="lb">아이디:</label></td>			
	 			</tr>
	 			<tr style="height: 40px;">
	 				<td>
	 					<input type="text" id='login_input'
	 						name="login" size='22'
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
	 						maxlength="10"				
	 						placeholder="비밀번호 입력" required> 					
	 				</td>
	 			</tr>
	 			<tr>
	 				<td style="height: 40px;">
	 					<small>
	 					<a id="id_find" href="#">아이디찾기</a>&nbsp;&nbsp;&nbsp;
	 					<a id="pw_find" href="#">비밀번호찾기</a>
	 					</small>
	 				</td>
	 			</tr>
	 			<tr id="submit">
	 				<td>
	 					<input type="submit" value="로그인">
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
</div>
</body>
</html>