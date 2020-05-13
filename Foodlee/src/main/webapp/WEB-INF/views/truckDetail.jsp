<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%
	String CON = application.getContextPath();
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link href="<%=CON%>/resources/css/truckDetail.css" rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1zqc0e9b5c"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var start = 0;
var arr = new Array(start);

var remove_div = function(test, starta) {
	arr.splice(starta, 1);
// 	for (var i = 0; i < starta; i++) {
// 		arr[i + 1] = arr[i];
// 	}
	var priSum = document.getElementById("priceSum");
	var n1 = Number(priSum.innerHTML);
	
	var price = document.getElementById("price"+test.id);
	var n2 = Number(price.innerHTML);
	
	priSum.innerHTML = n1 - n2;
	
	$("#"+test.id).remove();
	--start;
	
	if(start == 0) {
		$("#none").css("display", "block");
		$("#sum").css("display", "none");
		$(".fa-trash").css("display", "none");
		$(".order_div").css("display", "none");
		arr = new Array(start);
	}
}

var plus = function(test, i) {
	var numSpan = document.getElementById("num"+test.id);
	var pprice = Number(document.getElementById("pprice"+i).innerHTML);
	
	var n1 = Number(numSpan.innerHTML);
	if (n1 >= 1) {
		numSpan.innerHTML = n1 + 1;
		
		var price = document.getElementById("price"+test.id);
		var n2 = Number(price.innerHTML);
		price.innerHTML = pprice * (n1 + 1);
		
		var priSum = document.getElementById("priceSum");
		var n3 = Number(priSum.innerHTML);
		priSum.innerHTML = n3 + pprice;
	}
}

var minus = function(test, i) {
	var numSpan = document.getElementById("num"+test.id);
	var pprice = Number(document.getElementById("pprice"+i).innerHTML);
	
	var n1 = Number(numSpan.innerHTML);
	if (n1 > 1) {
		numSpan.innerHTML = n1 - 1;
		
		var price = document.getElementById("price"+test.id);
		var n2 = Number(price.innerHTML);
		price.innerHTML -= pprice;
		
		var priSum = document.getElementById("priceSum");
		var n3 = Number(priSum.innerHTML);
		priSum.innerHTML = n3 - pprice;
	}
}

var cnt = start;
function addToList(i) {
	// add 클릭
	// $(".addasdasdad").click(function() {
	var pname = document.getElementById("pname"+i).innerHTML;
	var pprice = document.getElementById("pprice"+i).innerHTML;
	var test = "t" + i;
	var dup = false;
	var dupNum;
	
	$("#none").css("display", "none");
	$(".order_div").css("display", "block");
	$(".fa-trash").css("display", "inline");
	var html = '<li id="'+test+'" class="inner" style="padding-left: 10px;">' +
	"<div style='height: 50px; margin-bottom: 5px;'>" +
		"<div id='d"+i+"' style='margin-top: 10px; font-size: 18px; margin-bottom: 10px;'>"+pname+"</div>" +
		"<div style='float: left; width: 65%;'>"+
		'<a href="#" class="remove" onclick="remove_div('+test+', '+start+')"><i class="fas fa-times-circle fa-lg remove" style="color: black;"></i></a>'+
			"<span id='price"+test+"'>"+pprice+"</span>원</div>"+
			"<span>" +
			"<i class='fas fa-plus-circle fa-lg' onclick='plus("+test+", "+i+")' style='color: red; cursor: pointer;'></i>"+
			"<span id='num"+test+"'>1</span>"+
			"<i class='fas fa-minus-circle fa-lg' onclick='minus("+test+", "+i+")' style='color: red; cursor: pointer;'></i></span>"+
		"</div>"+
		"</li>";
	
	var dupB = $("#d"+i).attr("id");
	var dupA;
	if (dupB != null) {
		dupA = dupB.substring(1, 2);
	}
	
	for (var j = 0; j < arr.length; j++) {
		if (arr[j] == pname) {
			dup = true;
			dupNum = dupA;
			break;
		}
	}
	
	// 중복체크
	if(dup == false) {
		$("#menu_list").append(html);
		arr[start] = pname;
		++start;
		var priSum = document.getElementById("priceSum");
		var n = Number(priSum.innerHTML);
		priSum.innerHTML = n + Number(pprice);
	} else {
		// alert("중복" + start);
		var tag = "t" + dupNum;
		var numSpan = document.getElementById("num"+tag);
		// var pprice = Number(document.getElementById("pprice"+dupNum).innerHTML);
		var ppriceB = document.getElementById("pprice"+dupNum);
		var pprice = Number(ppriceB.innerHTML);
		// console.log(tag + numSpan + pprice);
		var n1 = Number(numSpan.innerHTML);
		if (n1 >= 1) {
			numSpan.innerHTML = n1 + 1;
			var price = document.getElementById("price"+tag);
			var n2 = Number(price.innerHTML);
			price.innerHTML = pprice * (n1 + 1);
			
			var priSum = document.getElementById("priceSum");
			var n3 = Number(priSum.innerHTML);
			priSum.innerHTML = n3 + pprice;
		}
	}
	
	// cnt++;
	
	if (start >= 1) {
		$("#sum").css("display", "block");
	}
	// });
}

