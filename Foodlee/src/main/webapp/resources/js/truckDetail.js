var start = 0;
const mapNames = new Map();

var remove_div = function(tid, starta, nameRe) {
	var priSum = document.getElementById("priceSum");
	var n1 = Number(priSum.innerHTML);
	
	var price = document.getElementById("price"+tid.id);
	var n2 = Number(price.innerHTML);
	
	priSum.innerHTML = n1 - n2;
	mapNames.delete("'"+nameRe+"'");
	// console.log("삭제된 mapNames");
	// console.log(mapNames);
	$("#"+tid.id).remove();
	--start;
	if(start == 0) {
		$("#none").css("display", "block");
		$("#sum").css("display", "none");
		$(".fa-trash").css("display", "none");
		$(".order_div").css("display", "none");
		mapNames.clear();
	}
}

var plus = function(tid, i, st) {
	var numSpan = document.getElementById("num"+tid.id);
	var pprice = Number(document.getElementById("pprice"+i).innerHTML);
	
	var n1 = Number(numSpan.innerHTML);
	if (n1 >= 1) {
		numSpan.innerHTML = n1 + 1;
		
		var price = document.getElementById("price"+tid.id);
		var n2 = Number(price.innerHTML);
		price.innerHTML = pprice * (n1 + 1);
		
		var priSum = document.getElementById("priceSum");
		var n3 = Number(priSum.innerHTML);
		priSum.innerHTML = n3 + pprice;
		
		// arrNum[st] = numSpan.innerHTML;
	}
}

var minus = function(tid, i, st) {
	var numSpan = document.getElementById("num"+tid.id);
	var pprice = Number(document.getElementById("pprice"+i).innerHTML);
	
	var n1 = Number(numSpan.innerHTML);
	if (n1 > 1) {
		numSpan.innerHTML = n1 - 1;
		
		var price = document.getElementById("price"+tid.id);
		var n2 = Number(price.innerHTML);
		price.innerHTML -= pprice;
		
		var priSum = document.getElementById("priceSum");
		var n3 = Number(priSum.innerHTML);
		priSum.innerHTML = n3 - pprice;
		
		// arrNum[st] = numSpan.innerHTML;
	}
}

var cnt = start;
function addToList(i) {
	// add 클릭
	// $(".addasdasdad").click(function() {
	var pname = document.getElementById("pname"+i).innerHTML;
	var pnamePara = "'" + pname + "'";
	var pprice = document.getElementById("pprice"+i).innerHTML;
	var tid = "t" + i;
	var dup = false;
	var dupNum;
	// console.log("i의 값" + i);
	$("#none").css("display", "none");
	$(".order_div").css("display", "block");
	$(".fa-trash").css("display", "inline");
	var html = '<li id="'+tid+'" class="inner" style="padding-left: 10px;">' +
	"<div style='height: 50px; margin-bottom: 5px;'>" +
		"<div class='menu_name' id='d"+i+"' style='margin-top: 10px; font-size: 18px; margin-bottom: 10px;'>"+pname+"</div>" +
		"<div style='float: left; width: 65%;'>"+
		'<a href="#" id=a'+start+' class="remove" data-val='+start+' onclick="remove_div('+tid+', '+start+', '+pnamePara+')"><i class="fas fa-times-circle fa-lg remove" style="color: black;"></i></a>'+
			"<span class='menu_price' id='price"+tid+"'>"+pprice+"</span>원</div>"+
			"<span>" +
			"<i class='fas fa-plus-circle fa-lg' onclick='plus("+tid+", "+i+", "+start+")' style='color: red; cursor: pointer;'></i>"+
			"<span class='menu_number' id='num"+tid+"'>1</span>"+
			"<i class='fas fa-minus-circle fa-lg' onclick='minus("+tid+", "+i+", "+start+")' style='color: red; cursor: pointer;'></i></span>"+
		"</div>"+
		"</li>";
	
	var dupB = $("#d"+i).attr("id");
	var dupA;
	if (dupB != null) {
		dupA = dupB.substring(1, 2);
	}
	
	
	if(mapNames != null) {
		for (let v of mapNames.values()) {
			if (v == pname) {
				dup = true;
				dupNum = dupA;
				break;
			}
		}
	}
	
	
	// 중복체크
	if(dup == false) {
		$("#menu_list").append(html);
		mapNames.set("'"+pname+"'", pname);
		// console.log("추가후");
		// console.log(mapNames);
		
		++start;
		var priSum = document.getElementById("priceSum");
		var n = Number(priSum.innerHTML);
		priSum.innerHTML = n + Number(pprice);
	} else {
		// alert("중복" + start);
		var tag = "t" + dupNum;
		var numSpan = document.getElementById("num"+tag);
		var pprice = Number(document.getElementById("pprice"+dupNum).innerHTML);
		// var ppriceB = document.getElementById("pprice"+dupNum);
		// var pprice = Number(ppriceB.innerHTML);
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

var URLHD = getContextPath() + '/';

/*
function commentList() {
	var URLHD = getContextPath()+'/';
	$.getJSON('new_review.fdl', function(data) {
		$(data).each(function () {
			// console.log(this.review_content);
		})
	});
}
*/

//function fileUploadAction() {
//    console.log("fileUploadAction");
//    $("#file_add").trigger('click');
//}

var sel_files = [];
// 이미지 여러개

function handleImgFileSelect(e) {
	if($("#file_add")[0].files.length > 4) {
		swal("사진 업로드는 4개까지만 가능합니다.");
		$("#file_add").val("");
		$(".imgs_wrap").html("");
		$("#img_pr").css("display", "none");
		return;
	}
    // 이미지 정보들을 초기화
    sel_files = [];
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
        	swal("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            // var html = "CONTENT";
//        	$("#img_pr").css("display", "block");
        	var html = // (index == 0 ? "<div style='margin-bottom: 10px;'><br>이미지 미리보기</div>" : "") + 
        			"<img src=\"" + e.target.result + "\" style='margin-right:3px;'" +
        					"data-file='"+f.name+"' class='selProductFile'>";
        	$(".imgs_wrap").css("display", "block");
            $(".imgs_wrap").append(html);
            index++;
        }
        $("#img_pr").css("display", "block");
        reader.readAsDataURL(f);
    });
}

