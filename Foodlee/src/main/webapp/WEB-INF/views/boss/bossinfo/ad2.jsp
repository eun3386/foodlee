<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.fdl.foodlee.controller.TruckDetailController" %>	
<link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
<title>ad</title>
 <!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="${pageContext.request.contextPath}/dist/css/style.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 
 <link href="${pageContext.request.contextPath}/resources/css/boss-ad.css" rel="stylesheet">
 <script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.add-row {
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
/*     margin-right: -15px; */
/*     margin-left: -15px; */
}
.close-row {
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
}
.add-row .breadcrumb_tite {
    text-align: center;
    text-transform: uppercase;
    font-family: 'Abel', sans-serif;
}
.breadcrumb_tite h1 {
    font-size: 30px;
    color: #fff;
    background: #ffca28;
/*     display: inline-block; */
    padding: 5px 30px 5px 30px;
    letter-spacing: 2px;
    font-weight: 900;
	line-height: 1.5em;
    word-break: keep-all;
}
.card-title {
	font-size: 20px;
    color: rgb(243, 156, 18);
/*     padding-bottom: 5px; */
	margin-bottom: 0px;
    font-weight: bold;
}
.ad_dotted {
    border-bottom: 1px dashed #dbdbdb;
    padding-bottom: 15px;
    margin-bottom: 15px;
    color: #878787;
    line-height: 18px;
}
.ad-info {
	padding: 0 35px;
	margin-top: 30px;
}
.ad-add {
	padding: 0 35px;
}
.ad-close {
	padding: 0 35px;
}
</style>
<script>

function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var URLHD = getContextPath() + '/';

// function selectButton(a) {
// 	if($('#banner_date'+ a).val() != '') {
// 		var data = new FormData();
// // 		var data = new FormData($('#banner_file'+a));
// //     	jQuery.each(jQuery('#banner_file'+a)[0].files, function(i, file) {
// //     	    data.append('file-'+i, file);
// //     	});
// 		var sel = $('#banner_sellId').val();
//         var price = $('#banner_price'+a).val();
//         var file = data;
//         var ba_date = $('#banner_date'+a).val();
//         console.log('ba_date = ' + ba_date);
// 	 $.ajax({
//         	contentType: false,
//             processData: false,
// 		    type: "post",
// 		    url: URLHD + 'banner_apply.fdl',
// 		    data: {
// 		    	"banner_sellId" : sel,
// 		    	"banner_price" : price,
// 		    	"banner_file" : file,
// 		    	"banner_date" : ba_date,
// 		    	},
// 		    	success: function(data, textStatus) {
// 		    		console.log("요청사항" + orderRequests);
// 		    }
// 		});
	/*var IMP = window.IMP; // 생략가능
	IMP.init('imp78872704'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 1400,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	var data = new FormData();
	    	jQuery.each(jQuery('#banner_file'+a)[0].files, function(i, file) {
	    	    data.append('file-'+i, file);
	    	});
	        var msg = '결제가 완료되었습니다.';
	        var sel = $('#banner_sellId').val();
	        var price = $('#banner_price'+a).val();
	        var file = data;
	        var ba_date = $('#banner_date'+a).val();
	        
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        console.log('price = ' + price);
	        $.ajax({
	        	contentType: false,
	            processData: false,
			    type: "post",
			    url: URLHD + 'banner_apply.fdl',
			    data: {
			    	"banner_sellId" : sel,
			    	"banner_price" : price,
			    	"banner_file" : file,
			    	"banner_date" : ba_date,
			    	},
			    	success: function(data, textStatus) {
			    		console.log("요청사항" + orderRequests);
			    }
			});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});*/
// } else {
// 	alert('등록 실패');
// }
// //	});
// }
// function selectButton(a) {
	function selectButton(a) {
		
	}
	
	window.onload = function() {
		
	    document.getElementById('banner_add1').onclick = function() {
	        document.getElementById('banner_form1').submit();
	        return false;
	    };
	};
