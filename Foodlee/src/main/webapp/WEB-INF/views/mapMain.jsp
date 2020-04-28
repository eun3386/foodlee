<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Map_main</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- slider -->
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<!-- <link rel="stylesheet" type="text/css" href="resource/js/slick/slick-theme.css"/> -->

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- CSS -->
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/font-awesome.css" type="text/css" rel="stylesheet">

<!-- 네이버 맵 -->
<!-- <script type="text/javascript" src="https://openapi.map.map_naver.com/openapi/v3/maps.js?ncpClientId=ksauwx09vv"></script> -->
<!-- <script type="text/javascript" src="https://openapi.map.map_naver.com/openapi/v3/maps.js?clientId=ksauwx09vv&submodules=geocoder"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ksauwx09vv&submodules=geocoder"></script>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">

</head>
<script type="text/javascript">
$(document).ready(function() {
	var ROOTCP = '<%= application.getContextPath()%>';
	
// 	$('#map_logo').click(function() {
// 		$(location).attr('href','main.html');
// 	});

	$(".map_title").click(function(e) {
		e.preventDefault();
		$(".map_nav").slideToggle();
		$(".map_title").toggleClass("open");
		
		if($(".map_title").hasClass("open")){
         //open이 있을 때
	         $(".btn").find(">i").attr("class","fa fa-angle-up");
	     } else {
	         //open이 없을 때
	         $(".btn").find(">i").attr("class","fas fa-bars fa");
	     }
	});
// 	$(".btn").click(function(e){
//         e.preventDefault();
//         $(".map_nav").slideToggle();
//         $(".btn").toggleClass("open");
// //         var btn = $(".btn").find(">i").attr("class");
// //         alert(btn);

//         if($(".btn").hasClass("open")){
//             //open이 있을 때
//             $(".btn").find(">i").attr("class","fa fa-angle-up");
//         } else {
//             //open이 없을 때
//             $(".btn").find(">i").attr("class","fas fa-bars fa");
//         }
//     });
	$('.h_search').click (function() {
		$(location).attr('href','main.html');
	});
// 	$('#s_search').click(function() {
// 		var url = ROOTCP +"/frame/surrounding_area.jsp";
// 			url = url + "?pg=sourrounding";
// 		$('#map_container').load(url, function() {
// 			document.getElementById('map_content').scrollIntoView();
// 			console.log("sourrounding 로딩 완료!")
// 		})
// 	});
// 	$('#d_search').click(function() {
// 		var url = ROOTCP +"/frame/distinct_area.jsp";
// 			url = url + "?pg=distinct";
// 		$('#map_container').load(url, function() {
// 			document.getElementById('gu-list-table').scrollIntoView();
// 			console.log("distinct 로딩 완료!");
// 		})
// 	});
	
	$('#s_search').click(function() {
		var offset = $('#map_container').offset();
		$('html').animate({scrollTop : offset.top}, 400);
	});
// 	$('#d_search').click(function() {
// 		var offset = $('#gu-list-table').offset();
// 		$('html').animate({scrollTop : offset.top}, 400);
// 	});
});
</script>
<body>
	<div id="map_wrap">
		<header id="map_header">
			<%@ include file="common/_header.jsp"%>
		</header>
		<section id="map_container">
			<%@ include file="common/map_main_frame.jsp"%>
		</section>
		<footer id="map_footer">
			<jsp:include page="common/_footer.jsp" />
		</footer>
	</div>
	<!-- slider -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="resources/js/slick.min.js"></script>
	<script type="text/javascript">
// 	슬라이드
		$('.map_slider').slick({
			  dots: false, // 속성설정
			  slidesToShow: 3, // 보여주는 화면 개수
			  slidesToScroll: 1, // 한줄 슬라이드
			  autoplay: true, // 자동 재생
			  autoplaySpeed: 1500, // 재생 속도
			  arrows: false, // 화살표 없애기
			  responsive: [ // 반응형 에 대한 설정
	                {
	                    breakpoint: 768,
	                    settings: {
	                        arrows: false,
	                        dots: false
	                        }
	                }
	                ]
		});
	</script>
</body>
</html>