function wrapWindowByMask(){
	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  

    // $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".window").show();

}

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}

$(document).ready(function() {
	$("#sum").css("display", "none");
	$(".order_div").css("display", "none");
	$(".fa-trash").css("display", "none");
	
	$('#writeTextarea').attr('contentEditable', 'true');
	
	$(".fa-trash").click(function() {
// 		if (confirm("모든 주문 메뉴를 삭제하시겠습니까??") == true) {    //확인
// 		    // document.form.submit();
// 			start = 0;
// 			$(".inner").remove();
// 			$("#none").css("display", "block");
// 			$("#sum").css("display", "none");
// 			$(".fa-trash").css("display", "none");
// 			$(".order_div").css("display", "none");
// 			arr = new Array(start);
// 			var priSum = document.getElementById("priceSum");
// 			priSum.innerHTML = 0;
// 		} else{   //취소
// 		    return;
// 		}
		swal({
			  title: "모든 주문 메뉴를 삭제하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  start = 0;
			 	  $(".inner").remove();
			 	  $("#none").css("display", "block");
			 	  $("#sum").css("display", "none");
			 	  $(".fa-trash").css("display", "none");
			 	  $(".order_div").css("display", "none");
			 	  arr = new Array(start);
			 	  var priSum = document.getElementById("priceSum");
			 	  priSum.innerHTML = 0;
			  } else {
			    return;
			  }
		});
	});
	
	$(".order_div").click(function() {
		var priceSum = Number(document.getElementById("priceSum").innerHTML);
		
        var IMP = window.IMP; // 생략가능
        IMP.init('imp64360008'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            // pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '주문 결제',
            amount : priceSum,
            buyer_email : 'test@test.com',
            buyer_name : '홍길동',
            buyer_tel : '010-1234-5678',
            buyer_addr : 'TT',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
<%--                 location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
<%--                 location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                //alert(msg);
            }
        });
	});
	
// 네이버 지도	
// 	var mapOptions = {
// 	    center: new naver.maps.LatLng(37.3595704, 127.105399),
// 	    zoom: 10,
//    	    scaleControl: false,
//    	    logoControl: false,
//    	    mapDataControl: false,
//    	    zoomControl: true
// 	};

