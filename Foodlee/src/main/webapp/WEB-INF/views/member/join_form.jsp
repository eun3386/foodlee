<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#passwordCheck').blur(function(){
		   if($('#password').val() != $('#passwordCheck').val()){
		    	if($('#passwordCheck').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#passwordCheck').val('');
		          $('#passwordCheck').focus();
		       }
		    }
		});
		
		$('#dupchk').on("click", function() {
			var login = $('input[name=id]').val();
			var tUrl = "${pageContext.request.contextPath}/";
			tUrl += 'member/dupcheck.fdl';
			$.ajax ({ 
				type: 'get', 
				url: tUrl,
				data: "login="+login,
				success: function(res) {
					console.log(res);
					var msg = "";
					switch(res) {
						case 'no': 
							msg = '이미 사용중인 아이디입니다.';
							//$('input[type=submit]').attr('disabled','disabled');
							$('input[type=submit]').attr('disabled',true);
							break;
						case 'yes':
							msg = '사용 가능한 아이디입니다.';
							$('input[type=submit]').attr('disabled',false);
							break;
						case 'error':
							msg = '요청 및 DB 에러!!';
							$('input[type=submit]').attr('disabled',true);
							break;
					}
					alert(msg);
				}
			});
		});
		
	});
</script>
<div>   
    <form action="${pageContext.request.contextPath}/member/join.fdl" method="post">
    	<div>
        <table border="0">
        	<tr>
        		<td><img alt="사진" src="${pageContext.request.contextPath}/resources/imgs/join/profile_dummy.PNG"> </td>
        		<td colspan="2"><textarea rows="10" cols="60" readonly>일반 회원가입 소개글 더미</textarea></td>
        	</tr>
            <tr>
                <td><label for="id">*아이디</label></td>
                <td>
                    <input type="text" id="id" name="id" maxlength="20" required>
                    <input type="button" id="dupchk" value="중복확인">
                </td>
            </tr>
                    
            <tr>
                <td><label for="password">*비밀번호</label></td>
                <td>
                    <input type="password" id="password" name="password" maxlength="15" required>
                </td>
            </tr>
            
            <tr>
                <td><label for="passwordCheck">*비밀번호 확인</label></td>
                <td>
                    <input type="password" id="passwordCheck" name="passwordCheck" maxlength="15" required>
                </td>
            </tr>
                
            <tr>
                <td><label for="name">*이름</label></td>
                <td>
                    <input type="text" id="name" name="name" maxlength="40" required>
                </td>
            </tr>
                
            <tr>
                <td><label for="man">성별</label></td>
                <td>
                    <input type="radio" id="man" name="gender" value="남" checked><label for="man">남</label>
                    <input type="radio" id="woman" name="gender" value="여"><label for="woman">여</label>
                </td>
            </tr>
                
            <tr>
                <td><label for="age">나이</label></td>
                <td>
                    <input type="number" id="age" name="age" value="20">
                </td>
            </tr>
                
            <tr>
                <td><label for="residentRN1">*주민번호</label></td>
                <td>
                    <input type="text" id="residentRN1" name="residentRN1" maxlength="6" required>&nbsp;-&nbsp;
                    <input type="password" id="residentRN2" name="residentRN2" maxlength="7" required>
                </td>
            </tr>
                
            <tr>
                <td><label for="email">*이메일주소</label></td>
                <td>
                    <input type="email" id="email" name="email" maxlength="30" required>
                </td>
            </tr>
                
            <tr>
                <td><label for="phoneNumber">*휴대전화번호</label></td>
                <td>
                    <input type="text" id="phoneNumber" maxlength="13" placeholder="ex)010-1234-5678" name="phoneNumber" required>
                </td>
            </tr>
            <tr>
                <td><label for="address">주소(사는곳)</label></td>
                <td>
                    <input type="text" size="50" id="address" name="address">
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><input type="submit" value="가입" disabled="disabled"> <input type="reset" value="리셋"></td>
            </tr>
        </table>
        </div>
    </form>
</div>



