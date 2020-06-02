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
		
		$("#changePasswordButton").on("click", function(e){
			e.preventDefault();
			$(".changePassword").show();
			$('#div-pw').hide();
		});
		
		$("#div-pw-edit-cancel").on("click", function(e){
			e.preventDefault();
			$(".changePassword").hide();
			$('#div-pw').show();
		});
		
		$("#btn-edit").on("click", function(e) {
			location.href = "${pageContext.request.contextPath}/seller/edit_form.fdl";
		});
		
		$("#back_btn").on("click", function(e) {
			location.href = "${pageContext.request.contextPath}/boss.fdl";
		});
		
		$('#passwordChk').blur(function(){
			if( $(this).val() == '' ) return;
			
		 	if( $('#newPassword').val() != $(this).val() ) {
		    	if($(this).val()!=''){
			    	alert("비밀번호가 일치하지 않습니다.");
		    	    $(this).val('');
		          	$(this).focus();
		       	}
		   	} else {
			    $('btn-pw-edit-submit').attr('disabled',false);
		    }
		});
		
		// 
		var rRnStr = $('input[name=residentRn]').val();
		var rRnSplit = rRnStr.split('-');
		var rRnSplit1 = rRnSplit[0];
		var rRnSplit2 = rRnSplit[1];
		var rRnSplit2Str = rRnSplit2.substring(0,1)+'******';
		$('#residentRn').html(rRnSplit1+'-'+rRnSplit2Str);
		//
		var cRnStr = $('input[name=companyRn]').val();
		var cRnSplit = cRnStr.split('-');
		var cRnSplit1 = cRnSplit[0];
		var cRnSplit2 = cRnSplit[1];
		var cRnSplit3 = cRnSplit[2];
		$('#companyRn').html(cRnSplit1+'-'+cRnSplit2+'-'+cRnSplit3);
		//
		var pnStr = $('input[name=phoneNumber]').val();
		var pnSplit = pnStr.split('-');
		var pnSplit1 = pnSplit[0];
		var pnSplit2 = pnSplit[1];
		var pnSplit3 = pnSplit[2];
		$('#phoneNumber').html(pnSplit1+'-'+pnSplit2+'-'+pnSplit3);
		//
		
		$('#btn-pw-edit-submit').click(function() {
			var result = confirm('비밀번호를 변경 하시겠습니까?');
			if(result) { //yes 
				alert('비밀번호가 변경되었습니다.');
				location.replace('${pageContext.request.contextPath}/seller/show_form.fdl');
			} else { //no
				location.replace('${pageContext.request.contextPath}/seller/show_form.fdl'); 
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
		$('#newPassword').blur(function(){
			
			if( $('#newPassword').val() == '' || $('#newPassword').val() == 'undefined') return;
			
			if(!chkPwd( $.trim($('#newPassword').val()))){
				$('#newPassword').val('');
				return false;
			}
		});
		
	});
</script>
<title>푸들이 - 판매자 정보</title>
</head>
<body id="wrapper">
<div id="infomain">
	<section class="main_section" id="section_edit">
		<div class="wrapper">
			<div class="title">
				<div class="icon">
					<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
					<div class="msg">나의 정보</div>
				</div>
			</div>
			<div class="content">
				<div id="back">
					<button class="btn" id="back_btn" style="cursor: pointer;">뒤로가기</button>
				</div>
				<div class="profile_wrap">
					<img id="uploadImg" class="selPhoto" style="width: 150px; height: 150px; cursor: default;" src="${pageContext.request.contextPath}${seller.imgPath}">
				</div>
				<form id="pw_form" style="display: inline;" action="${pageContext.request.contextPath}/seller/pw_change.fdl" method="post">
				<input type="hidden" name="id" value="${seller.sellerId}">
				<input type="hidden" name="login" value="${seller.login}">
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
						<th><label for="newPassword">*비밀번호</label></th>
						<td>
							<input type="password" id="newPassword" name="password" class="changePassword input" style="display: none" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<td>
							<div id="div-pw">
								<button class="btn btn-secondary" id="changePasswordButton">비밀번호 변경하기</button>
							</div>
						</td>
					</tr>
					<tr class="changePassword" style="display:none">
						<th><label for="passwordChk">비밀번호 확인</label></th>
						<td>
							<input type="password" id="passwordChk" name="passwordChk" class="input" required>
						</td>
						<th></th>
					</tr>
					<tr class="changePassword" style="display:none">
						<td colspan="3">
							<div id="div-pw-edit">
								<input type="submit" class="btn btn-secondary" id="btn-pw-edit-submit" value="비밀번호 변경" style="cursor: pointer;">
							</div>
						</td>
					</tr>
					<tr class="changePassword" style="display:none">
						<td colspan="3">
							<div id="div-pw-edit-cancel">
								<button class="btn btn-secondary">취소</button>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="name">*이름</label></th>
						<td>
							<span class="info span">${seller.name}</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="gender">성별</label></th>
						<td>
							<span class="info span">${seller.gender}</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="age">나이</label></th>
						<td>
							<span class="info span">${seller.age}</span>
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
						<th><label for="companyRn1">*사업자 번호</label></th>
						<td>
							<span class="info span" id="companyRn"></span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="phoneNumber1">*연락처</label></th>
						<td>
							<span class="info span" id="phoneNumber"></span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="email">*이메일</label></th>
						<td>
							<span class="info span">${seller.email}</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="address">주소</label></th>
						<td>
							<span class="info span">${seller.address}</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<td>
							<div id="div-edit">
								<button class="btn btn-primary" id="btn-edit">수정</button>
							</div>
							<button class="btn btn-danger">회원탈퇴</button>
						</td>
						<th></th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</section>
</div>
</body>
</html>