// 	var map = new naver.maps.Map('map', mapOptions);
	
	var mapOptions = {
	    scaleControl: false,
	    logoControl: false,
	    mapDataControl: false,
	    zoomControl: false
	};
		
	var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
	    map = new naver.maps.Map('map', {
	        center: cityhall.destinationPoint(0, 500),
	        zoom: 15
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: cityhall
	    });
	
	var contentString = [
        '<div class="iw_inner">',
        '   <h3>푸드트럭 팩토리</h3>',
        '   <p>서울특별시 중구 | 서울특별시 중구 <br />',
        '</div>'
    ].join('');
	
	var infowindow = new naver.maps.InfoWindow({
	    content: contentString
	});
	
	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});
	
    //검은 막 띄우기
    $(".fa-map").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  

    });      
    
	$('.fa-heart').click(function() {
		var td = document.getElementById("test");
		var n = Number(td.innerHTML);
		td.innerHTML = n + 1;
	});

	$(".reply").slice(0, 3).show(); // select the first ten
    $("#read-more-reply").click(function(e) { // click event for load more
        e.preventDefault();
        $(".reply:hidden").slice(0, 3).show(); // select next 10 hidden divs and show them
        if($(".reply:hidden").length == 0){ // check if any hidden divs still exist
            // alert("No more divs"); // alert if there are none left
            $('#read-more-reply').css("display", "none");
        }
    });
	
    $(".qna").slice(0, 3).show(); // select the first ten
    $("#read-more-qna").click(function(e) { // click event for load more
        e.preventDefault();
        $(".qna:hidden").slice(0, 3).show(); // select next 10 hidden divs and show them
        if($(".qna:hidden").length == 0){ // check if any hidden divs still exist
            // alert("No more divs"); // alert if there are none left
            $('#read-more-qna').css("display", "none");
        }
    });
	
 // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#_order").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감 */
		$("#_order").css('top', newPosition);

		$("#_order").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

	
});
// 	$(".remove").click(function() {
// 		console.log("dd")
// 		alert("dd");
// 		// $(this).parent().prop('li').css("display", "none");
// 		$(this).parents('li').remove();
// 	});
    // $(".reply").slice(0, 5).show(); // select the first ten
</script>
<body>
	<div class="main_box">
		<div class="menu common">
			<!-- 		<p class="content">메뉴</p> -->
		</div>
		<div class="logo common">
			<p class="content">푸들이</p>
		</div>
		<div class="login common">
			<p class="content" style="padding-top: 25px;">회원가입 로그인</p>
		</div>
	</div>
	<div id="info">
		<div id="car_detail">
			<img src="<%=CON%>/resources/imgs/truckDetail/car.jpg"
				style="width: 350px; height: 250px; float: left; margin-bottom: 15px;">
			<div id="car_des"
				style="float: left; margin-left: 420px; position: absolute;">
				<h2 style="margin-top: 0; margin-bottom: 15px;">푸드트럭 팩토리</h2>
				<div style="min-height: 110px;">
				소비자 만족도 1위 푸드트럭! BOP푸드트럭 입니다. 저의 시그니쳐 메뉴인 눈꽃목살스테이크는 섭씨 1,300도의 중식화로를
				이용하여 단시간에 육즙가득한 목살스테이크를 구워 드립니다. 많은 문의 부탁 드립니다!
				</div>
				<p />
				<div style="margin-top: 30px;">
					<i class="fas fa-heart fa-lg"></i> <span id="test">0</span>
					<div style="float: left;">
						<i class="fas fa-map fa-lg"
							style="margin-left: 80px; position: absolute;"></i>
					</div>
				</div>
			</div>
		</div>

		<div id="mask"></div>
		<div class="window" style="margin-top: 100px;">
			<div class="close_icon" style="vertical-align: middle; font-size:22px; height:35px; margin-top: 5px;">
				푸드트럭 팩토리 위치
				<a href="#" class="close" style="float: right;">
				<i class="fas fa-times-circle fa-lg" style="color:red; padding-top: 5px;"></i></a>
			</div>
			<div id="map"
				style="width: 1000px; height: 500px; text-align: center; vertical-align: middle;"></div>
		</div>

		<div id="_order"
			style="width: 270px; border: 1px solid gray; margin: -1px; float: left; position: absolute; margin-left: 830px;">
			<div class="subtitle"
				style="width: 270px; height: 60px; background-color: black; display: table-cell; vertical-align: middle; color: white; font-size: 23px;">
				주문표 <i class="fas fa-trash" style="font-size: 17px;"></i>
			</div>
			<div>
				<div id="none">메뉴가 없습니다.</div>
				<ul id="menu_list"
					style="list-style: none; margin: 0; padding: 0; max-height: 360px; overflow-y: auto;">
				</ul>
			</div>
			<div id="sum" style="text-align: right; border-top: 1px solid gray;">
				합계 : <span id="priceSum">0</span>원
			</div>
			<div class="order_div">주문하기</div>
		</div>
	</div>
	<hr style="width: 90%; border: 0; height: 0px; background: orange;">
	<div class="tab">
		<input id="tab1" type="radio" name="tabs" checked>
		<!--디폴트 메뉴-->
		<label for="tab1">리뷰</label> <input id="tab2" type="radio" name="tabs">
		<label for="tab2">메뉴</label> <input id="tab3" type="radio" name="tabs">
		<label for="tab3">정보</label> <input id="tab4" type="radio" name="tabs">
		<label for="tab4">Q&amp;A</label>

		<section id="content1">
			<div id="replies">
				<c:forEach var="rv" items="${review}"
				varStatus="vs">
				<div class="reply"
					style="border: 1px solid #ccc; margin-bottom: -1px; padding-left: 10px;
					<c:if test="${rv.reviewDepth eq 1}">padding-left: 40px;</c:if>
					">
					<ul style="list-style: none; padding: 0;">
						<li>
							<div style="float: left;">
