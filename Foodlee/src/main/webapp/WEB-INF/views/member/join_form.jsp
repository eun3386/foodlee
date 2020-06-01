<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/join.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
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
<div id="join_form">
    <form action="${pageContext.request.contextPath}/member/join.fdl" method="post">
        <table id="join_table" border="0">
        	<tr>
        		<td><img alt="사진" src="${pageContext.request.contextPath}/resources/imgs/join/profile_dummy.PNG"> </td>
        		<script type="text/javascript"> 
					var oEditors = []; 
					$(function(){ 
						nhn.husky.EZCreator.createInIFrame({ 
							oAppRef: oEditors, elPlaceHolder: "ir1", 
							//SmartEditor2Skin.html 파일이 존재하는 경로 
							sSkinURI: "smartEditor/SmartEditor2Skin.html", 
							htParams : { 
								// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseToolbar : true, 
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseVerticalResizer : true, 
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseModeChanger : true, 
								fOnBeforeUnload : function(){ 
									
								} 
							}, 
							fOnAppLoad : function(){ 
								//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
								oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]); 
							}, 
								fCreator: "createSEditor2" 
						}); 
					}); 
				</script>
        		<td id="txtarea"><textarea rows="10" cols="100" style="resize: none;" readonly>일반 회원가입 소개글 더미</textarea></td>
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
            	<td class="lb"></td>
            	<td id="join_submit">
            		<input type="submit" id="join_submit_btn" class="join_btn" value="가입" disabled="disabled">&nbsp;&nbsp;
            		<input type="reset" class="join_btn" value="리셋">
            	</td>
            </tr>
            
        </table>
    </form>
</div>



