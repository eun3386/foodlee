<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpreset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script src="resources/js/jquery-3.5.0.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 우편주소 api -->
<style>
#section_edit {
	display: unset;
}
</style>
</head>
<body>
<%@include file="mp_header.jsp" %>
<div class="main">
	<div id="main_nav_spacer">
		<div id="main_nav">
			<button data-to="section_menu" onClick="location.href='../my_page.fdl'">먹고싶은 메뉴</button>
			<button data-to="section_orderlist" >주문내역</button>
			<button data-to="section_manage" >댓글/리뷰 관리</button>
			<button data-to="section_edit" class="active"  onClick="location.href='my_page_mem.fdl'">정보수정</button>
		</div>
	</div>
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
					<form action="my_info_update.fdl" method="post">
					<table class="table_edit">
						<tbody>
							<tr>
								<th>이름</th>
								<td><input name="name" type="text" class="input" value="${member.name}"></td>
								<th></th>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input name = "login" type="text" value="${member.login}"></td>
								<th></th>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="input" value="${member.password}"></td>
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
								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary">비밀번호 변경</button></div></td>
							</tr>
							<tr>
								<th>성별</th>
								<td><label><input type="radio" name="gender" checked="checked">남</label> <label><input type="radio" name="gender">여</label></td>
								<th></th>
							</tr>
							<tr>
								<th>주민번호</th>
								<td><span class="reg_id" name = "residentRn" value="${member.residentRn}">${member.residentRn}</span></td>
								<th></th>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name = "phoneNumber" class="input sm" value="${member.phoneNumber}"></td>
								<th></th>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="input" id="sample2_postcode" placeholder="우편번호"></td>
								<th></th>
							</tr>
							<tr>
								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary" onclick="sample2_execDaumPostcode()">우편번호 찾기</button></div></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="input" id="sample2_address" placeholder="주소"></td>
								
							</tr>
							<tr>
								<th></th>
								<td><input type="text" class="input" id="sample2_detailAddress" placeholder="상세주소"></td>
								<td><input type="text" class="input" id="sample2_extraAddress" placeholder="참고항목"></td>
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
</div>
</body>
</html>