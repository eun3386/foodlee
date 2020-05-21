<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<script type="text/javascript">
	$(document).ready(function () {
		$('#find_id').on('click', function() {
			if($(this).is(':checked'))
				$('#find_pw').prop('checked', false);
			$('#lb1').html('이름:');
			$('input[id=input1]').attr('placeholder', '이름 입력');
			$('#lb2').html('휴대폰번호:');
			$('input[id=input1]').attr('placeholder', '휴대폰번호 입력');
		});
		
		$('#find_pw').on('click', function() {
			if($(this).is(':checked'))
				$('#find_id').prop('checked', false);
			$('#lb1').html('아이디:');
			$('input[id=input1]').attr('placeholder', '이름 입력');
			$('#lb2').html('이메일:');
			$('input[id=input1]').attr('placeholder', '이메일 입력');
		});
		
		
    	
	});
</script>
<form action="<%= application.getContextPath()%>/find.fdl" method="post">
	<table border='0'>
		<tr id="title"><th>아이디/비밀번호 찾기</th></tr>
		<tr>
			<td><label for='input1' id="lb1" class="lb">이름:</label></td>			
		</tr>
		<tr style="height: 40px;">
			<td>
				<input type="text" id='input1'
					name="input1" size='25'
					placeholder="이름 입력" required> 					
			</td>
		</tr>
		<tr>
			<td><label for='input2' id="lb2" class="lb">이메일:</label></td>
		</tr>
		<tr>
			<td style="height: 25px;">
				<input type="text" id='input2'
					name="input2" size='25'				
					placeholder="이메일 입력" required> 					
			</td>
		</tr>
		<tr>
	 		<td style="height: 40px;">
 				<label for="find_id" style="font-size: small;"><input type="radio" id="find_id">아이디찾기</label>&nbsp;&nbsp;&nbsp;
 				<label for="find_pw" style="font-size: small;"><input type="radio" id="find_pw">비밀번호찾기</label>
	 		</td>
	 	</tr>
		<tr id="submit">
			<td>
				<input type="submit" value="찾기">
			</td>
		</tr>
	</table>
</form>
	