/* 이미지 삭제
function deleteImageAction(index) {            
    console.log("index : "+index);
    sel_files.splice(index, 1);

    var img_id = "#img_id_"+index;
    $(img_id).remove();

}    
*/

/* 이미지 하나만
var sel_file;

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            swal("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
        $('#img_pr').css("display", "block");
    });
}
*/
var reviewText;

function modify_review(id) {
	// $("#con_"+id).html;
	$("#mod_"+id).css('display', 'none');
	
	reviewText = $("#con_"+id).text().trim();
	$("#con_"+id).html("<textarea onkeydown='resize(this)' onkeyup='resize(this)' style='resize:none; width: 685px; min-height: 80px; max-height: 180px;'>"+reviewText+"</textarea>");
	$("#con_"+id).append("<button onclick='modify_after_review("+id+")' style='margin-top: 3px;'>수정하기</button>" +
			"<button id='cancel_"+id+"' onclick='cancel_modify_review("+id+")' style='margin-top: 3px; margin-left: 2px;'>취소</button>");
	
}

function modify_after_review(id) {
	console.log("modify-ater-review");
	var moText = $("#con_"+id).children("textarea").val();
	$("#con_"+id).html("<div id='con_"+id+"'>"+moText+"</div>");
	$("#mod_"+id).css('display', 'inline');
	
	var d = new Date();
	var dateString = d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + (d.getDate())).slice(-2) + " " +  
	('0' + (d.getHours())).slice(-2) + ":" + ('0' + (d.getMinutes())).slice(-2) + ":" + ('0' + (d.getSeconds())).slice(-2);
	
	$("#fmt_"+id).text(dateString);
	
	$.ajax({
	    type: "post",
	    url: URLHD + 'reivew_update.fdl',
	    data: {"text" : moText,
	    	"id" : id},
	    dataType: "json",
	    success: function(data, textStatus) {
	    	console.log("수정 data => " + data)
	        if (data.redirect) {
	        	console.log("성공");
	        }
	        else {
	        	console.log("실패");
	        }
	    }
	});
}

function reply_add_review(id) {
	var moText = $("#review_reply_"+id).children("textarea").val();
	var login = $("#login").val();
	var sellerId = $("#sellerId").val();
		
	$.ajax({
	    type: "post",
	    url: URLHD + 'review_reply_add.fdl',
	    data: {
	    	"text" : moText,
	    	"login" : login,
	    	"pnum" : id,
	    	"sellerId" : sellerId
	    	},
	    	success: function(data, textStatus) {
	    		location.href = URLHD + "truckDetail.fdl?sellerId="+sellerId;
	    }
	});
	// location.href = URLHD + "truckDetail.fdl?sellerId="+sellerId;
}

