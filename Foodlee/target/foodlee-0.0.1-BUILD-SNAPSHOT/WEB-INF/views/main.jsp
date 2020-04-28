<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--<link href="css/reset.css" type="text/css" rel="stylesheet">-->
<link href="css/main.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.slim.min.js" integrity="sha256-MlusDLJIP1GRgLrOflUQtshyP0TwT/RHXsI1wWGnQhs=" crossorigin="anonymous"></script>
<!--<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">    -->
<script src="https://d3js.org/d3.v3.min.js"></script>
        <script src="https://d3js.org/topojson.v1.min.js"></script>
        <script>
                    var geocodes =[];

        $(document).ready(function () {
            
       
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

        d3.json("seoul_municipalities_topo_simple.json", function(error, data) {
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
        });
            
        
//https://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040205&docId=283031734&qb=aHRtbCDsg4jssL0g7YGs6riw&enc=utf8&section=kin&rank=1&search_sort=0&spq=0
</script>
    

	<title> 푸들이 - 푸드트럭 나들이 </title>
</head>

<body id="wrapper">
    <div id="main-header">
        <div id="menu-list">
            <ul>
                <li><a href="#">메뉴</a></li>
                <li><a href="#">메뉴</a></li>
                <li><a href="#">메뉴</a></li>
                <li><a href="#">메뉴</a></li>
            </ul>
        </div>
        <a href="#"><img class="logo" src="css/imgs/logo.png"></a>
        <span id="loginjoin"><a href="#" id='login'>로그인</a> / <a href="#" id='join'>회원가입</a></span>
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
    </div>
    
    <div id="footer"></div>
</body>
</html>

