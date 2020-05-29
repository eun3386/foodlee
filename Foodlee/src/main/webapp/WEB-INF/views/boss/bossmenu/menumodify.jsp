<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/foodlee/resources/css/menuAdd.css">
<style type="text/css">
	#section_edit{display:block; background-color:#d1e6f5;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#menuInforTxt').blur(function() {
			if( $('#menuInforTxt').val() != null ) {
				var val = $('#menuInforTxt').val();
				$('#menuInfor').attr('value',val);
				var mnVal = $('#menuInfor').val();
				console.log('menuValue = '+mnVal);
			}
		});
		
	});
</script>
<title>메뉴추가/수정</title>
</head>
<body id="wrapper">
	<div id="infomain">
	<nav id=" in-main-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="infomodify" href="#">정보수정</a>
			<a class="ad" href="#">광고노출</a> 
			<a class="position" href="#">위치등록</a>
 		</form>
	</nav>
	</div>
	<section class="main_section" id="section_edit">
		<div class="wrapper">
			<div class="title">
				<div class="icon">
					<svg width="70" height="70" viewBox="0 0 32.24800109863281 32.24800109863281" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(44, 62, 80)" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
					<div class="msg">메뉴 등록</div>
				</div>
			</div>
			<div class="content">
				<div class="profile_wrap">
					<img src="${pageContext.request.contextPath}/resources/css/imgs/mypage/profile.png">
					<img class="photo" src="${pageContext.request.contextPath}/resources/css/imgs/mypage/photo.png">
				</div>
				<form style="display: inline;" action="${pageContext.request.contextPath}/seller/menu_add.fdl" method="post">
					<input type="hidden" name="id" value="${seller.id}">
					<input type="hidden" name="menuPic" value="메뉴사진더미">
				<table class="table_edit">
					<tr>
						<th><label for="menuName">메뉴 이름</label></th>
						<td>
							<input type="text" id="menuName" name="menuName" class="input">
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="menuType">메뉴 종류</label></th>
						<td>
							<select id="menuType" name="menuType" class="menuinput">
								<option value="snack">간식</option>
								<option value="meal">식사</option>
								<option value="dessert">디저트</option>
								<option value="riceCar">밥차</option>
							</select>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="menuPrice">메뉴 가격</label></th>
						<td>
							<input type="number" id="menuPrice" name="menuPrice" class="input" value="5000" step="100" min="500" max="15000" required>
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="menuInforTxt">메뉴 정보</label></th>
						<td>
							<textarea id="menuInforTxt" rows="3" cols="30" style="resize: none;"></textarea>
							<input type="hidden" id="menuInfor" name="menuInfor">
						</td>
						<th></th>
					</tr>
					<tr>
						<th><label for="rawMaterials">메뉴 원재료</label></th>
						<td>
							<input type="text" class="input" id="rawMaterials" name="rawMaterials">
						</td>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<td>
							<input type="submit" class="btn" id="" value="등록">
							<input type="reset" class="btn" id="" value="리셋">
						</td>
						<th></th>
					</tr>
				</table>	
				</form>
			</div>
		</div>
	</section>
</body>
</html>