function cancel_modify_review(id) {
	$("#con_"+id).html("<div id='con_"+id+"'>"+reviewText+"</div>");
	$("#mod_"+id).css('display', 'inline');
	$("#cancel_"+id).css('display', 'none');
}

function cancel_reply(id) {
	$("#review_reply_"+id).css("display", "none");
	$("#reply_button_"+id).css("display", "inline");
}

function del_review(id, rd) {
	/*
	var chk = confirm("리뷰를 삭제하시겠습니까?");
	if (chk) {
		var URLHD = getContextPath()+'/';
		location.href= URLHD + 'reivew_delete.fdl?id='+id;
	}*/
	var titleText = "";
	
	if (rd == 0) {
		titleText = "리뷰를 삭제하시겠습니까?"
	} else if (rd == 1) {
		titleText = "리뷰 답변을 삭제하시겠습니까?"
	}
	
	var sid = $("#sellerId").val();
	swal({
		  title: titleText,
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href= URLHD + 'reivew_delete.fdl?id='+id+'&depth='+rd+'&sid='+sid;
		  } else {
		    return; 
		  }
	});
}

function reply_review(id) {
	$("#reply_button_"+id).css("display", "none");
	$('#reply_'+id).after("<div id='review_reply_"+id+"' style='border: 1px solid #ccc; padding-left:10px; margin-bottom: -1px;'>" +
			"<div style='margin-top:5px;'><i class='fas fa-reply fa-rotate-180 fa-lg'></i>  답변하기</div>" +
			"<textarea onkeydown='resize(this)' onkeyup='resize(this)' style='resize:none; width: 750px; margin-top: 10px; min-height: 80px; max-height: 180px;'></textarea>" +
			"<div style='margin-bottom:5px;'><button onclick='reply_add_review("+id+")' style='margin-top: 3px;'>답변하기</button>" +
			"<button id='cancel_"+id+"' onclick='cancel_reply("+id+")' style='margin-top: 3px; margin-left: 2px;'>취소</button></div>" +
			"</div>");
}

// qna 시작----------------------------------------------------------------------------------------------------------------------------
var qnaText;
function modify_qna(id) {
	// $("#con_"+id).html;
	$("#mod_qna_"+id).css('display', 'none');
	
	qnaText = $("#con_qna_"+id).text().trim();
	$("#con_qna_"+id).html("<textarea onkeydown='resize(this)' onkeyup='resize(this)' style='resize:none; width: 685px; min-height: 80px; max-height: 180px;'>"+qnaText+"</textarea>");
	$("#con_qna_"+id).append("<button onclick='modify_after_qna("+id+")' style='margin-top: 3px;'>수정하기</button>" +
			"<button id='cancel_"+id+"' onclick='cancel_modify_qna("+id+")' style='margin-top: 3px; margin-left: 2px;'>취소</button>");
	
}

function modify_after_qna(id) {
	var moText = $("#con_qna_"+id).children("textarea").val();
	$("#con_qna_"+id).html("<div id='con_"+id+"'>"+moText+"</div>");
	$("#mod_qna_"+id).css('display', 'inline');
	
	var d = new Date();
	var dateString = d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + (d.getDate())).slice(-2) + " " +  
	('0' + (d.getHours())).slice(-2) + ":" + ('0' + (d.getMinutes())).slice(-2) + ":" + ('0' + (d.getSeconds())).slice(-2);
	
	$("#fmt_qna_"+id).text(dateString);
	
	$.ajax({
	    type: "post",
	    url: URLHD + 'qna_update.fdl',
	    data: {"text" : moText,
	    	"id" : id},
	    dataType: "json",
	    success: function(data, textStatus) {
	        if (data.redirect) {
	        	console.log("성공");
	        }
	        else {
	        }
	    }
	});
}

function reply_add_qna(id) {
	var moText = $("#qna_reply_"+id).children("textarea").val();
	var login = $("#login").val();
	var sellerId = $("#sellerId").val();
	var secret = $("#hdSecret_"+id).val();
	$.ajax({
	    type: "post",
	    url: URLHD + 'qna_reply_add.fdl',
	    data: {
	    	"text" : moText,
	    	"login" : login,
	    	"pnum" : id,
	    	"sellerId" : sellerId,
	    	"secret" : secret
	    	},
	    	success: function(data, textStatus) {
	    		location.href = URLHD + "truckDetail.fdl?sellerId="+sellerId;
	    }
	});
}

