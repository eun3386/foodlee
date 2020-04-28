<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="css/reset.css" type="text/css" rel="stylesheet">
<link href="css/main.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $( function() {
        $( document ).tooltip();
      } );
    $(document).ready(function () {
          $(".fa-times").click(function() {
             window.close(); 
          });
    });
  </script>
    <style>
        .ui-tooltip {
            
            white-space: pre-line;
        }
    </style>
	<title> 성동구 푸드트럭 정보 </title>
</head>

<body class="wrap_muni">
<div id = "gu-list-wrap">
    <table id="gu-list-table" border="0">
        <caption id="gu-truck-info"><img src="css/imgs/foodleee-face.png" class="face"> <span id="gu">성동구</span> 푸드트럭 정보<i class="fas fa-times" style="color: firebrick"></i></caption>
        <thead>
            <tr>
                <th id="th-no">No.</th> <th id="th-img"><img src="css/imgs/truck.png"></th> <th id="th-name">상호</th> <th id="th-menu">대표메뉴</th> <th id="th-loca">위치</th> <th id="th-hour">영업시간</th> <th id="th-like"><i class="fas fa-heart"></i></th>
            </tr>
        </thead>
        <tbody>
        	<%for(int i=1; i<=5; i++){%> 
            <tr>
                <td><%=i%></td> <td><img src="css/imgs/gu-truck-img.jpg"></td> <td><b>포라코</b></td> <td class="tooltip" title="치킨 소 7,000원/대 10,000원&#13;치킨 소 7,000원/대 10,000원&#13;치킨 소 7,000원/대  10,000원&#13;치킨 소 7,000원/대 10,000원&#13;치킨 소 7,000원/대 10,000원&#13;치킨 소 7,000원/대 10,000원">
                <div class="meme">
                    <p class="menu-spec">치킨 소 7,000원/대 10,000원<br>치킨 소 7,000원/대 10,000원<br>치킨 소 7,000원/대 10,000원<br>치킨 소 7,000원/대 10,000원<br>치킨 소 7,000원/대 10,000원<br>치킨 소 7,000원/대 10,000원</p>
                </div></td> <td title="왕십리역 13번출구">왕십리역 13번출구</td> <td>15:00-00:00</td> <td><i class="fas fa-heart"></i> 23</td>
            </tr>
            <%} %>
        </tbody>
    </table>    
    <ul id="page">
        <li><i class="fas fa-angle-left fa-2x"></i></li> 
        <li></li> 
        <li id="selected"><i class="fas fa-circle"></i></li> 
        <li><i class="fas fa-circle"></i></li> 
        <li></li> 
        <li><i class="fas fa-angle-right fa-2x"></i></li>
    </ul>
</div>
</body>
</html>
