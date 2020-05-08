<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%= application.getContextPath()%>/resources/css/login.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="login_wrap" class="slide">
<div id="login_form">
	<form action="" method="post">
 		<table border='0'>
 			<tr id="title"><th>푸들이 로그인</th></tr>
 			<tr>
 				<td><label for='mb_login'>아이디</label></td>			
 			</tr>
 			<tr id="id">
 				<td>
 					<input type="text" id='mb_login'
 						name="login" size='25'
 						placeholder="아이디 입력" > 					
 				</td>
 			</tr>
 			<tr id="pw">
 				<td><label for='mb_pw'>비밀번호</label></td>
 			</tr>
 			<tr>
 				<td>
 					<input type="password" id='mb_pw'
 						name="password" size='25'
 						maxlength="10" 						
 						placeholder="암호 입력" > 					
 				</td>
 			</tr>
 			<tr id="find">
 				<td>
 					<small>
 					<a id="id_find" href="#">아이디찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
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