function cancel_modify_qna(id) {
	$("#con_qna_"+id).html("<div id='con_"+id+"'>"+qnaText+"</div>");
	$("#mod_qna_"+id).css('display', 'inline');
	$("#cancel_qna_"+id).css('display', 'none');
}

function cancel_reply_qna(id) {
	$("#qna_reply_"+id).css("display", "none");
	$("#reply_button_qna_"+id).css("display", "inline");
}

function del_qna(id, rd) {
	var sid = $("#sellerId").val();
	var titleText = "";
	
	if (rd == 0) {
		titleText = "QnA를 삭제하시겠습니까?"
	} else if (rd == 1) {
		titleText = "QnA를 답변을 삭제하시겠습니까?"
	}
	
	swal({
		  title: titleText,
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href= URLHD + 'qna_delete.fdl?id='+id+'&depth='+rd+'&sid='+sid;
		  } else {
		    return;
		  }
	});
}

function reply_qna(id) {
	$("#reply_button_qna_"+id).css("display", "none");
	$('#qna_id_'+id).after("<div id='qna_reply_"+id+"' style='border: 1px solid #ccc; padding-left:10px; margin-bottom: -1px;'>" +
			"<div style='margin-top:5px;'><i class='fas fa-reply fa-rotate-180 fa-lg'></i>  답변하기</div>" +
			"<textarea onkeydown='resize(this)' onkeyup='resize(this)' style='resize:none; width: 750px; margin-top: 10px; min-height: 80px; max-height: 180px;'></textarea>" +
			"<div style='margin-bottom:5px;'><button onclick='reply_add_qna("+id+")' style='margin-top: 3px;'>답변하기</button>" +
			"<button id='cancel_qna_"+id+"' onclick='cancel_reply_qna("+id+")' style='margin-top: 3px; margin-left: 2px;'>취소</button></div>" +
			"</div>");
}

// qna끝----------------------------------------------------------------------------------------------------------------------------