<%-- 								<img align="middle" src="<%=CON%>/img/no-photo.jpg" --%>
<!-- 									style="width: 45px; height: 45px; margin: 0 5px 0 5px;"> -->
							</div>
							<div class="nickname" style="padding-top: 2px;">
							<c:if test="${rv.reviewDepth eq 1}"><i class='fas fa-reply fa-rotate-180 fa-lg'></i></c:if>
							<c:choose>
							<c:when test="${rv.reviewDepth eq 0}">${rv.login}</c:when>
							<c:when test="${rv.reviewDepth eq 1}">사장님</c:when>
							</c:choose>
							</div>
							<div class="date" style="padding-top: 4px; font-size: 12px;">
							<fmt:formatDate value="${rv.reviewCreatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</div>
						</li>
						<li>
							<div style="padding-top: 15px;">
								<c:out value="${rv.reviewContent}"/>
							</div>
						</li>
					</ul>
				</div>
				</c:forEach>
				<div id="read-more-reply" style="text-align: center; font-size: 18px; vertical-align: middle; margin-bottom: 20px;
					background-color: DodgerBlue; opacity: 0.7; height: 30px; color: white;">리뷰 더보기</div>
				<div id="reply-insert">
					<h3 style="padding-top: 10px;">리뷰달기</h3>
					<div name="textArea" id="writeTextarea" style="border: 1px gray solid; min-height: 80px; overflow-x: hidden;
						max-height: 250px; border-radius: 3px 3px 3px 3px; overflow-y: auto;">
					</div>
