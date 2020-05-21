<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="/foodlee/resources/css/mpreset.css"> -->
<link rel="stylesheet" type="text/css" href="/foodlee/resources/css/mpstyle.css">
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
	});
	$(function() {
		  $("#changePasswordButton").on("click", function(e){
			  e.preventDefault();
			  $(".changePassword").show();
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
								<th>이름</th>
								<td><span class='name'>홍길동</span></td>
								<th></th>
							</tr>
							<tr>
								<th>아이디</th>
								<td><span class='id'>test123</span></td>
								<th></th>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="input" value="11111111"></td>
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
								<td><label><input type="radio" name="gender">남</label> <label><input type="radio" name="gender">여</label></td>
								<th></th>
							</tr>
							<tr>
								<th>주민번호</th>
								<td><span class="reg_id">123456-1******</span></td>
								<th></th>
							</tr>
							<tr>
								<th>사업자 번호</th>
								<td><input type="text" class="input sm" value="01023"> - <input type="text" class="input sm" value="12345"> - <input type="text" class="input sm" value="12346"></td>
								<th></th>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" class="input sm" value="010"> - <input type="text" class="input sm" value="1234"> - <input type="text" class="input sm" value="1234"></td>
								<th></th>
							</tr>
							<tr>
								<th>우편번호</th>
								<td><input type="text" class="input" value="123-456"></td>
								<th></th>
							</tr>
							<tr>
								<td colspan="3"><div class=" btn-abs"><button class="btn btn-secondary">우편번호 찾기</button></div></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="input" name="address" value="서울시"></td>
								<th></th>
							</tr>
							<tr>
								<th></th>
								<td><input type="text" class="input" value="123호"></td>
								<th></th>
							</tr>
							<tr>
								<th></th>
								<td>
									<button class="btn btn-primary">수정</button>
									<button class="btn btn-primary">취소</button>
									<button class="btn btn-danger">회원탈퇴</button>
								</td>
								<th></th>
							</tr>
						</tbody>
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