$(document).ready(function() { // ready 시작
	if($("#login").val() == "") {
		$("#review-insert").css("display", "none");
		$("#qna-insert").css("display", "none");
	}
	
	$("#file_add").on("change", handleImgFileSelect);
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
			 	  mapNames.clear();
			 	  // arrNum = new Array(start);
			 	  var priSum = document.getElementById("priceSum");
			 	  priSum.innerHTML = 0;
			  } else {
			    return;
			  }
		});
	});
	
	// 결제클릭
	$(".order_div").click(function() {
		if($("#login").val() != "") {
			if($("#LoginType").val() == 4) {
				// alert(mapNames);
				// alert(arrNum + "    length=" + arrNum.length);
				var arrSize = $('.menu_name').size();
				
				var sellerId = $("#sellerId").val();
				var login = $("#login").val();
				var arrMenuName = new Array(arrSize);
				var arrMenuPrice = new Array(arrSize);
				var arrMenuNumber = new Array(arrSize);
				var priceSum = Number(document.getElementById("priceSum").innerHTML);
				
				for(var i=0; i<arrSize; i++) {
					arrMenuName[i] = $('.menu_name').eq(i).text();
					arrMenuPrice[i] = $('.menu_price').eq(i).text();
					arrMenuNumber[i] = $('.menu_number').eq(i).text();
				}
				
				var name = $("#name").val();
				var email = $("#email").val();
				var phoneNumber = $("#phoneNumber").val();
				var address = $("#address").val();
				var foodTName = $("#foodTName").val();
				
				/*
				$.ajax({
				    type: "post",
				    url: URLHD + 'menu_order.fdl',
				    data: {
				    	"arrMenuName" : arrMenuName,
				    	"arrMenuPrice" : arrMenuPrice,
				    	"arrMenuNumber" : arrMenuNumber,
				    	"priceSum" : priceSum,
				    	"login" : login,
				    	"sellerId" : sellerId
				    	},
				    	success: function(data, textStatus) {
				    		swal({
				    			  title: "주문 완료",
				    			  text: "주문이 완료 되었습니다.",
				    			  icon: "success",
				    			  button: "확인",
				    		});
				    }
				});
				*/
				
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp64360008'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
		        IMP.request_pay({
		            // pg : 'kakaopay',
		            pg : 'inicis',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : foodTName + ' 결제',
		            amount : 1004,
		            buyer_email : email,
		            buyer_name : name,
		            buyer_tel : phoneNumber,
		            buyer_addr : address,
		            // buyer_postcode : '777-777',
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
		                        // alert(msg);
		                    } else {
		                        //[3] 아직 제대로 결제가 되지 않았습니다.
		                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                    }
		                });
		                //성공시 이동할 페이지
						$.ajax({
						    type: "post",
						    url: URLHD + 'menu_order.fdl',
						    data: {
						    	"arrMenuName" : arrMenuName,
						    	"arrMenuPrice" : arrMenuPrice,
						    	"arrMenuNumber" : arrMenuNumber,
						    	"priceSum" : priceSum,
						    	"login" : login,
						    	"sellerId" : sellerId,
						    	"merchantUid" : rsp.merchant_uid
						    	},
						    	success: function(data, textStatus) {
						    		swal({
						    			  title: "주문 완료",
						    			  text: "주문이 완료 되었습니다.",
						    			  icon: "success",
						    			  button: "확인",
						    		});
						    }
						});
		            } else {
		            	console.log(rsp);
		            	swal({
			    			  title: "결제 실패!",
			    			  text: "에러 원인 : " + rsp.error_msg,
			    			  icon: "success",
			    			  button: "확인",
			    		});
		                //실패시 이동할 페이지
		            }
		        });
			} else {
				swal({
					  text: "주문은 회원만 가능합니다",
					  icon: "warning",
					  button: "확인",
					  dangerMode: true,
					})
			}
	        
		} else {
			swal({
				  title: "로그인 오류",
				  text: "주문을 하시려면 로그인을 해주세요",
				  icon: "warning",
				  button: "확인",
				  dangerMode: true,
				})
		}
	}); // order_div 끝
	
	// 좋아요
	$(document).on("click", "span.mb_follow", function() {
		
		if($("#login").val() != "") {
			if($("#LoginType").val() == 4) {
				$(".follow_msg").css("display", "none");
				var tgSr = $(this).attr("tg_sr");
				var sesMb = $(this).attr("ses_mb");
				$.ajax({
					type: 'get',
					url: URLHD + 'foodTruck_like.fdl',
					data: 'tgSr='+ tgSr + "&sesMb="+ sesMb,
					dataType: 'json',
					success: function(res,status,xhr) {
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
				swal({
				  text: "좋아요는 회원만 가능합니다.",
				  icon: "warning",
				  button: "확인",
				  dangerMode: true,
				});
			}
		} else {
			swal({
			  title: "로그인 오류",
			  text: "좋아요를 하시려면 로그인을 해주세요",
			  icon: "warning",
			  button: "확인",
			  dangerMode: true,
			});
		}
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
	var foodTName = $("#foodTName").val();
	var foodTMuni = $("#foodTMuni").val();
	var foodTLocation = $("#foodTLocation").val();
	var contentString = [
        '<div class="iw_inner">',
        '   <h3>'+foodTName+'</h3>',
        '   <p>서울특별시 '+foodTMuni+' | '+foodTLocation+' <br />',
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
    
    /*
	$('.fa-heart').click(function() {
		var td = document.getElementById("tid");
		var n = Number(td.innerHTML);
		td.innerHTML = n + 1;
	});
	*/
    
    // 

    if ($(".reply").size() <= 3) {
    	$('#read-more-review').css("display", "none");
    }
    
	$(".reply").slice(0, 3).show(); // select the first ten
    $("#read-more-review").click(function(e) { // click event for load more
        e.preventDefault();
        $(".reply:hidden").slice(0, 3).show(); // select next 10 hidden divs and show them
        // 더보기 스크롤 자동이동
        // var position = $("#reviews_window").offset();
        // $('#reviews_window').animate({scrollTop : position.top}, 2000);
        // $('#reviews_window').scrollTop($('#reviews_window').prop('scrollHeight'));
        if($(".reply:hidden").length == 0){ // check if any hidden divs still exist
            // alert("No more divs"); // alert if there are none left
            $('#read-more-review').css("display", "none");
        }
        // $('#reviews_window').scrollTop($('#reviews_window').height());
    });
	
    if ($(".qna_items").size() <= 3) {
    	$('#read-more-qna').css("display", "none");
    }
    
    $(".qna_items").slice(0, 3).show(); // select the first ten
    $("#read-more-qna").click(function(e) { // click event for load more
        e.preventDefault();
        $(".qna_items:hidden").slice(0, 3).show(); // select next 10 hidden divs and show them
        if($(".qna_items:hidden").length == 0){ // check if any hidden divs still exist
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
