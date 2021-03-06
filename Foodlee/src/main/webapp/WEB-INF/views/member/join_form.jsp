<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/_common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!-- slider -->
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<!-- <link rel="stylesheet" type="text/css" href="resource/js/slick/slick-theme.css"/> -->

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- CSS -->
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/joinpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#section_edit{display:block; background-color:#d1e6f5;}
</style>
<link href="resources/css/index.css" type="text/css" rel="stylesheet">
<link href="resources/css/truckList.css" type="text/css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://d3js.org/topojson.v1.min.js"></script>

<script type="text/javascript" src="resources/js/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		function email_check( email ) {
		    
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email));

		}
		
		$("input[name='email']").blur(function(){

	        var email = $(this).val();

	        // 값을 입력안한경우는 아예 체크를 하지 않는다.
	        if( email == '' || email == 'undefined') return;

	        // 이메일 유효성 검사
	        if(! email_check(email) ) {
	            alert('잘못된 형식의 이메일 주소입니다.');
	            return false;
	        }
	    });
		
		function chkPwd(str){
			var pw = str;
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if(pw.length < 8 || pw.length > 20){
				alert("8자리 ~ 20자리 이내로 입력해주세요.");
				return false;
			}
			if(pw.search(/₩s/) != -1){
				alert("비밀번호는 공백없이 입력해주세요.");
				return false;
			} if(num < 0 || eng < 0 || spe < 0 ){
				alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				return false;
			}
			return true;
		}
		$('#password').blur(function(){
			
			if( $('#password').val() == '' || $('#password').val() == 'undefined') return;
			
			if(!chkPwd( $.trim($('#password').val()))){
				$('#password').val('');
				return false;
			}
		});

		$('#passwordCheck').blur(function(){
		   if($('#password').val() != $('#passwordCheck').val()){
		    	if($('#passwordCheck').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#passwordCheck').val('');
		          $('#passwordCheck').focus();
		       }
		    }
		});
		
		

		$("input[name='phoneNumber']").blur(function(){
		
			var phonenum = $('#phoneNumber').val();
			
			if( phonenum == '' || phonenum == 'undefined') return;
			
			var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
			
			if(!regPhone.test(phonenum)){
			 	 alert('잘못된 휴대폰 번호 양식입니다.');
			 	 return false;    
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
							$('input[type=submit]').attr('disabled',true);
							break;
						case 'yes':
							msg = '사용 가능한 아이디입니다.';
							$('input[type=submit]').attr('disabled',false);
							break;
						case 'error':
							msg = '아이디 미입력 또는 요청 및 DB 에러!!';
							$('input[type=submit]').attr('disabled',true);
							break;
					}
					alert(msg);
				}
			});
		});
		
		$('.photo').click(function() {
			$('input[type=file]').click();
		});
		
		$('#input_img').on('change', function(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#uploadImg').attr('src', e.target.result);
				}
				reader.readAsDataURL(f);
			});
		});
		
		$('#addressInput').blur(function() {
			if( $('#addressInput').val() != null ) {
				var val = $('#addressInput').val();
				console.log(val);
				$('#address').attr('value',val);
				var adVal = $('#address').val();
				console.log(adVal);
			}
		});
		
		$('input[name=id]').blur(function() {
			var idReg = /^[A-Za-z]+[A-Za-z0-9]{5,19}$/g;
			
			if( $("input[name=id]").val() == '' || $("input[name=id]").val() == 'undefined') return;
			
	        if( !idReg.test( $("input[name=id]").val() ) ) {
	            alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
	            return;
	        }
		});
		
		$('#join_submit_btn').click(function() {
			var result = confirm('가입 하시겠습니까?');
			if(result) { //yes 
				location.replace('${pageContext.request.contextPath}/login_form.fdl');
			} else { //no
				location.replace('${pageContext.request.contextPath}/member/join_form.fdl');
			} 
		});
		
	});
</script>
	<title> 푸들이 - 푸드트럭 나들이 </title>
