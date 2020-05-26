<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#id_pw_find').on('click', function() {
    		var ROOT_PATH = '${pageContext.request.contextPath}';
    		var url = ROOT_PATH+'/find_form.fdl';
			$("#login_form").load(url);
    	});
		
	});
</script>
<div id="login_wrap">
	<div id="login_form">
		<form id="form" action="${pageContext.request.contextPath}/login.fdl" method="post">
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
	 						maxlength="10" placeholder="비밀번호 입력" required> 					
	 				</td>
	 			</tr>
	 			<tr>
	 				<td id="find_td">
	 					<a id="id_pw_find" href="#">아이디/비밀번호 찾기</a>
	 				</td>
	 			</tr>
	 			<tr class="submit">
	 				<td>
	 					<input type="submit" value="로그인">
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
</div>