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
		//
		var cRnStr = $('input[name=companyRn]').val();
		var cRnSplit = cRnStr.split('-');
		var cRnSplit1 = cRnSplit[0];
		var cRnSplit2 = cRnSplit[1];
		var cRnSplit3 = cRnSplit[2];
		$('#companyRn1').val(cRnSplit1);
		$('#companyRn2').val(cRnSplit2);
		$('#companyRn3').val(cRnSplit3);
		//
		var pnStr = $('input[name=phoneNumber]').val();
		var pnSplit = pnStr.split('-');
		var pnSplit1 = pnSplit[0];
		var pnSplit2 = pnSplit[1];
		var pnSplit3 = pnSplit[2];
		$('#phoneNumber1').val(pnSplit1);
		$('#phoneNumber2').val(pnSplit2);
		$('#phoneNumber3').val(pnSplit3);
		//
		
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
		
		$("input[name='phoneNumber']").blur(function(){
			
			var phonenum = $('#phoneNumber').val();
			
			if( phonenum == '' || phonenum == 'undefined') return;
			
			var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		
			if(!regPhone.test(phonenum)){
			 	 alert('잘못된 휴대폰 번호 양식입니다.');
			 	 return false;    
			 }
		});
		// TODO
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
		
		$('#join_submit_btn').click(function() {
			var result = confirm('가입 하시겠습니까?');
			if(result) { //yes 
				location.replace('${pageContext.request.contextPath}/login_form.fdl');
			} else { //no
				location.replace('${pageContext.request.contextPath}/seller/join_form.fdl'); 
			} 
		});
		//
		
	});
</script>
<title>푸들이 - 판매자 정보 수정</title>
</head>
<body id="wrapper">
<div id="infomain">
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
					<img id="uploadImg" class="editPhoto" style="width: 150px; height: 150px; cursor: pointer;" src="${pageContext.request.contextPath}${seller.imgPath}">
				</div>
				<form style="display: inline;" action="${pageContext.request.contextPath}/seller/update.fdl" method="post">
					<input type="hidden" name="id" value="${seller.sellerId}">
					<input type="hidden" name="login" value="${seller.login}">
					<input type="hidden" name="companyRn" value="${seller.companyRn}">
					<input type="hidden" name="phoneNumber" value="${seller.phoneNumber}">
				<table class="table_edit">
					<tr>
						<th><label for="name">*이름</label></th>
						<td>
							<input type="text" id="name" name="name" class="input" value="${seller.name}" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="gender">성별</label></th>
						<td>
							<label><input type="radio" name="gender" ${seller.gender=='남'?'checked':''} value="남">남</label>
							<label><input type="radio" name="gender" ${seller.gender=='여'?'checked':''} value="여">여</label>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="age">나이</label></th>
						<td>
							<input type="number" class="input sm" id="age" name="age" value="${seller.age}">
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="companyRn1">*사업자 번호</label></th>
						<td>
							<span>
								<input type="text" class="input sm" id="companyRn1" name="companyRn1" maxlength="3" required> - 
								<input type="text" class="input sm" id="companyRn2" name="companyRn2" maxlength="2" required> - 
								<input type="text" class="input sm" id="companyRn3" name="companyRn3" maxlength="5" required>
							</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="phoneNumber1">*연락처</label></th>
						<td>
							<span>
								<input type="text" class="input" id="phoneNumber" name="phoneNumber" value="${seller.phoneNumber}" placeholder="ex)010-1234-5678" maxlength="20" required>
							</span>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="email">*이메일</label></th>
						<td>
							<input type="text" class="input" id="email" name="email" value="${seller.email}" placeholder="ex)E-mail@gmail.com" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="address">주소</label></th>
						<td>
							<textarea rows="2" cols="30" style="resize: none" id="addressInput" class="input">${seller.address}</textarea>
							<input type="hidden" id="address" name="address">
						</td>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<td>
							<input type="submit" class="btn" id="btn-edit-submit" value="수정완료" disabled="disabled">
							<button class="btn btn-primary" id="btn-edit-cancel">뒤로가기</button>
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