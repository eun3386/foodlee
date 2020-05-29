<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpreset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script src="resources/js/jquery-3.5.0.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 우편주소 api -->
</head>
<body>
	
		<%@include file="my/mp_header.jsp" %>
	
	<div class="main">
		<div id="main_nav_spacer">
			<div id="main_nav">
				<button data-to="section_menu" class="active" >먹고싶은 메뉴</button>
				<button data-to="section_orderlist" >주문내역</button>
				<button data-to="section_manage" >댓글/리뷰 관리</button>
				<button data-to="section_edit" >정보수정</button>
			</div>
		</div>

		<%@include file="my/mp_like_list.jsp" %>

		<section class="main_section" id="section_orderlist">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" enable-background="new 0 0 16 16" xml:space="preserve" fill="rgb(36, 133, 77)" data-svg-content="true"> <g><path d="M 26,2l-6,0 c0-1.104-0.896-2-2-2L 14,0 C 12.896,0, 12,0.896, 12,2L 6,2 C 4.896,2, 4,2.896, 4,4l0,26 c0,1.104, 0.896,2, 2,2l 20,0 c 1.104,0, 2-0.896, 2-2L 28,4 C 28,2.896, 27.104,2, 26,2z M 26,28L 6,28 L 6,4 l 4,0 c0,1.104, 0.896,2, 2,2l 2,0 l 4,0 l 2,0 c 1.104,0, 2-0.896, 2-2l 4,0 L 26,28 zM 8,11C 8,11.552, 8.448,12, 9,12l 14,0 C 23.552,12, 24,11.552, 24,11C 24,10.448, 23.552,10, 23,10l-14,0 C 8.448,10, 8,10.448, 8,11zM 23,16l-14,0 C 8.448,16, 8,16.448, 8,17C 8,17.552, 8.448,18, 9,18l 14,0 C 23.552,18, 24,17.552, 24,17 C 24,16.448, 23.552,16, 23,16zM 23,22l-14,0 C 8.448,22, 8,22.448, 8,23C 8,23.552, 8.448,24, 9,24l 14,0 c 0.552,0, 1-0.448, 1-1 C 24,22.448, 23.552,22, 23,22z"></path></g></svg>
						<div class="msg">주문한 내역</div>
					</div>
				</div>

				<table class="table">
					<thead>
						<tr>
							<th>NO.</th>
							<th>가게</th>
							<th>메뉴</th>
							<th>수량</th>
							<th>결제금액</th>
							<th>리뷰 쓰기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order">
							<tr>
								<td>${order.id}</td>
								<td>${order.foodtruck}</td>
								<td>${order.menu}</td>
								<td>${order.count}</td>
								<td>${order.price}</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pagination">
					<a href="#">&lt;</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">&gt;</a>
				</div>
			</div>
		</section>

		<section class="main_section" id="section_manage">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 42 32" enable-background="new 0 0 42 32" xml:space="preserve" data-svg-content="true" fill="rgb(242, 92, 5)"> <g> <path fill="rgb(242, 92, 5)" d="M35.652,14.023c-0.264-0.082-0.544,0.062-0.628,0.325c-0.083,0.263,0.062,0.544,0.325,0.628   C39.257,16.221,41,18.078,41,21c0,2.599-2.371,4.616-3.783,5.588C37.081,26.682,37,26.835,37,27v3.823   c-0.73-0.272-2.003-0.89-3.126-2.155c-0.117-0.131-0.295-0.191-0.468-0.159c-0.285,0.055-0.576,0.133-0.871,0.212   C32.025,28.858,31.499,29,31,29c-2.568,0-4.366-0.552-6.204-1.903c-0.224-0.164-0.535-0.115-0.699,0.107   c-0.164,0.223-0.116,0.535,0.106,0.699C26.23,29.393,28.199,30,31,30c0.631,0,1.223-0.159,1.795-0.313   c0.178-0.049,0.355-0.097,0.53-0.138c1.869,1.974,3.983,2.423,4.075,2.441c0.033,0.007,0.066,0.01,0.1,0.01   c0.114,0,0.227-0.039,0.316-0.113C37.933,31.792,38,31.65,38,31.5v-4.239c2.582-1.841,4-4.057,4-6.261   C42,17.619,39.983,15.402,35.652,14.023z"></path> <path fill="rgb(242, 92, 5)" d="M33,13.5C33,5.804,25.982,0,16.677,0C7.325,0,0,5.931,0,13.502c0,4.539,3.211,7.791,6,9.759v6.636   c0,0.17,0.086,0.327,0.228,0.42c0.083,0.053,0.177,0.08,0.272,0.08c0.069,0,0.139-0.015,0.205-0.044   c0.146-0.065,3.559-1.616,6.479-4.809c1.265,0.235,2.696,0.461,3.994,0.461C26.641,26.005,33,20.979,33,13.5z M17.177,25.005   c-1.31,0-2.799-0.251-4.083-0.496c-0.173-0.031-0.351,0.028-0.468,0.159c-2.05,2.312-4.459,3.781-5.626,4.414V23   c0-0.165-0.081-0.318-0.217-0.412C4.145,20.773,1,17.725,1,13.502C1,6.491,7.886,1,16.677,1C25.413,1,32,6.374,32,13.5   C32,20.382,26.043,25.005,17.177,25.005z"></path> <path fill="rgb(242, 92, 5)" d="M16.5,11.5c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S17.603,11.5,16.5,11.5z M16.5,14.5   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S17.051,14.5,16.5,14.5z"></path> <path fill="rgb(242, 92, 5)" d="M23.5,11.5c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S24.603,11.5,23.5,11.5z M23.5,14.5   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S24.051,14.5,23.5,14.5z"></path> <path fill="rgb(242, 92, 5)" d="M9.5,11.595c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S10.603,11.595,9.5,11.595z M9.5,14.595   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S10.051,14.595,9.5,14.595z"></path> </g> </svg>
						<div class="msg">댓글관리</div>
					</div>
				</div>


				<table class="table sm">
					<thead>
						<tr>
							<th>NO.</th>
							<th>가게</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="qna">
							<tr>
								<td>${qna.id}</td>
								<td>${qna.foodtruck}</td>
								<td>${qna.content}</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
				
				<div class="pagination">
					<a href="#">&lt;</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">&gt;</a>
				</div>

				<div class="title" style="margin-top:80px;">
					<div class="icon">
						<svg width="70" height="70" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve" data-svg-content="true" fill="rgb(242, 92, 5)"> <g> <path fill="rgb(242, 92, 5)" d="M1.5,32h29c0.827,0,1.5-0.673,1.5-1.5v-29C32,0.673,31.327,0,30.5,0h-29C0.673,0,0,0.673,0,1.5v29   C0,31.327,0.673,32,1.5,32z M1,1.5C1,1.224,1.225,1,1.5,1h29C30.775,1,31,1.224,31,1.5v29c0,0.276-0.225,0.5-0.5,0.5h-29   C1.225,31,1,30.776,1,30.5V1.5z"></path> <path fill="rgb(242, 92, 5)" d="M4,28.479c0.048,0,0.096-0.007,0.143-0.021l10-2.979c0.081-0.024,0.154-0.068,0.213-0.127l10.09-10.205   c0.023-0.024,0.035-0.053,0.052-0.08l3.658-3.658c0.607-0.607,0.607-1.595,0-2.203L22.92,3.972c-0.607-0.607-1.595-0.608-2.202,0   l-3.739,3.739c-0.024,0.024-0.036,0.054-0.054,0.081L6.807,17.911c-0.056,0.056-0.098,0.124-0.122,0.199l-3.16,9.715   c-0.058,0.177-0.012,0.371,0.117,0.504C3.737,28.426,3.867,28.479,4,28.479z M17.359,8.771l1.04,1.04l-8.523,8.563l-1.727-0.392   L17.359,8.771z M10.5,19.165l8.607-8.646l2.434,2.434L12.796,21.5H10.5V19.165z M23.385,14.797l-9.246,9.352l-0.576-1.999   l8.684-8.489L23.385,14.797z M7.493,18.859L9.5,19.315V22c0,0.276,0.224,0.5,0.5,0.5h2.624l0.633,2.2l-8.487,2.528L7.493,18.859z    M21.425,4.679c0.218-0.217,0.572-0.216,0.788,0l5.235,5.235c0.218,0.217,0.218,0.571,0,0.789l-3.372,3.372l-6.023-6.023   L21.425,4.679z"></path> </g> </svg>
						<div class="msg">리뷰관리</div>
					</div>
				</div>


				<table class="table sm">
					<thead>
						<tr>
							<th>NO.</th>
							<th>가게</th>
							<th>리뷰사진</th>
							<th>리뷰내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList}" var="review">
							<tr>
								<td>${review.id}</td>
								<td>${review.foodtruck}</td>
								<td>${review.picture}</td>
								<td>${review.content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="pagination">
					<a href="#">&lt;</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">&gt;</a>
				</div>
			</div>
		</section>
		
		<%@include file="my/mp_profile.jsp" %>
		
<!-- 		<section class="main_section" id="section_edit"> -->
<!-- 			<div class="wrapper"> -->
<!-- 				<div class="title"> -->
<!-- 					<div class="icon"> -->
<!-- 						<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg> -->
<!-- 						<div class="msg">나의 정보 수정</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="content"> -->
<!-- 					<div class="profile_wrap"> -->
<!-- 						<img src="./resources/css/imgs/mypage/profile.png"> -->
<!-- 						<img class="photo" src="./resources/css/imgs/mypage/photo.png"> -->
<!-- 					</div> -->
<!-- 					<form action="my_info_update.fdl" method="post"> -->
<!-- 					<table class="table_edit"> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<th>이름</th> -->
<%-- 								<td><input type="text" class="input" value="${member.name}"></td> --%>
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>아이디</th> -->
<%-- 								<td><span class='id' value="${member.login}"></span></td> --%>
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>비밀번호</th> -->
<%-- 								<td><input type="password" class="input" value="${member.password}"></td> --%>
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" id="changePasswordButton">비밀번호 변경하기</button></div></td> -->
<!-- 							</tr> -->
<!-- 							<tr class="changePassword" style="display:none"> -->
<!-- 								<th>비밀번호 변경</th> -->
<!-- 								<td><input type="password" class="input"></td> -->
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr class="changePassword" style="display:none"> -->
<!-- 								<th>변경 확인</th> -->
<!-- 								<td><input type="password" class="input"></td> -->
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr class="changePassword" style="display:none"> -->
<!-- 								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary">비밀번호 변경</button></div></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>성별</th> -->
<!-- 								<td><label><input type="radio" name="gender" checked="checked">남</label> <label><input type="radio" name="gender">여</label></td> -->
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>주민번호</th> -->
<%-- 								<td><span class="reg_id" value="${member.residentRn}">${member.residentRn}</span></td> --%>
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>연락처</th> -->
<%-- 								<td><input type="text" class="input sm" value="${member.phoneNum}"></td> --%>
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>주소</th> -->
<!-- 								<td><input type="text" class="input" id="sample2_postcode" placeholder="우편번호"></td> -->
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" onclick="sample2_execDaumPostcode()">우편번호 찾기</button></div></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th></th> -->
<!-- 								<td colspan="2"><input type="text" class="input" id="sample2_address" placeholder="주소"></td> -->
								
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th></th> -->
<!-- 								<td><input type="text" class="input" id="sample2_detailAddress" placeholder="상세주소"></td> -->
<!-- 								<td><input type="text" class="input" id="sample2_extraAddress" placeholder="참고항목"></td> -->
<!-- <!-- 								<th></th> --> -->
<!-- 							</tr> -->
							
<!-- 							<tr> -->
<!-- 								<th></th> -->
<!-- 								<td> -->
<!-- 									<button class="btn btn-primary" type="submit">수정</button> -->
<!-- 									<button class="btn btn-primary">취소</button> -->
<!-- 									<button class="btn btn-danger">회원탈퇴</button> -->
<!-- 								</td> -->
<!-- 								<th></th> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 					</form> -->
<!-- 					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:99;-webkit-overflow-scrolling:touch;"> -->
<!-- <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:99" onclick="closeDaumPostcode()" alt="닫기 버튼"> -->
<!-- </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

	</div>
	
	<div id='footer'>
		<%@include file="common/_footer.jsp" %>
	</div>
<script>
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
</body>
</html>