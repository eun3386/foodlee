<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    img {
    	width: 150px;
    	height: 150px;
    }
    .lb {
    	text-align: right;
    	padding: 5px 20px;
    }
    .input {
    	padding-left: 50px;
    }
    #join_submit {
    	text-align: right;
    	padding-right: 100px;
    }
    #join_table {
    	margin: 0 auto;
    	width: 960px;
    }
    #txtarea {
    	padding: 15px 50px;
    }
    input {
    	height: 25px;
    }
    #dupchk {
    	width: 70px;
    }
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
			tUrl += 'seller/dupcheck.fdl';
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
<div id="join_form">   
    <form action="${pageContext.request.contextPath}/seller/join.fdl" method="post">
    	<table id="join_table" border="0">
        	<tr>
        		<td><img alt="사진" src="${pageContext.request.contextPath}/resources/imgs/join/profile_dummy.PNG"> </td>
        		<td id="txtarea"><textarea rows="10" cols="100" style="resize: none;" readonly>판매자 회원가입 소개글 더미</textarea></td>
        	</tr>
            <tr>
                <td class="lb"><label for="id">*아이디</label></td>
                <td class="input">
                    <input type="text" id="id" name="id" maxlength="20" size="45" required>
                    <input type="button" id="dupchk" value="중복확인">
                </td>
            </tr>
                    
            <tr>
                <td class="lb"><label for="password">*비밀번호</label></td>
                <td class="input">
                    <input type="password" id="password" name="password" size="45" maxlength="15" required>
                </td>
            </tr>
            
            <tr>
                <td class="lb"><label for="passwordCheck">*비밀번호 확인</label></td>
                <td class="input">
                    <input type="password" id="passwordCheck" name="passwordCheck" size="45" maxlength="15" required>
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="name">*이름</label></td>
                <td class="input">
                    <input type="text" id="name" name="name" maxlength="40" size="45" required>
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="man">성별</label></td>
                <td class="input">
                    <input type="radio" id="man" name="gender" value="남" checked><label for="man"> 남</label>&nbsp;&nbsp;
                    <input type="radio" id="woman" name="gender" value="여"><label for="woman"> 여</label>
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="age">나이</label></td>
                <td class="input">
                    <input type="number" id="age" name="age" size="19" value="20">
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="residentRN1">*주민번호</label></td>
                <td class="input">
                    <input type="text" id="residentRN1" name="residentRN1" maxlength="6" size="19" required>&nbsp;&nbsp;-&nbsp;
                    <input type="password" id="residentRN2" name="residentRN2" maxlength="7" required>
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="email">*이메일주소</label></td>
                <td class="input">
                    <input type="email" id="email" name="email" maxlength="30" size="45" required>
                </td>
            </tr>
                
            <tr>
                <td class="lb"><label for="phoneNumber">*휴대전화번호</label></td>
                <td class="input">
                    <input type="text" id="phoneNumber" maxlength="13" placeholder="ex)010-1234-5678" name="phoneNumber" size="45" required>
                </td>
            </tr>
            
            <tr>
                <td class="lb"><label for="address">주소(사는곳)</label></td>
                <td class="input">
                    <input type="text" size="70" id="address" name="address">
                </td>
            </tr>
            
            <tr>
                <td class="lb"><label for="companyRN1">*사업자등록번호</label></td>
                <td class="input">
                    <input type="text" id="companyRN1" name="companyRN1" maxlength="3" size="11" required>&nbsp;&nbsp;-&nbsp;
                    <input type="text" id="companyRN2" name="companyRN2" maxlength="2" size="8" required>&nbsp;&nbsp;-&nbsp;
                    <input type="text" id="companyRN3" name="companyRN3" maxlength="5" size="15" required>
                </td>
            </tr>
            
            <tr>
            	<td class="lb"></td>
            	<td id="join_submit"><input type="submit" value="가입" style="width: 40px; height: 30px; font: 20px;" disabled="disabled">&nbsp;&nbsp;<input type="reset" style="width: 40px; height: 30px; font: 20px;" value="리셋"></td>
            </tr>
            
        </table>
    </form>
</div>



