<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/_common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸들이 - 이벤트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">

<style type="text/css">
#container{
	width:1900px;
	
}


.follow_red {
	color: red;
}

.follow_orange {
	color: orange;
}

table{
	border-bottom: 1px;
}
</style>
	<script type="text/javascript">
	// 좋아요
	$(document).ready(function() {
		function getContextPath() {
		  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		};

		var URLHD = getContextPath() + '/';
		
		$(document).on("click", "span.mb_follow", function() {
			if($("#login").val() != "") {
				if($("#LoginType").val() == 4) {
					$(".follow_msg").css("display", "none");
					var tgSr = $(this).attr("tg_sr");
					var sesMb = $(this).attr("ses_mb");
					$.ajax({
						type: 'get',
						url: URLHD + 'event_like.fdl',
						data: 'tgSr='+ tgSr + "&sesMb="+ sesMb,
						dataType: 'json',
						success: function(res,status,xhr, data) {
							console.log(data);
						console.log(res);
						console.log("코드: "+ res.code
							+ ", 메세지: " + res.msg	);
						var likeCode = res.code;
						switch( likeCode ) {
							case 1:
								$('#follow_cnt').text(res.cntLikes);
								$('#follow_msg').css('display', 'inline');
								$('#follow_msg').text("좋아요 하였습니다.");
								$('#follow_msg').fadeOut(2000);
								// $('.follow_msg').css('display', 'inline');
								// $('.follow_msg').html(res.msg);							
								// $('.follow_msg').css('color', 'blue');
								if( res.type == 'add' )
									$('.fa-heart').css('color', 'red');
								else { // 'cancel'
									$('#follow_msg').text("좋아요를 취소 하였습니다.");
									$('#follow_msg').fadeOut(2000);
									$('.fa-heart').css('color', 'gray');
								}
								break;
							case 2:
								// $('.follow_msg').css('display', 'inline');
								// $('.follow_msg').html(res.msg);
								// $('.follow_msg').css('color', 'red');
								break;
							default:
								
						}
					},
					error: function(xhr,status) {
						console.log("에러");
						console.log(xhr);
						console.log(xhr.status);
						console.log(status);
					}
					});
				} else {
					alert('회원이 아닙니다. 좋아요는 회원만 가능합니다.');	
				}
			} else {
				alert('ee');
			}
		});
	});
	</script>
</head>
<body>

<!-- <div class="container"> -->
<!-- <div class="form-group"> -->
<!--     <label for="title" class="col-sm-1 control-label">제목</label> -->
<%--     <div class="col-sm-4"><input type="text" id="title" name="title" class="form-control" value="${event.eventTitle}" readonly/></div> --%>
<%--     <div class="col-sm-3"><input type="text" id="createdAt" name="createdAt" class="form-control" value="등록일: ${event.eventCreatedAt}" readonly/></div> --%>
<%--     <div class="col-sm-2"><input type="text" id="startDate" name="startDate" class="form-control" value="시작일: ${event.eventStartDate}" readonly/></div> --%>
<%--     <div class="col-sm-2"><input type="text" id="startDate" name="startDate" class="form-control" value="종료일: <c:if test="${event.eventEndDate eq '1970-01-01'}"></c:if><c:if test="${event.eventEndDate ne '1970-01-01'}">${ev.eventEndDate}</c:if>" readonly/></div> --%>
    
<!-- </div> -->
<!-- <div class="form-group"> -->
<!--     <label for="content" class="col-sm-2 control-label">내용</label> -->
<%--     <div class="col-sm-10">${event.eventContent}</div> --%>
<!--     </div> -->
<!-- </div> -->

<!-- <div style="text-align:center;"> -->
<!-- 	<button type="button" id="like_btn" name="" class="btn btn-default">좋아요 -->
<!--     </button> -->
<!-- </div> -->
<!-- <div class="form-group" style="float:right;"> -->
<!--     <button type="button" id="list_btn" class="btn btn-primary">목록 -->
<!--     </button> -->
<!--     <button type="button" id="modify_btn" class="btn btn-warning">수정 -->
<!--     </button> -->
<!--     <button type="button" id="delete_btn" class="btn btn-danger">삭제 -->
<!--     </button> -->
<!-- </div> -->