</head>
<body id="wrapper">
    <div id="main-header">
        <a href="${pageContext.request.contextPath}/main.fdl"><img class="logo" src="${pageContext.request.contextPath}/resources/css/imgs/logo.png"></a>
        <span id="loginjoin">
			<c:if test="${empty LoginName}">
			<a href="${pageContext.request.contextPath}/login_form.fdl" id='login'>로그인</a> / <a href="${pageContext.request.contextPath}/join_choice_form.fdl" id='join'>회원가입</a></span>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 4}">
	        <a href="${pageContext.request.contextPath}/my_page.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	        <c:if test="${not empty LoginName and LoginType eq 5}">
	        <a href="${pageContext.request.contextPath}/boss.fdl" id='mypage'>마이페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
	    </span>
	    <span id="adminlogout">
	        <c:if test="${not empty LoginName and LoginType eq 6}">
	        <a href="${pageContext.request.contextPath}/admin.fdl" id='admin_page'>어드민페이지</a> / <a href="${pageContext.request.contextPath}/logout.fdl" id="logout">로그아웃</a>
	        </c:if>
        </span>
    <hr class="line">
    </div>
    <div id="main-content">
		<div id="infomain">
			<section class="main_section" id="section_edit">
				<div class="wrapper" style="border: 2px solid gray;">
					<div class="title">
						<div class="icon">
							<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
							<div class="msg">회원 가입(일반)</div>
						</div>
					</div>
					<div class="content">
						
		<div id="join_form">
		    <form action="${pageContext.request.contextPath}/member/join.fdl" method="post" enctype="multipart/form-data">
		    	<div class="profile_wrap">
					<img id="uploadImg" class="photo" src="${pageContext.request.contextPath}/resources/imgs/join/profile_dummy.PNG">
					<input type="file" id="input_img" name="upfiles" multiple="multiple" style="display: none">
				</div>
		        <table id="join_table" class="table_edit" border="0">
		            <tr>
		                <th class="lb"><label for="id">*아이디</label></th>
		                <td style="width: 500px;">
		                    <input type="text" class="input" id="id" name="id" maxlength="20" size="35" placeholder="아이디 입력" required>
		                    <input type="button" id="dupchk" class="btn" style="margin-left: 3px;" value="중복확인">
		                </td>
		            </tr>
		                    
		            <tr>
		                <th class="lb"><label for="password">*비밀번호</label></th>
		                <td>
		                    <input type="password" class="input" id="password" name="password" size="45" maxlength="20" placeholder="8~20자리 영문,숫자,특수문자를 혼합" required>
		                </td>
		            </tr>
		            
		            <tr>
		                <th class="lb"><label for="passwordCheck">*비밀번호 확인</label></th>
		                <td>
		                    <input type="password" class="input" id="passwordCheck" name="passwordCheck" size="45" maxlength="15" placeholder="위 비밀번호와 동일하게 입력" required>
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="name">*이름</label></th>
		                <td>
		                    <input type="text" class="input" id="name" name="name" maxlength="40" size="45" required>
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="man">성별</label></th>
		                <td>
		                    <input type="radio" id="man" name="gender" value="남" checked><label for="man"> 남</label>&nbsp;&nbsp;
		                    <input type="radio" id="woman" name="gender" value="여"><label for="woman"> 여</label>
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="age">나이</label></th>
		                <td>
		                    <input type="number" class="input" id="age" name="age" size="19" style="width: 198px;" value="20">
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="residentRN1">*주민번호</label></th>
		                <td>
		                    <input type="text" class="input mid" id="residentRN1" name="residentRN1" maxlength="6" size="19" style="width: 198px;" required>&nbsp;&nbsp;-&nbsp;
		                    <input type="password" class="input mid" id="residentRN2" name="residentRN2" maxlength="7" style="width: 198px;" required>
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="email">*이메일주소</label></th>
		                <td>
		                    <input type="email" class="input" id="email" name="email" maxlength="30" size="45" placeholder="ex)E-mail@gmail.com" required>
		                </td>
		            </tr>
		                
		            <tr>
		                <th class="lb"><label for="phoneNumber">*휴대전화번호</label></th>
		                <td>
		                    <input type="text" class="input" id="phoneNumber" maxlength="13" placeholder="ex)010-1234-5678" name="phoneNumber" size="45" required>
		                </td>
		            </tr>
		            
		            <tr>
		                <th class="lb" style="vertical-align: middle;"><label for="address">주소(사는곳)</label></th>
		                <td>
		                	<textarea rows="2" cols="30" style="resize: none; margin-top: 10px;" id="addressInput" class="input"></textarea>
		                    <input type="hidden" class="input" size="70" id="address" name="address">
		                </td>
		            </tr>
		            
		            <tr>
		            	<th class="lb"></th>
		            	<td id="join_submit" style="padding-top: 10px;">
		            		<input type="submit" id="join_submit_btn" class="join_btn btn" value="가입" disabled="disabled">&nbsp;&nbsp;
		            		<input type="reset" class="join_btn btn" value="리셋">
		            	</td>
		            </tr>
		        </table>
		    </form>
		</div>
		</div>
				</div>
			</section>
		</div>
	</div>
    <div id="footer">
    	<%@include file="../common/_footer.jsp" %>
    </div>
</body>
</html>