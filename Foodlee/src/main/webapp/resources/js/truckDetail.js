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

function getContextPath() {
  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

function commentList() {
	var URLHD = getContextPath()+'/';
	$.getJSON(URLHD + 'review_list.fdl', function(data) {
		$(data).each(function () {
			console.log(this.review_content);
		})
	});
}

$(document).ready(function() {
	$("#sum").css("display", "none");
	$(".order_div").css("display", "none");
	$(".fa-trash").css("display", "none");
	
	// $('#writeTextarea').attr('contentEditable', 'true');
	
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
// <%--                 location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
// <%--                 location.href="<%=request.getContextPath()%>/order/payFail"; --%>
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
	
}); // document.ready 끝
// 	$(".remove").click(function() {
// 		console.log("dd")
// 		alert("dd");
// 		// $(this).parent().prop('li').css("display", "none");
// 		$(this).parents('li').remove();
// 	});
    // $(".reply").slice(0, 5).show(); // select the first ten