<!-- <div id="reply"> -->
<!--     <ol class="replyList"> -->
<%--     <c:forEach items="${repList}" var="repList"> --%>
<%--     <c:forEach items="" var="repList"> --%>
<!--         <li> -->
<!--             <p> -->
<!--             <span class="glyphicon glyphicon-user"></span> -->
<%--                 ${repList.writer} --%>
<%--                 (<fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />) --%>
<%-- 				(<fmt:formatDate value="" pattern="yyyy-MM-dd" />) --%>
<!--             </p> -->
            
<%--             <p class="bg-info">${repList.content}</p> --%>
<!-- 			<p class="bg-info"></p> -->
            
<!--             <div class="form-group"> -->
<!--                 <button type="button" class="replyUpdate btn btn-warning btn-xs" data-rno="">수정</button> -->
<!--                 <button type="button" class="replyUpdate btn btn-danger btn-xs" data-rno="">삭제</button> -->
<!--             </div> -->
<!--         </li> -->
<%--     </c:forEach> --%>
<!--     </ol> -->
<!-- </div> -->
<!-- <section class="replyForm"> -->
<!-- <form role="form" method="post" autocomplete="off" class="form-horizontal"> -->
<!-- <div class="form-group"> -->
<!--     <label for="writer" class="col-sm-2 control-label">작성자</label> -->
<!--     <div class="col-sm-10"> -->
<!--         <input type="text" id="writer" name="writer" class="form-control"/> -->
<!--     </div> -->
<!-- </div> -->
<!-- <div class="form-group"> -->
<!--     <label for="content" class="col-sm-2 control-label">댓글 내용</label> -->
<!--     <div class="col-sm-10"> -->
<!--         <input type="text" id="content" name="content" class="form-control"/> -->
<!--     </div> -->
<!-- </div> -->
<!-- <div class="form-group"> -->
<!--     <div class="col-sm-offset-2 col-sm-10"> -->
<!--         <button type="button" class="repSubmit btn btn-success">작성</button> -->
<!--     </div> -->
<!--     <script> -->
<!-- //     var formObj = $(".replyForm form[role='form']"); -->
        
<!-- //     $(".repSubmit").click(function(){ -->
<!-- //         formObj.attr("action", "replyWrite"); -->
<!-- //         formObj.submit(); -->
<!-- //     }); -->
<!--     </script> -->
<!-- </div> -->

<!-- </form> -->
<!-- </section> -->
    
    
    
<div id="container">
		<table style="border:1">
			<tr> 
<%-- 			<td>번호: ${event.eventId}</td>  --%>
			<td>제목:</td> <td>${event.eventTitle}</td><td>시작일: ${event.eventStartDate} 
			종료일: <c:if test="${event.eventEndDate eq '1970-01-01'}"></c:if>
			<c:if test="${event.eventEndDate ne '1970-01-01'}">${event.eventEndDate}</c:if>
			<c:if test="${event.eventOngoing eq 1}"><img src="<%=request.getContextPath()%>/resources/css/imgs/event-on.jpg"></c:if>
			<c:if test="${event.eventOngoing eq 0}"><img src="<%=request.getContextPath()%>/resources/css/imgs/event-off.jpg"></c:if></td></tr>
<%-- 			<tr> <td>제목:</td> <td>${event.eventTitle}</td>  </tr> --%>
			<tr> <td>내용:</td> 
				<td style="overflow: hidden;"> <div>${event.eventContent} </div></td>  </tr>
			<tr> <td>조회수:</td> <td>${event.readCount}번</td>  </tr>
			<tr> <td>좋아요수:</td> <td>${event.likeCount}번</td>  </tr>
			
			<tr> <td>좋아요회원들:</td> <td><span id='likeMembers'>${event.likeMembers}</span></td>  </tr>
			<tr> <td>태그들:</td> <td>${event.tags}</td>  </tr>