<!-- 					<textarea onkeydown="resize(this)" onkeyup="resize(this)" -->
<!-- 						style="resize:none; width: 800px; min-height: 80px; max-height: 180px;"></textarea> -->
					<form action="${pageContext.request.contextPath}/new_review.fdl" method="post">
						<input type="file" name="file" id="file_add" style="dispaly: none;">
						<button type="button" class="btn btn-primary" onclick="document.all.file_add.click();" 
						style="width: 100px; height: 30px; float: left; margin-top: 25px; font-size: 14px; font-color: #FF8868; 
	 						margin-left: -3px; background-color: orange; border: 1px solid gray;">이미지 추가</button>
						<button type="submit" style="width: 100px; height: 30px; float: right; margin-top: 25px; margin-bottom: 30px;
	 						margin-left: -3px; background-color: orange; border: 1px solid gray;">리뷰달기</button>
					</form>
				</div>
			</div>
		</section>

		<section id="content2">
			<div class="wrap2"
				style="overflow-x: auto; width: 800px; white-space: nowrap;">
				<%
					for (int i = 0; i < 10; i++) {
				%>
				<div class="add"
					style="border: 1px solid gray; width: 250px; margin-right: 5px; cursor: pointer;"
					onclick="addToList(<%=i%>)">
					<img src="<%=CON%>/resources/imgs/truckDetail/food.jpg"
						style="width: 250px; height: 150px;">
					<h3 id="pname<%=i%>">
						닭꼬치<%=i + 1%></h3>
					<span id="pprice<%=i%>"><%=3000 + (i * 100)%></span>원
				</div>
				<%
					}
				%>
			</div>
			<div>
				<h3>메뉴 목록</h3>
				<ul style="list-style: none; margin: 0; padding: 0;">
					<li>
						<table style="margin-top: 10px;">
						<%
							for (int i = 0; i < 10; i++) {
						%>
							<tr style="cursor: pointer; border: 1px solid gray;" onclick="addToList(<%=i%>)">
								<td>
									<div style="width: 650px;">
										<b>닭꼬치<%=i + 1%></b><br><%=3000 + (i * 100)%>원
									</div>
								</td>
								<td style="border-left: none;"><img
									src="<%=CON%>/resources/imgs/truckDetail/food.jpg"
									style="width: 130px; height: 100px;"></td>
							</tr>
						<% } %>
						</table>
					</li>
				</ul>
			</div>
		</section>

	<section id="content3">
	<div style="margin-left: 15px; padding-bottom: 3px; border-bottom: 1px solid gray;">
		<i class="fas fa-store"></i> 업체정보
		<div style="padding: 5px;"><i style="color: #999; font-style: normal; width: 195px;
         	letter-spacing: -1px;">영업시간</i><span style="margin-left: 70px;">11:00 - 01:00</span></div>
	</div>
	</section>
	<section id="content4">
		<div id="Q&A">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<div class="qna"
				style="border: 1px solid gray; margin-bottom: -1px; padding-left: 10px;
				<%= (i % 2 == 0) ? "" : " padding-left: 40px;" %>">
				<ul style="list-style: none; padding: 0;">
					<li>
						<div style="float: left;">
						<% if (i % 2 == 0) { %> 
<!-- 							<img align='middle' src='img/no-photo.jpg' -->
<!-- 								style='width: 45px; height: 45px; margin: 0 5px 0 5px;'> -->
						<% } %>
						</div>
						<div class="nickname" style="padding-top: 2px;">
						<%= (i % 2 == 0) ? "ABC" : "<i class='fas fa-reply fa-rotate-180 fa-lg'></i>" + 
							"사장님" %></div>
						<div class="date" style="padding-top: 4px; font-size: 12px;">
						2020.01.01
						</div>
					</li>
					<li>
						
						<div style="padding-top: 15px;">
							<%
								if (i % 2 == 0) {
							%>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
							sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
							sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
							<%
								} else {
							%>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
							sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
							Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
							Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
							<%
								}
							%>
						</div>
					</li>
				</ul>
			</div>
			<%
				}
			%>
			<div id="read-more-qna" style="text-align: center; font-size: 18px; vertical-align: middle;
				background-color: DodgerBlue; opacity: 0.7; height: 30px; color: white;">Q&amp;A 더보기</div>
		</div>
	</section>
	
	</div>
		<!-- 		<section id="content3"> -->
		<!-- 			<p>tab menu3의 내용</p> -->
		<!-- 		</section> -->

		<!-- 		<section id="content4"> -->
		<!-- 			<p>tab menu4의 내용</p> -->
		<!-- 		</section> -->
	<div id="footer"></div>
</body>

</html>
