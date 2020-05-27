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
						alert('로그인 실패: 아이디 불일치');
						$('input[name=login]').focus();
						break;
					case 'pwMismatch':
						alert('로그인 실패: 비밀번호 불일치');
						$('input[name=password]').focus();
						break;
					case 'loginFail':
						alert('로그인 실패');
						$('input[name=login]').focus();
						break;
					}
				}
			});
		});
		
	});
</script>
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
						<input id="login_submit_btn" type="button" value="로그인">
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
</div>