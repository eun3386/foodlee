<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	tbody tr:hover{
	    cursor: default;
	    background-color: white;
	}
	label {
		cursor: default;
	}
	#login_submit_btn {
		padding: 2px;
	}
	#login_form {
		position: absolute;
		border: 2px solid orange;
		width: 250px;
		height: 300px;
		margin-top: 150px;
 		box-sizing: border-box;
		padding: 30px;
		background-color: white;
 		left: 35%;
	}
	td {
		border: none;
	}
 	table {
 		margin: 0 auto;
 	}
	#title {
		vertical-align: middle;
		height: 50px;
		font-size: large;
	}
	#id, #pw, #find {
		height: 40px;
	}
	#submit {
		text-align: right;
	}
	#id_find, #pw_find {
		text-decoration: none;
		color: gray;
		font-size: small;
	}
   	@keyframes slideleft {
    	from {
        	background-position: 0%;
    	}
    	to {
        	background-position: 150000%;
    	}
	}
	@-webkit-keyframes slideleft {
    	from {
        	background-position: 0%;
    	}
    	to {
       		background-position: 150000%;
    	}
	}
/* 	form { */
/* 		height: 256.8px; */
/* 		margin: 0; */
/* 	} */
	.slide {
	    background-image: url('<%= application.getContextPath() %>/resources/imgs/login_image4.jpg');
	    height: 598.5px;
	    background-repeat: repeat-x;
	    animation: slideleft 20000s infinite linear;
	    -webkit-animation: slideleft 20000s infinite linear;
	    background-size: cover;
		-webkit-background-size: cover;
		-moz-background-size: cover;
	    background-attachment: fixed;
	    position: relative;
	}
</style>
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