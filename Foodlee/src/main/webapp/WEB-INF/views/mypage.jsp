<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" type="text/css" href="./resources/css/mpreset.css">
<link rel="stylesheet" type="text/css" href="./resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script type="text/javascript" src="./js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="./js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<header id="header">
		<a href="#">
			<img class="logo" src="./resource/css/imgs/logo.png">
		</a>
		<div class="wrapper">
			<ul class="nav clearfix">
<!-- 				<li><a href="#">회원가입</a></li> -->
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</header>
	<div class="main">
		<div id="main_nav_spacer">
			<div id="main_nav">
				<button data-to="section_menu" class="active">먹고싶은 메뉴</button>
				<button data-to="section_orderlist">주문내역</button>
				<button data-to="section_manage">댓글/리뷰 관리</button>
				<button data-to="section_edit">정보수정</button>
			</div>
		</div>
		<section class="main_section" id="section_menu">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(192, 57, 43)" data-svg-content="true"><g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>
						<div class="msg">먹고 싶은 메뉴</div>
					</div>
				</div>

				<div class="cards clearfix">
					<div class="card_wrap">
						<div class="card">
							<div class="thumb"><img src="./resources/css/imgs/mypage/menu/1.png"></div>
							<div class="content">
								<div class="menu_name">BOP (밥)</div>
								<div class="description">눈꽃 목살 스테이크</div>
								<div class="price">7,500원</div>
							</div>
						</div>
					</div>
					<div class="card_wrap">
						<div class="card">
							<div class="thumb"><img src="./resources/css/imgs/mypage/menu/2.png"></div>
							<div class="content">
								<div class="menu_name">브라더 또띠아</div>
								<div class="description">불고기 부리또</div>
								<div class="price">5,000원</div>
							</div>
						</div>
					</div>
					<div class="card_wrap">
						<div class="card">
							<div class="thumb"><img src="./resources/css/imgs/mypage/menu/3.png"></div>
							<div class="content">
								<div class="menu_name">로우코 바비큐 하우스</div>
								<div class="description">저크치킨스테이크</div>
								<div class="price">10,000원</div>
							</div>
						</div>
					</div>
					<div class="card_wrap">
						<div class="card">
							<div class="thumb"><img src="./resources/css/imgs/mypage/menu/4.png"></div>
							<div class="content">
								<div class="menu_name">안녕연어</div>
								<div class="description">안녕연어덮밥</div>
								<div class="price">5,500원</div>
							</div>
						</div>
					</div>
				</div>
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
							<tr><td>1</td><td></td><td></td><td></td><td></td><td></td></tr>
							<tr><td>2</td><td></td><td></td><td></td><td></td><td></td></tr>
							<tr><td>3</td><td></td><td></td><td></td><td></td><td></td></tr>
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
							<th>메뉴</th>
							<th>댓글</th>
						</tr>
					</thead>
					<tbody>
							<tr><td>1</td><td></td><td></td><td></td></tr>
							<tr><td>2</td><td></td><td></td><td></td></tr>
							<tr><td>3</td><td></td><td></td><td></td></tr>
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
							<th>메뉴</th>
							<th>수량</th>
							<th>결제금액</th>
							<th>리뷰 쓰기</th>
						</tr>
					</thead>
					<tbody>
							<tr><td>1</td><td></td><td></td><td></td><td></td><td></td></tr>
							<tr><td>2</td><td></td><td></td><td></td><td></td><td></td></tr>
							<tr><td>3</td><td></td><td></td><td></td><td></td><td></td></tr>
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
								<td><input type="text" class="input"></td>
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
								<td><label><input type="radio" name="gender" checked="checked">남</label> <label><input type="radio" name="gender">여</label></td>
								<th></th>
							</tr>
							<tr>
								<th>주민번호</th>
								<td><span class="reg_id">123456-1******</span></td>
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
								<td><input type="text" class="input" value="서울시"></td>
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
	</div>
	<div id='footer'>
		<jsp:include page="common/_footer.jsp" />
	</div>
	<script>
$(function() {
	  $("#changePasswordButton").on("click", function(e){
		  e.preventDefault();
		  $(".changePassword").show();
	  });

});
</script>
</body>
</html>