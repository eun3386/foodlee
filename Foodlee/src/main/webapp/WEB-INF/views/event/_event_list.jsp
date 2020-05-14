<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html lang="en"> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<!-- <link href="resources/css/reset.css" type="text/css" rel="stylesheet"> -->
<!-- <link href="resources/css/main.css" type="text/css" rel="stylesheet"> -->
<!-- <link href="resources/css/index.css" type="text/css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <script>
      $( function() {
        $( document ).tooltip();
      } );
    $(document).ready(function () {
          $(".fa-times").click(function() {
             window.close(); 
          });
    });
    function addEvent() {
		var url = "${pageContext.request.contextPath}";
		url += "/event_new_form.fdl";
		window.location.href = url;
	}
  </script>
    <style>
        .ui-tooltip {
            white-space: pre-line;
            font-size: smaller;
        }
    </style>   
	<title> 푸들이 - 이벤트 </title>
</head>
<!--http://naver.github.io/smarteditor2/demo/-->
<!--네이버 스마트 에디터-->
<body>
<div id = "event-list-wrap">
    <table id="event-list-table" border="0">
        <caption id="gu-truck-info"><img src="resources/css/imgs/foodlee-face-white.png" class="face-white"> <span id="gu">푸들이</span> EVENT
<%--         	<c:if test="${mbLoginName eq admin}"> --%>
        		<input id="event-add" type="button" value="글쓰기" onclick="addEvent()">
<!--         	</c:if> -->
        </caption>
        
        <thead>
            <tr>
                <th id="th-no">No.</th> <th id="th-ongoing">진행</th> <th id="th-name">제목</th> <th id="th-term">기간</th> <th id="th-cr-date">등록일</th> <th id="th-like"><i class="fas fa-heart"></i></th> <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        <%for(int i=1; i<=10; i++){%> 
            <tr>
                <td><%=i %></td> 
                <td><img class="td-ongoing" src="resources/css/imgs/event-on.jpg"></td> 
                <td><b>밤도깨비 야시장 잠정 중단 안내</b></td> 
                <td class="tooltip" title="">
	                <div class="event-period">
	                    <p>2020-04-03 ~ <br>2020-11-01<br></p>
	                </div>
                </td> 
                <td>2020-05-05</td>
                <td><i class="fas fa-heart"></i> 32</td> 
                <td>101</td>
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
<!-- </html> -->