<!-- 			<tr> <td>첨부파일:</td>  -->
<!-- 			<td> -->
<%-- 				<c:if test="${fpsCount gt 0}"> --%>
<%-- 					<c:forEach var="fp" items="${fps}" varStatus="vs"> --%>
<%-- 						<%@ include file="_file.jsp" %>						 --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<!-- 			</td>  </tr> -->
<%-- 			<tr> <td>작성자ID:</td> <td>${article.memberId}</td>  </tr> --%>
			
			<tr> <td>생성일:</td> <td>
				<fmt:formatDate value="${event.eventCreatedAt}" 
				    pattern="yyyy년 MM월 dd일 - HH시 mm분 ss초" /></td>  </tr> 
			<tr> <td>수정일:</td> <td>
 				<fmt:formatDate value="${event.eventUpdatedAt}"  
				    pattern="yyyy년 MM월 dd일 - HH시 mm분 ss초" /></td>  </tr> 
	</table>
		<div id="member_like" style="margin-top: 30px;">
			<input id="LoginType" type="hidden" value="${LoginType}">
			<span id="follow" tg_sr='${event.eventId}' ses_mb='${id}' class="mb_follow">
				<i class="fas fa-heart fa-lg follow_${isAlreadyLiked ? 'red': 'orange'}"></i>
			</span>
			<span id="follow_cnt"><c:out value="${event.likeCount}" default="0" /></span>
<!-- 				<div style="float: left;"> -->
<!-- 					<i class="fas fa-map fa-lg" -->
<!-- 						style="margin-left: 80px; position: absolute;"></i> -->
<!-- 				</div> -->
		</div>
			<div id="follow_msg" style="margin-top: 5px; font-size: 11px; display:none; font-color: red;"></div>
			<c:if test="${isAlreadyLiked eq true}">
				<div class="follow_msg already" style="margin-top: 5px; font-size: 11px; font-color: red;">해당 이벤트를 좋아요 하고 있습니다.</div>
			</c:if>
		<div id="ev_menu"> 
		<button type="button" class="btn btn-success btn-xs" onclick="backToTheList()">목록</button>
<%-- 		<a href="${pageContext.request.contextPath}/#event-list">목록</a>  --%>
		<c:if test="${not empty LoginName}"> 
		<c:if test="${LoginName eq 'admin'}"> 
				 | <button type="button" class="btn btn-xs btn-warning" onclick="modify()">편집</button>
<%-- 				 <a href="${pageContext.request.contextPath}/event_edit_form.fdl?evId=${event.eventId}" class="btn-xs">편집</a> |   --%>
<!--  				<a href="#">삭제</a> |  -->
		</c:if> 
<!-- 			<a href="#">좋아요</a> |  <br> -->
			<div><input type="text" name="reply" placeholder="댓글 추가 입력">
			<a onclick="addAnswer(${id},${event.eventId})">댓글추가</a></div>
	<script type="text/javascript">
		function addAnswer(mbId,eventId) {
			var url = '${pageContext.request.contextPath}/answer/add.fdl';
			var answer = $('input[name=reply]').val();
			var params = "memberId="+mbId+"&eventId="+eventId
				+"&evAsReply="+encodeURIComponent(answer);
			$.ajax({
				type: 'post',
				url: url,
				data: params,
				success: function(res, status, xhr) {
					console.log(res);
					$('#answer_list ul').prepend(res);
				},
				fail: function(xhr, status) {
					alert("error: " + status);
				}
			});
		}
	</script> 			 
 			 
 		</c:if>		 
 		</div>
 		
	<div id="answer_list">	
	</div> 
	<script type="text/javascript">
		$("#answer_list").load('${pageContext.request.contextPath}/answer/list.fdl?evId=${event.eventId}');
	</script>
	
	</div>
	<script type="text/javascript">
	function backToTheList() {
  		window.open(window.location.href		
  				= '${pageContext.request.contextPath}/#event-list');
	}
	function modify() {
  		window.open(window.location.href		
  				= "${pageContext.request.contextPath}/event_edit_form.fdl?evId=${event.eventId}");
	}
	
	</script>
</body>

</html>