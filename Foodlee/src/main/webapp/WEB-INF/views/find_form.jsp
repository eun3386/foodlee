<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#find_id').on('click', function() {
			if($(this).is(':checked')) {
				$('#find_pw').prop('checked', false);
				$('form[name=find_id_form]').css('display','block');
				$('form[name=find_pw_form]').css('display','none');
			}
		});
		
		$('#find_pw').on('click', function() {
			if($(this).is(':checked')) {
				$('#find_id').prop('checked', false);
				$('form[name=find_id_form]').css('display','none');
				$('form[name=find_pw_form]').css('display','block');
			}
		});
		
	});
</script>
<div id="find_wrap">
<table border='0'>
		<tr class="title">
			<th>아이디/비밀번호 찾기</th>
		</tr>
		<tr>
	 		<td style="height: 30px;">
 				<label for="find_id" style="font-size: 13px;"><input type="radio" id="find_id">&nbsp;아이디찾기</label>&nbsp;&nbsp;
 				<label for="find_pw" style="font-size: 13px;"><input type="radio" id="find_pw">&nbsp;비밀번호찾기</label>
	 		</td>
	 	</tr>
</table>
<form name="find_id_form" action="${pageContext.request.contextPath}/find_id.fdl" method="post">
<table>
		<tr>
			<td>
				<label for='name' id="nameLb" class="lb">이름:</label>
			</td>			
		</tr>
		<tr>
			<td>
				<input type="text" id='name'
					name="name" size='25' 
					placeholder="이름 입력" required> 					
			</td>
		</tr>
		<tr>
			<td>
				<label for='phoneNumber' id="pnLb" class="lb">휴대폰번호:</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id='phoneNumber'
					name="phoneNumber" size='25' 		
					placeholder="ex)010-1234-6789" required> 					
			</td>
		</tr>
		<tr class="submit">
			<td>
				<input id="find_id_submit_btn" type="submit" value="찾기">
			</td>
		</tr>
	</table>
</form>
<form name="find_pw_form" action="${pageContext.request.contextPath}/find_pw.fdl" method="post" style="display: none">
<table>
		<tr>
			<td>
				<label for='login' id="loginLb" class="lb">아이디:</label>
			</td>			
		</tr>
		<tr>
			<td>
				<input type="text" id='login'
					name="login" size='25' 
					placeholder="아이디 입력" required> 					
			</td>
		</tr>
		<tr>
			<td>
				<label for='email' id="emailLb" class="lb">이메일:</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id='email'
					name="email" size='25' 		
					placeholder="ex)E-mail@gmail.com" required> 					
			</td>
		</tr>
		<tr class="submit">
			<td>
				<input id="find_pw_submit_btn" type="submit" value="찾기">
			</td>
		</tr>
	</table>
</form>
</div>