// }
$(document).ready(function() {
// 	$('.btn-primary').on('click', function() {
	
		
	
	
// 	$('#b').on('click', function() {
	
});
</script>
<div class="page-wrapper" style="display: block;">
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="add-row">
			<div class="d-flex align-items-center">
				<nav aria-label="breadcrumb">
					<div class="breadcrumb_tite">
						<h1>배너 등록</h1>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->

	<div class="ad-info">
		<!-- *************************************************************** -->
		<h3 class="card-title">등록된 배너</h3>
		<p class="ad_dotted"></p>
		<div class="card-group">
			<div class="card border-right">
				<div class="card-body">
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<div>
							<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">광고 시작 기한</h6>
							<div class="d-inline-flex align-items-center">
								<h2 class="text-dark mb-1 font-weight-medium"><fmt:formatDate value="${baStrTime}" pattern="yyyy-MM-dd"/></h2>
								<span class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">24:00 ~</span><br>
							</div>
							<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">배너 유효기간</h6>
							<span style="color: red; font-size: 10px;">신청 기간으로 부터 그다음달 00시 입니다</span>
						</div>
					</div>
				</div>
			</div>
			<div class="card border-right">
				<div class="card-body">
					<div class="d-flex d-lg-flex d-md-block align-items-center">
						<div>
							<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">배너 타입</h6>
							<div class="d-inline-flex align-items-center">
								<h2 class="text-dark mb-1 font-weight-medium">${baType == 0 ? "" : baType == 1 ? "파워링크" : baType == 3 ? "파워링크" : ""}</h2>
								<span class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">55,000 ￦
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="ad-add">
		<h3 class="card-title">배너 신청 / 해지</h3>
		<p class="ad_dotted"></p>
		<div class="container-fluid">
	                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                   <div class="add-row"><!--옴ㄹ기기 -->
                       <div class="signup-form pl-4 mb-5">
						    <form id="banner_form1" class="mt-4" action="${pageContext.request.contextPath}/banner_apply.fdl" enctype="multipart/form-data" method="post">
<!-- 						    <form class="mt-4" enctype="multipart/form-data" method="post"> -->
								<div class="form-header">
									<input type="hidden" name="bannerType" value="1"><h2>파워링크</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center"><input id="banner_price1" type="hidden" name="adPrice" value="55000">55,000<small><i class="fas fa-won-sign"></i></small></h1>
						        <input id="banner_sellId" type="hidden" name="${id}" value="${id}">
						        </div>
						        <div class="form-group">
									<p>소비자와 가장 가까운 광고!<br>
										높은 전환 효과를 기대할 수 있는
										프리미엄 배너 광고 상품입니다.
										낮은 비용과 높은 타겟팅 정확도를 누리세요!
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input id="banner_date1" type="date" class="form-control" name="adStartDate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
						        <div class="form-group"> 
						        	<label>파워링크 이미지 등록<br><span style="color: red; font-size: 10px;" >(1200 x 110 pixel) 사이즈가 안맞을시 신청취소가 되실수 있습니다</span></label>
						        	<input id="banner_file1" type="file" name="upfiles" placeholder="첨부파일명들" multiple="multiple" size='64'>
						        </div>
								<div class="form-group">
									<button type="button" id="banner_add1" onclick="selectButton(1)" class="btn btn-primary btn-block btn-lg">등록</button>
								</div>	
						    </form>
						    </div>
						    <div class="signup-form pl-4 mb-5">
						    <form id="banner_form2" class="mt-4" action="${pageContext.request.contextPath}/banner_apply.fdl" enctype="multipart/form-data" method="post">
<!-- 						    <form class="mt-4" enctype="multipart/form-data" method="post"> -->
								<div class="form-header">
									<input type="hidden" name="bannerType" value="3"><h2>배너광고</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center"><input id="banner_price2" type="hidden" name="adPrice" value="45000">45,000<small><i class="fas fa-won-sign"></i></small></h1>
						        </div>
						        <div class="form-group">
									<p>광고 노출에 따른 인지도 증가 효과!<br>
										띠배너 형태의 광고로 강력한 타겟팅 기능과
										풍부하고 정확한 데이터를 지원하는 광고상품입니다.
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input id="banner_date2" type="date" class="form-control" name="adStartDate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
						        <div class="form-group"> 
						        	<label>배너 이미지 등록<br><span style="color: red; font-size: 10px;" >(1200 x 110 pixel) 사이즈가 안맞을시 신청취소가 되실수 있습니다</span></label>
						        	<input id="banner_file2" type="file" name="upfiles" placeholder="첨부파일명들" multiple="multiple" size='64'>
						        </div>
								<div class="form-group">
									<button type="button" onclick="selectButton(2)" id="banner_add2" class="btn btn-primary btn-block btn-lg">등록</button>
								</div>	
						    </form>
						    </div>
						</div>
                    </div>
				</div>
</div>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${pageContext.request.contextPath}/dist/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="${pageContext.request.contextPath}/assets/extra-libs/prism/prism.js"></script>