<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/foodlee/resources/css/selmypage.css">
<style type="text/css">
	#section_edit{display:block; background-color:#d1e6f5;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#btn-edit").on("click", function(e) {
			e.preventDefault();
			$(".changeInfo").show();
			$(".info").hide();
			$('btn-edit-submit').show();
			$("#btn-edit-cancel").attr('disabled',false);
			$("#btn-edit-cancel").css('cursor','pointer');
			$("#btn-edit-submit").attr('disabled',false);
			$("#btn-edit-submit").css('cursor','pointer');
			$(this).hide();
		});
		
		$("#btn-edit-cancel").on("click", function() {
			$("#btn-edit-submit").attr('disabled',true);
			$("#btn-edit-submit").css('cursor','default');
			$(this).attr('disabled',true);
			$(this).css('cursor','default');
			$(".changeInfo").hide();
			$(".info").show();
			$("#btn-edit").show();
		});
		// 
		var rRnStr = $('input[name=residentRn]').val();
		var rRnSplit = rRnStr.split('-');
		var rRnSplit1 = rRnSplit[0];
		var rRnSplit2 = rRnSplit[1];
		var rRnSplit2Str = rRnSplit2.substring(0,1)+'******';
		$('#residentRn').html(rRnSplit1+'-'+rRnSplit2Str);
		$('#residentRn1').val(rRnSplit1);
		$('#residentRn2').val(rRnSplit2Str);
		//
		var cRnStr = $('input[name=companyRn]').val();
		var cRnSplit = cRnStr.split('-');
		var cRnSplit1 = cRnSplit[0];
		var cRnSplit2 = cRnSplit[1];
		var cRnSplit3 = cRnSplit[2];
		$('#companyRn').html(cRnSplit1+'-'+cRnSplit2+'-'+cRnSplit3);
		$('#companyRn1').val(cRnSplit1);
		$('#companyRn2').val(cRnSplit2);
		$('#companyRn3').val(cRnSplit3);
		//
		var pnStr = $('input[name=phoneNumber]').val();
		var pnSplit = pnStr.split('-');
		var pnSplit1 = pnSplit[0];
		var pnSplit2 = pnSplit[1];
		var pnSplit3 = pnSplit[2];
		$('#phoneNumber').html(pnSplit1+'-'+pnSplit2+'-'+pnSplit3);
		$('#phoneNumber1').val(pnSplit1);
		$('#phoneNumber2').val(pnSplit2);
		$('#phoneNumber3').val(pnSplit3);
		//
		$('#btn-pw-edit-submit').on("click", function() {
			$('#pw_form').submit();
		});
		//
		if( $('#addressInput').val() != null ) {
			var val = $('#addressInput').val();
			$('#address').attr('value',val);
			var adVal = $('#address').val();
		}
		//
	});
</script>
<title>bossinfo</title>
</head>
<body id="wrapper">
<div id="infomain">
	<!-- 마이페이지 시작-->
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
					<img src="${pageContext.request.contextPath}/resources/css/imgs/mypage/profile.png">
					<img class="photo" src="${pageContext.request.contextPath}/resources/css/imgs/mypage/photo.png">
				</div>
					<input type="hidden" name="id" value="${seller.sellerId}">
					<input type="hidden" name="login" value="${seller.login}">
					<input type="hidden" name="password" value="${seller.password}">
					<input type="hidden" name="residentRn" value="${seller.residentRn}">
					<input type="hidden" name="companyRn" value="${seller.companyRn}">
					<input type="hidden" name="phoneNumber" value="${seller.phoneNumber}">
				<table class="table_edit">
					<tr>
						<th><label for="login">아이디</label></th>
						<td>
							<span class="span">${seller.login}</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td>
							<span class="info span">${seller.name}</span>
							<input type="text" id="name" name="name" class="changeInfo input" value="${seller.name}" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="gender">성별</label></th>
						<td>
							<span class="info span">${seller.gender}</span>
							<label class="changeInfo"><input type="radio" name="gender" ${seller.gender=='남'?'checked':''} value="남">남</label>
							<label class="changeInfo"><input type="radio" name="gender" ${seller.gender=='여'?'checked':''} value="여">여</label>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="age">나이</label></th>
						<td>
							<span class="info span">${seller.age}</span>
							<input type="number" class="changeInfo input sm" id="age" name="age" value="${seller.age}">
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="residentRn1">주민번호</label></th>
						<td>
							<span id="residentRn" class="span"></span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="companyRn1">사업자 번호</label></th>
						<td>
							<span class="info span" id="companyRn"></span>
							<span class="changeInfo">
								<input type="text" class="input sm" id="companyRn1" name="companyRn1" maxlength="3" required> - 
								<input type="text" class="input sm" id="companyRn2" name="companyRn2" maxlength="2" required> - 
								<input type="text" class="input sm" id="companyRn3" name="companyRn3" maxlength="5" required>
							</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="phoneNumber1">연락처</label></th>
						<td>
							<span class="info span" id="phoneNumber"></span>
							<span class="changeInfo">
								<input type="text" class="input sm" id="phoneNumber1" name="phoneNumber1" maxlength="3" required> - 
								<input type="text" class="input sm" id="phoneNumber2" name="phoneNumber2" maxlength="4" required> - 
								<input type="text" class="input sm" id="phoneNumber3" name="phoneNumber3" maxlength="4" required>
							</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td>
							<span class="info span">${seller.email}</span>
							<input type="text" class="changeInfo input" id="email" name="email" value="${seller.email}" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="address">주소</label></th>
						<td>
							<span class="info span">${seller.address}</span>
							<textarea rows="2" cols="30" style="resize: none" id="addressInput" class="changeInfo input">${seller.address}</textarea>
							<input type="hidden" id="address" name="address">
						</td>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<td>
							<div id="div-edit"><button class="btn btn-primary" id="btn-edit">수정</button></div>
							<button class="btn btn-primary" id="btn-edit-cancel" disabled="disabled">취소</button>
							<button class="btn btn-danger">회원탈퇴</button>
						</td>
						<th></th>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<!--마이페이지 끝  -->
</div>
<div id="footer">
		
</div>
</body>
</html>