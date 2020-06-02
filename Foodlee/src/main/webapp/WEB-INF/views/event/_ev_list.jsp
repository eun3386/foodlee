<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
    
	function selectEvent(evId) {
		window.location.href		
			= '${pageContext.request.contextPath}'
			+ '/event_show.fdl?id='+evId;
	}

  </script>
    <style>
        .ui-tooltip {
            white-space: pre-line;
            font-size: smaller;
        }
    </style>   
	<title> 푸들이 - 이벤트 </title>

<!--http://naver.github.io/smarteditor2/demo/-->
<!--네이버 스마트 에디터-->
<!-- <body> -->
<c:if test="${!empty evSize}">
<div id = "event-list-wrap">
    <table id="event-list-table" border="0">
        <caption id="gu-truck-info"><img src="resources/css/imgs/foodlee-face-white.png" class="face-white"> <span id="gu">푸들이</span> EVENT
        		<c:if test="${LoginName eq 'admin'}">
        		<input id="event-add" type="button" value="글쓰기" onclick="addEvent()">
        		</c:if>
        </caption>
        
        <thead>
            <tr>
                <th id="th-no">No.</th> <th id="th-ongoing">진행</th> <th id="th-name">제목</th> <th id="th-term">기간</th> <th id="th-cr-date">등록일</th> <th id="th-like"><i class="fas fa-heart"></i></th> <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        <%int i=1;%>
        <c:forEach var="ev" items="${events}" varStatus="vs">
            <tr onclick="selectEvent(${ev.eventId})">
                <c:if test="${pn gt 1}"><td>${vs.index+1+(10*(pn-1))}</td></c:if>
                <c:if test="${pn eq 1}"><td>${(vs.index+1)}</td></c:if>
                <c:if test="${ev.eventOngoing eq 1}" >
                <td><img class="td-ongoing" src="<%=request.getContextPath()%>/resources/css/imgs/event-on.jpg"></td>
                </c:if>
                <c:if test="${ev.eventOngoing eq 0}" >
                <td><img class="td-ongoing" src="<%=request.getContextPath()%>/resources/css/imgs/event-off.jpg"></td>
                </c:if>  
                <td><b>${ev.eventTitle }</b></td> 
                <td class="tooltip" title="${ev.eventTitle }">
	                <div class="event-period">
	                    <p>${ev.eventStartDate} ~ <br><c:if test="${ev.eventEndDate eq '1970-01-01'}"></c:if><c:if test="${ev.eventEndDate ne '1970-01-01'}">${ev.eventEndDate}</c:if><br></p>
	                </div>
                </td> 
                <td>${ev.eventCreatedAt}</td>
                <td><i class="fas fa-heart"></i> ${ev.likeCount}</td> 
                <td>${ev.readCount}</td>
            </tr>
			</c:forEach>
        </tbody>
    </table>    
    <ul id="page">
    	
    	<c:if test="${pn>1}">
	        <li><a onclick="loadEvList(${pn-1})"><i class="fas fa-angle-left fa-2x"></i></a></li>
		</c:if>
	        <li></li> 
	    <c:forEach varStatus="vs" begin="1" end="${maxPn}" step="1">
	        <c:if test="${vs.current eq pn }">
	        	<li id="selected"><i class="fas fa-circle"></i></li>
	        </c:if>
	        <c:if test="${vs.current ne pn }">
	        	<li><a onclick="loadEvList(${vs.current})"><i class="fas fa-circle"></i></a></li>
	        </c:if> 
	    </c:forEach>
	        <li></li>
	    <c:if test="${pn < maxPn }"> 
	        <li><a onclick="loadEvList(${pn+1})"><i class="fas fa-angle-right fa-2x"></i></a></li>
	    </c:if>
	    <c:if test="${pn > maxPn }"> 
	        <li><i class="fas fa-angle-right fa-2x"></i></li>
	    </c:if>
       
    </ul>
</div>
</c:if>
<!-- </body> -->
<!-- </html> -->

