<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


		
		<section class="main_section" id="section_edit">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
						<div class="msg">나의 정보 수정</div>
					</div>
				</div>
				<div class="content">
<!-- 					<div class="profile_wrap"> -->
<!-- 						<img src="./resources/css/imgs/mypage/profile.png"> -->
<!-- 						<img class="photo" src="./resources/css/imgs/mypage/photo.png"> -->
<!-- 					</div> -->
					<form action="my_info_update.fdl" method="post">
					<input type="hidden" name="login" value="${member.login}">
					<input type="hidden" name="password" value="${member.password}">
					<input type="hidden" name="residentRn" value="${member.residentRn}">
					<input type="hidden" name="phoneNumber" value="${member.phoneNumber}">
					<table class="table_edit" border = 10;>
						<tbody>
							<tr>
								<th>이름</th>
								<td><input type="text" name = "name" class="input" value="${member.name}"></td>
								<th></th>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input class = "id" name = "login" type="text" value="${member.login}"></td>
								<th></th>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="input" placeholder="현재 비밀번호"></td>
								<th></th>
							</tr>
							<tr>
								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" id="changePasswordButton">비밀번호 변경하기</button></div></td>
							</tr>
							<tr class="changePassword" style="display:none">
								<th>비밀번호 변경</th>
								<td><input type="password" class="input"></td>
								<th></th>
							</tr>
							<tr class="changePassword" style="display:none">
								<th>변경 확인</th>
								<td><input type="password" class="input"></td>
								<th></th>
							</tr>
							<tr class="changePassword" style="display:none">
								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" disabled>비밀번호 변경</button></div></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<label><input type="radio" name="gender" ${member.gender=='남'?'checked':''} value="남">남</label> 
									<label><input type="radio" name="gender" ${member.gender=='여'?'checked':''} value="여">여</label></td>
								<th></th>
							</tr>
							<tr>
								<th><label for="residentRn1">주민번호</label></th>
								<td><span class="reg_id" id="residentRn"></span></td>
								<th></th>
							</tr>
							<tr>
								<th><label for="phoneNumber1">연락처</label></th>
								<td><input type="text" class="input sm" id="phoneNumber1" name="phoneNumber1" maxlength="3" required> - 
								<input type="text" class="input sm" id="phoneNumber2" name="phoneNumber2" maxlength="4" required> -
								<input type="text" class="input sm" id="phoneNumber3" name="phoneNumber3" maxlength="4" required></td>
								<th></th>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="address" class="input" id="sample2_address" placeholder="주소" value="${member.address}"></td>
<!-- 								<td><input type="text" class="input" id="sample2_postcode" placeholder="우편번호"></td> -->
								<th></th>
							</tr>
							<tr>
<!-- 								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" onclick="sample2_execDaumPostcode()">우편번호 찾기</button></div></td> -->
							</tr>
							<tr>
								<th></th>
<%-- 								<td colspan="2"><input type="text" name="address" class="input" id="sample2_address" placeholder="주소" value="${member.address}"></td> --%>
								
							</tr>
							<tr>
								<th></th>
<!-- 								<td><input type="text" class="input" id="sample2_detailAddress" placeholder="상세주소"></td> -->
<!-- 								<td><input type="text" class="input" id="sample2_extraAddress" placeholder="참고항목"></td> -->
<!-- 								<th></th> -->
							</tr>
							
							<tr>
								<th></th>
								<td>
									<button class="btn btn-primary" type="submit">수정</button>
									<button class="btn btn-primary">취소</button>
									<button class="btn btn-danger">회원탈퇴</button>
								</td>
								<th></th>
							</tr>
						</tbody>
					</table>
					</form>
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:99;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:99" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
				</div>
			</div>
		</section>

<script>
var rRnStr = $('input[name=residentRn]').val();
var rRnSplit = rRnStr.split('-');
var rRnSplit1 = rRnSplit[0];
var rRnSplit2 = rRnSplit[1];
var rRnSplit2Str = rRnSplit2.substring(0,1)+'******';
$('#residentRn').html(rRnSplit1+'-'+rRnSplit2Str);
$('#residentRn1').val(rRnSplit1);
$('#residentRn2').val(rRnSplit2Str);
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

$(function() {
	  $("#changePasswordButton").on("click", function(e){
		  e.preventDefault();
		  $(".changePassword").show();
	  });

});

//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
  // iframe을 넣은 element를 안보이게 한다.
  element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample2_extraAddress").value = extraAddr;
          
          } else {
              document.getElementById("sample2_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample2_postcode').value = data.zonecode;
          document.getElementById("sample2_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample2_detailAddress").focus();

          // iframe을 넣은 element를 안보이게 한다.
          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
          element_layer.style.display = 'none';
      },
      width : '100%',
      height : '100%',
      maxSuggestItems : 5
  }).embed(element_layer);

  // iframe을 넣은 element를 보이게 한다.
  element_layer.style.display = 'block';

  // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
  initLayerPosition();
}

//브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
//resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
//직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
  var width = 300; //우편번호서비스가 들어갈 element의 width
  var height = 400; //우편번호서비스가 들어갈 element의 height
  var borderWidth = 5; //샘플에서 사용하는 border의 두께

  // 위에서 선언한 값들을 실제 element에 넣는다.
  element_layer.style.width = width + 'px';
  element_layer.style.height = height + 'px';
  element_layer.style.border = borderWidth + 'px solid';
  // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
  element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
  element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

</script>
