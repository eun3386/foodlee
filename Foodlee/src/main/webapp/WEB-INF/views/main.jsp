<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!-- slider -->
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<!-- <link rel="stylesheet" type="text/css" href="resource/js/slick/slick-theme.css"/> -->

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- CSS -->
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/font-awesome.css" type="text/css" rel="stylesheet">


<link href="resources/css/index.css" type="text/css" rel="stylesheet">
<link href="resources/css/truckList.css" type="text/css" rel="stylesheet">



<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://d3js.org/topojson.v1.min.js"></script>

	<script type="text/javascript" src="resources/js/slick.min.js"></script>
      <script>
        var geocodes =[];

      $(document).ready(function () {
    
      	var ROOTCP = '<%= application.getContextPath()%>';
       
            var width = 500,
            height = 375;

        var svg = d3.select("#chart").append("svg")
            .attr("width", width)
            .attr("height", height);

        var map = svg.append("g").attr("id", "map");

        var projection = d3.geo.mercator()
            .center([126.9895, 37.5651])
            .scale(60000)
            .translate([width/2, height/2]);

        var path = d3.geo.path().projection(projection);

        d3.json("json/seoul_municipalities_topo_simple.json", function(error, data) {
          var features = topojson.feature(data, data.objects.seoul_municipalities_geo).features;
          map.selectAll('path')
              .data(features)
            .enter().append('path')
              .attr('class', function(d) { console.log(d.properties.code); 
                                          geocodes.push(d.properties.code);
                                           $(document).on('click',".c"+d.properties.code,function(){
                window.open("municipalityList.jsp","","width=1006px,height=580px");
            });
                                          return 'municipality c' + d.properties.code })
              .attr('d', path);

          map.selectAll('text')
              .data(features)
            .enter().append("text")
              .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
              .attr("dy", ".35em")
              .attr("class", "municipality-label")
              .text(function(d) { return d.properties.name; })
        });
      
        
//            for(var g=0; g< geocodes.length; g++){
//                var code = ".c"+geocodes[g];
//            $(document).on('click',code,function(){
//                window.open("municipality-list.html","","width=1006px,height=580px");
//            });
//                }
//            .click(function () {
//                window.open("municipality-list.html","","width=1006px,height=580px");
//            });
//            console.log("d");
	        $('.index-btn').on('click', function() {
	        	location.href = '<%= application.getContextPath()%>/mapMain.fdl';
	        	document.getElementById($('#map_content')).scrollIntoView();
	    		var offset = $('#map_container').offset();
	        	$('html').animate({scrollTop : offset.top}, 400);
// 	    		console.log("버튼")
// 	    		var url = ROOTCP +"/mapMain.fdl";
// 	    			url = url + "?pg=sourrounding";
// 	    		$('.map_container').load(url, function() {
// 	    			document.getElementById('map_content').scrollIntoView();
// 	    			console.log("sourrounding 로딩 완료!")
// 	    			var offset = $('#map_container').offset();
// 	        		$('html').animate({scrollTop : offset.top}, 400);
// 	    		})
	    	});
	        // 클릭시 스크롤 이동 -- 장재석
	        var page_url = window.location.href; 
	    	var page = page_url.substring(page_url.lastIndexOf("#") + 1); 
	    	if (page == 'event-list') {
	    		$('html, body').animate({
	    			scrollTop: $('#' + page).offset().top-150 
	    		}, 600);
	    	} else if(page == 'truck-list') {
	    		$('html, body').animate({
	    		scrollTop: $('#' + page).offset().top-150 
    			}, 600);
	    	}
	    	//
        });
        
//https://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040205&docId=283031734&qb=aHRtbCDsg4jssL0g7YGs6riw&enc=utf8&section=kin&rank=1&search_sort=0&spq=0
</script>


	

	<title> 푸들이 - 푸드트럭 나들이 </title>
</head>

<body id="wrapper">
    <div id="main-header">
        <div id="menu-list">
            <ul>
                <li><a href="#">위치찾기</a></li>
                <li><a href="#introduce">소개</a></li>
                <li><a href="#truck-list">푸드트럭</a></li>
                <li><a href="#event-list">이벤트</a></li>
            </ul>
        </div>
        <a href="#"><img class="logo" src="resources/css/imgs/logo.png"></a>
        <span id="loginjoin">
        <c:if test="${empty mbLoginName}">
        <a href="${pageContext.request.contextPath}/member/login_form.fdl" id='login'>로그인</a> / <a href="${pageContext.request.contextPath}/member/join_choice_form.fdl" id='join'>회원가입</a>
        </c:if>
        <c:if test="${not empty mbLoginName}"> <!-- adLoginName, selLoginName 때문에 셋다 나옴.. -->
        <a href="${pageContext.request.contextPath}/truck/my_page.fdl" id='mypage'>마이페이지</a>
        </c:if>
        </span>
    <hr class="line">
    </div>
    <div id="main-content">
        <div class="topo">
        	<h3 id="muni">서울시 푸드트럭 찾기</h3>
        	<div id="chart"></div>
    	</div>
	    <div class="index-btn">
	        <P id="search">내 주변 푸드트럭<br>찾기 <i class="far fa-compass"></i></P>
	    </div>
	    <div class="map_slider" style="position:relative; top:-160px">
			<%@ include file="common/map_sliderBottom.jsp" %>
		</div>
		<div id="introduce" style="position:relative; top:-160px; padding-top:120px;" >
			<%@include file="common/_introduce.jsp" %>
		</div>
        <div id="truck-list">
        	<%@include file="truck/truckList.jsp" %>
        </div>
        <div id="event-list">
        	<%@include file="event/_ev_list.jsp" %>
        </div>
    </div>
    
    <div id="footer">
    	<%@include file="common/_footer.jsp" %>
    </div>
    <!-- slider -->
<!-- 	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
	<script type="text/javascript" src="resources/js/slick.min.js"></script>
	<script type="text/javascript">
// 	슬라이드
		$('.map_slider').slick({
			  dots: false, // 속성설정
			  slidesToShow: 1, // 보여주는 화면 개수
			  slidesToScroll: 1, // 한줄 슬라이드
			  autoplay: true, // 자동 재생
			  autoplaySpeed: 2000, // 재생 속도
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
