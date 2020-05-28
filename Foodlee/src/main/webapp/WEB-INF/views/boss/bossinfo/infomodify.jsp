<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="/foodlee/resources/css/mpreset.css"> -->
<link rel="stylesheet" type="text/css" href="/foodlee/resources/css/selmypage.css">
<style type="text/css">
	#section_edit{display:block; background-color:#d1e6f5;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var ROOT_PATH = '<%= application.getContextPath() %>';
		
		$('.login').click(function() {
			var url = ROOT_PATH
				+'///mb_login_form.jsp';
			$("#main").load(url);
		});
		
		$('.sign_up').click(function() {
			var url = ROOT_PATH
				+'///mb_sign_up_choice_form.jsp';
			$("#main").load(url);
		});
		$('.ad').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/ad.jsp';
			$("#main").load(url);
		});
		$('.infomodify').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/infomodify.jsp';
			$("#main").load(url);
		});
		$('.position').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/position.jsp';
			$("#main").load(url);
		});
		
		$("#changePasswordButton").on("click", function(e){
			e.preventDefault();
			$(".changePassword").show();
			$('#btn-pw').hide();
		});
		
		$("#btn-pw-edit-cancel").on("click", function(e){
			e.preventDefault();
			$('btn-pw-edit-submit').attr('disabled',true);
			$(".changePassword").hide();
			$('#btn-pw').show();
		});
		
		$("#btn-edit").on("click", function(e) {
			e.preventDefault();
			$(".changeInfo").show();
			$(".info").hide();
			$('btn-edit-submit').show();
			$("#btn-edit-cancel").attr('disabled',false);
			$("#btn-edit-cancel").css('cursor','pointer');
			$(this).hide();
		});
		
		$("#btn-edit-cancel").on("click", function(e) {
			e.preventDefault();
			$(this).attr('disabled',true);
			$(this).css('cursor','default');
			$(".changeInfo").hide();
			$(".info").show();
			$("#btn-edit").show();
		});
		
		$('#passwordChk').blur(function(){
		   if( $('#newPassword').val() != $('#passwordChk').val() ) {
		    	if($('#passwordChk').val()!=''){
			    	alert("비밀번호가 일치하지 않습니다.");
		    	    $('#passwordChk').val('');
		          	$('#passwordChk').focus();
		       	}
		    } else {
		    	if($('#passwordChk').val()!='')
			    	$('btn-pw-edit-submit').attr('disabled',false);
		    }
		});
		
	});
	
</script>
<title>bossinfo</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
<%-- 			<%@ include file="../../common/_header.jsp"%> --%>
		</header>
</div>
	<div id="infomain">
	<nav id=" in-main-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="infomodify" href="#">정보수정</a>
			<a class="ad" href="#">광고노출</a> 
			<a class="position" href="#">위치등록</a>
 		</form>
	</nav>
		<!-- 마이페이지 시작-->
		<form action="">
		<section class="main_section" id="section_edit">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
						<div class="msg">나의 정보 수정</div>
					</div>
				</div>
				<div class="content">
					<div class="profile_wrap">
						<img src="./resources/css/imgs/mypage/profile.png">
						<img class="photo" src="./resources/css/imgs/mypage/photo.png">
					</div>
					<table class="table_edit">
						<tbody>
							<tr>
								<th><label for="login">*아이디</label></th>
								<td>
									<span>${seller.login}</span>
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="newPassword">*비밀번호</label></th>
								<td>
									<input type="password" id="newPassword" name="newPassword" class="changePassword input" style="display: none">
								</td>
								<th></th>
							</tr>
							<tr>
								<td>
									<div id="btn-pw">
										<button class="btn btn-secondary" id="changePasswordButton">비밀번호 변경하기</button>
									</div>
								</td>
							</tr>
							<tr class="changePassword" style="display:none">
								<th><label for="passwordChk">비밀번호 확인</label></th>
								<td>
									<input type="password" id="passwordChk" name="passwordChk" class="input">
								</td>
								<th></th>
							</tr>
							<tr class="changePassword" style="display:none">
								<td colspan="3">
									<div id="btn-pw-edit">
										<button class="btn btn-secondary" id="btn-pw-edit-submit" disabled="disabled">비밀번호 변경</button>
									</div>
								</td>
							</tr>
							<tr class="changePassword" style="display:none">
								<td colspan="3">
									<div id="btn-pw-edit-cancel">
										<button class="btn btn-secondary">취소</button>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="name">*이름</label></th>
								<td>
									<span class="info">${seller.name}</span>
									<input type="text" id="name" name="name" class="changeInfo input">
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="gender">성별</label></th>
								<td>
									<span class="info">${seller.gender}</span>
									<label class="changeInfo"><input type="radio" name="gender">남</label>
									<label class="changeInfo"><input type="radio" name="gender">여</label>
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="age">나이</label></th>
								<td>
									<span class="info">${seller.age}</span>
									<input type="number" class="changeInfo input sm" id="age" name="age" value="20">
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="residentRn1">*주민번호</label></th>
								<td>
									<span class="info">${seller.residentRn}</span>
									<span class="changeInfo">
										<input type="text" class="input mid" id="residentRn1" name="residentRn1" maxlength="6"> - 
										<input type="text" class="input mid" id="residentRn2" name="residentRn2" maxlength="7">
									</span>
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="companyRn1">*사업자 번호</label></th>
								<td>
									<span class="info">${seller.companyRn}</span>
									<span class="changeInfo">
										<input type="text" class="input sm" id="companyRn1" name="companyRn1" maxlength="3"> - 
										<input type="text" class="input sm" id="companyRn2" name="companyRn2" maxlength="2"> - 
										<input type="text" class="input sm" id="companyRn3" name="companyRn3" maxlength="5">
									</span>
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="phoneNumber1">*연락처</label></th>
								<td>
									<span class="info">${seller.phoneNumber}</span>
									<span class="changeInfo">
										<input type="text" class="input sm" id="phoneNumber1" name="phoneNumber1" maxlength="3"> - 
										<input type="text" class="input sm" id="phoneNumber2" name="phoneNumber2" maxlength="4"> - 
										<input type="text" class="input sm" id="phoneNumber3" name="phoneNumber3" maxlength="4">
									</span>
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="email">*이메일</label></th>
								<td>
									<span class="info">${seller.email}</span>
									<input type="text" class="changeInfo input" id="email" name="email">
								</td>
								<th></th>
							</tr>
							<tr>
								<th><label for="address">주소</label></th>
								<td>
									<span class="info">${seller.address}</span>
									<input type="text" class="changeInfo input" id="address" name="address">
								</td>
								<th></th>
							</tr>
							<tr>
								<th></th>
								<td>
									<button class="btn btn-primary" id="btn-edit">수정</button>
									<input type="submit" class="btn" id="btn-edit-submit" value="수정완료" disabled="disabled">
									<button class="btn btn-primary" id="btn-edit-cancel" disabled="disabled">취소</button>
									<button class="btn btn-danger">회원탈퇴</button>
								</td>
								<th></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		</form>
		<!--마이페이지 끝  -->
	</div>
	<div id="footer">
		
	</div>
</body>
</html>