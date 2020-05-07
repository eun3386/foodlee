<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/ad.css" type="text/css" rel="stylesheet">
<link href="../../css/main.css" type="text/css" rel="stylesheet">
<link href="../css/reset.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</script>
<title>bossad</title>

</head>
<body>
<div>
	<header id="ad_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="main">
	<nav id=" main-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="infomodify" href="#">정보수정</a>
			<a class="ad" href="#">광고노출</a> 
			<a class="position" href="#">위치등록</a>
 		</form>
	</nav>
	<div>
		<h3>광고 등록하기  진행중인 광고</h3><!--  <h3>진행중인 광고</h3> -->
	</div>
		
		<div  id= "ad-top-div"class="ad-div"  > 
			<div id="ad-power-st" class= "ad-power">
			<table >
				<tr>
					<td class="ad-title1">파워링크</td>
				</tr>
				<tr>
					<td class="ad-price"><p>55,000<sub>원</sub></p></td>
					
				</tr>
				<tr>
					<td class="ad-text"><h4>소비자와 가장 가까운 광고! </h4></td>
				</tr>
				<tr>
					<td class="ad-text"><h4>높은 전환 효과를 기대할 수 있는</h4></td>
				</tr>
				<tr>
					<td class="ad-text"><h4>프리미엄 배너 광고 상품입니다.</h4></td>
					
				</tr>
				<tr>
					<td class="ad-text"><p><h4>낮은 비용과 높은 타겟팅 정확도를 누리세요</h4></p></td>
				</tr>

				<tr>
					<td class="ad-text">적용기간</td>
				</tr>
				<tr>
					<td class="ad-text"><input type="date"></td>
					<td class="ad-text">~</td>
				</tr>
				<tr>
					<td class="ad-text">노출위치</td>
					
				</tr>
				<tr>
					<td class="ad-text">oo구 oo동</td>
				</tr>
				<tr>
					<td><input type="reset" value="리셋"><input type="submit" value="등록"></td>
				</tr>
			</table> <!-- 파워링크 등록 -->
			</div>
			<div id="ad-banner-st" class= "ad-banner">
			<table  >
				
				<tr>
					<td class="ad-title2">배너광고</td>
				</tr>
				<tr>
					<td class="ad-price"><p>45,000<sub>원</sub></p></td>
					
				</tr>
				<tr>
					<td class="ad-text"><p><h4>띠베너 형태의 광고로 강력한 타겟팅 기능과</h4></p></td>
				</tr>
				<tr>
					<td class="ad-text"><p><h4>풍부하고 정확한 데이터를 지원하는 광고상품입니다.</h4></p></td>
				</tr>
				<tr>
					<td class="ad-text"><p><h4>광고 노출에 따른 인지도 증가 효과!</h4></p></td>
				</tr>

				<tr>
					<td class="ad-text">적용기간</td>
				</tr>
				<tr>
					<td class="ad-text"><input type="date"></td>
					<td class="ad-text">~</td>
				</tr>
				<tr>
					<td class="ad-text">노출위치</td>
					
				</tr>
				<tr>
					<td class="ad-text">oo구 oo동</td>
				</tr>
				<tr>
					<td><button>등록</button></td>
				</tr>
			</table>	<!-- 베너광고 등록-->
			</div>
		</div>
		
		
	
		<div id= "ad-bot-div" class="ad-div">
			<table  id="ad-power-ing" class= "ad-power" >
				
				<tr>
					<td class="ad-title3">파워링크</td>
				</tr>
				<tr>
					<td class="ad-price"><p>55,000<sub>원</sub></p></td>
					
				</tr>
				<tr>
					<td class="ad-text"><p><h4>지역 키보드에 노출되는 검색광고 상품입니다.</h4></p></td>
				</tr>
				<tr>
					<td class="ad-text"><p><h4>검색광고 이젠 선택이 아닌 필수입니다.</h4></p></td>
				</tr>
				
				<tr>
					<td class="ad-text">적용기간</td>
				</tr>
				<tr>
					<td class="ad-text"><input type="date"></td>
					<td class="ad-text">~</td>
				</tr>
				<tr>
					<td class="ad-text">노출위치</td>
					
				</tr>
				<tr>
					<td class="ad-text">oo구 oo동</td>
				</tr>
				<tr>
					<td><button>해지</button></td>
				</tr>
			</table><!-- 파워링크 해지 -->

			<table id="ad-banner-ing" class= "ad-banner">
				
				<tr>
					<td class="ad-title4">배너광고</td>
				</tr>
				<tr>
					<td class="ad-price"><p>45,000<sub>원</sub></p></td>
					
				</tr>
				<tr>
					<td class="ad-text"><p><h4>띠배너 형태의 상품입니다.</h4></p></td>
				</tr>
				<tr>
					<td class="ad-text">적용기간</td>
				</tr>
				<tr>
					<td class="ad-text">적용날짜</td>
					<td class="ad-text">~</td>
				</tr>
				<tr>
					<td class="ad-text">노출위치</td>
					
				</tr>
				<tr>
					<td class="ad-text">oo구 oo동</td>
				</tr>
				<tr>
					<td><button>해지</button></td>
				</tr>
			</table>
		</div><!-- 베너광고 해지 -->
		
	</div>
	<div id="footer">
		
	</div>
</body>
</html>