<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function () {
		
		$('#find_id').on('click', function() {
			if($(this).is(':checked'))
				$('#find_pw').prop('checked', false);
			$('#lb1').html('이름:');
			$('input[id=input1]').attr('placeholder', '이름 입력');
			$('input[id=input1]').attr('name', 'name');
			$('#lb2').html('휴대폰번호:');
			$('input[id=input2]').attr('placeholder', 'ex)010-1234-6789');
			$('input[id=input2]').attr('name', 'phoneNumber');
			$('form[name=find_form]').attr('action','${pageContext.request.contextPath}/find_id.fdl');
		});
		
		$('#find_pw').on('click', function() {
			if($(this).is(':checked'))
				$('#find_id').prop('checked', false);
			$('#lb1').html('아이디:');
			$('input[id=input1]').attr('placeholder', '아이디 입력');
			$('input[id=input1]').attr('name', 'login');
			$('#lb2').html('이메일:');
			$('input[id=input2]').attr('placeholder', 'ex)E-mail@gmail.com');
			$('input[id=input2]').attr('name', 'email');
			$('form[name=find_form]').attr('action','${pageContext.request.contextPath}/find_pw.fdl');
			console.log($('input[id=input1]').val());
			console.log($('input[id=input2]').val());
		});
    	
		$('#find_submit_btn').on('click', function() {
			
		});
		
// 		$('#find_submit_btn').on('click', function() {
// 			var tUrl = "${pageContext.request.contextPath}/";
// 			if($('#find_id').is(':checked')) {
// 				tUrl += "find_id.fdl";
// 				var name = $('input[name=name]').val();
// 			 	var tel = $('input[name=phoneNumber]').val();
// 			 	var postData = {'user_name' : name , 'user_phoneNumber' : tel};
// 				$.ajax({
// 			        url:tUrl,
// 			        type:'POST',
// 			        data: postData,
// 			        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
// 			        dataType : "json",
// 			        success:function(data){
// // 			        	var emailLists = data.user_email;
// // 			        	var emailLength = emailLists.length
// // 			        	var emailfind = emailLists.substring(1, emailLength-1)
// // 			       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")
	
// 			        },
// 			        error: function (XMLHttpRequest, textStatus, errorThrown){
// 			        	alert('정보를 다시 입력해주시길 바랍니다.' );
// 			        }
// 				});
// 			} else {
// 				tUrl += "find_pw.fdl";
// 				var login = $('input[name=login]').val();
// 			 	var email = $('input[name=email]').val();
// 			 	var postData = {'user_login' : login , 'user_email' : email };
// 				$.ajax({
// 			        url:tUrl,
// 			        type:'POST',
// 			        data: postData,
// 			        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
// 			        dataType : "json",
// 			        success:function(data){
// // 			        	var emailLists = data.user_email;
// // 			        	var emailLength = emailLists.length
// // 			        	var emailfind = emailLists.substring(1, emailLength-1)
// // 			       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")
	
// 			        },
// 			        error: function (XMLHttpRequest, textStatus, errorThrown){
	
// 			        	alert('정보를 다시 입력해주시길 바랍니다.' );
// 			        }
// 			}
// 		});
		
	});
</script>
<form name="find_form" method="post">
	<table border='0'>
		<tr class="title">
			<th>아이디/비밀번호 찾기</th>
		</tr>
		<tr>
			<td>
				<label for='input1' id="lb1" class="lb">이름:</label>
			</td>			
		</tr>
		<tr>
			<td>
				<input type="text" id='input1'
					name="input1" size='25' 
					placeholder="이름 입력" required> 					
			</td>
		</tr>
		<tr>
			<td>
				<label for='input2' id="lb2" class="lb">휴대폰번호:</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id='input2'
					name="input2" size='25' 		
					placeholder="ex)010-1234-6789" required> 					
			</td>
		</tr>
		<tr>
	 		<td style="height: 30px;">
 				<label for="find_id" style="font-size: 13px;"><input type="radio" id="find_id" checked>&nbsp;아이디찾기</label>&nbsp;&nbsp;
 				<label for="find_pw" style="font-size: 13px;"><input type="radio" id="find_pw">&nbsp;비밀번호찾기</label>
	 		</td>
	 	</tr>
		<tr class="submit">
			<td>
				<input id="find_submit_btn" type="submit" value="찾기">
			</td>
		</tr>
	</table>
</form>