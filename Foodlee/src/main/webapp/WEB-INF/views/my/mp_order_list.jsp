<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>	
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>		
<script>

</script>


		<section class="main_section" id="section_orderlist">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" enable-background="new 0 0 16 16" xml:space="preserve" fill="rgb(36, 133, 77)" data-svg-content="true"> <g><path d="M 26,2l-6,0 c0-1.104-0.896-2-2-2L 14,0 C 12.896,0, 12,0.896, 12,2L 6,2 C 4.896,2, 4,2.896, 4,4l0,26 c0,1.104, 0.896,2, 2,2l 20,0 c 1.104,0, 2-0.896, 2-2L 28,4 C 28,2.896, 27.104,2, 26,2z M 26,28L 6,28 L 6,4 l 4,0 c0,1.104, 0.896,2, 2,2l 2,0 l 4,0 l 2,0 c 1.104,0, 2-0.896, 2-2l 4,0 L 26,28 zM 8,11C 8,11.552, 8.448,12, 9,12l 14,0 C 23.552,12, 24,11.552, 24,11C 24,10.448, 23.552,10, 23,10l-14,0 C 8.448,10, 8,10.448, 8,11zM 23,16l-14,0 C 8.448,16, 8,16.448, 8,17C 8,17.552, 8.448,18, 9,18l 14,0 C 23.552,18, 24,17.552, 24,17 C 24,16.448, 23.552,16, 23,16zM 23,22l-14,0 C 8.448,22, 8,22.448, 8,23C 8,23.552, 8.448,24, 9,24l 14,0 c 0.552,0, 1-0.448, 1-1 C 24,22.448, 23.552,22, 23,22z"></path></g></svg>
						<div class="msg">주문한 내역</div>
					</div>
				</div>

				<table class="table" id="orderTable">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>가게</th>
							<th>메뉴</th>
							<th>결제금액</th>
							<th>주문일시</th>
							<th>주문현황</th>
							<th>주문취소</th>
						</tr>
					</thead>
					<tbody id ="listOrder" class ="ftLink">
		
					</tbody>
				</table>

<!-- 				<div class="pagination"> -->
<!-- 					<a href="#">&lt;</a> -->
<!-- 					<a href="#" class="active">1</a> -->
<!-- 					<a href="#">2</a> -->
<!-- 					<a href="#">3</a> -->
<!-- 					<a href="#">4</a> -->
<!-- 					<a href="#">5</a> -->
<!-- 					<a href="#">&gt;</a> -->
<!-- 				</div> -->
			</div>
		</section>

<script>
$(document).ready(function() {
	  // http://blog.naver.com/PostView.nhn?blogId=93immm&logNo=221348202134&parentCategoryNo=&categoryNo=341&viewDate=&isShowPopularPosts=true&from=search
	    $('#orderTable').DataTable( {
	        "pagingType": "full_numbers",
	        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "전부"]],
	        "language": {
	        	"search": "검색 _INPUT_ ",
	            "lengthMenu": "_MENU_ 개씩 페이지에 표시하기",
	            "zeroRecords": "결과가 없습니다",
	            "info": " 현재  _PAGE_ 마지막 _PAGES_ 총 개수 : _MAX_",
	            "infoEmpty": "값이 없습니다.",
	            "infoFiltered": "(_MAX_ 개의 값 중 _TOTAL_ 개 검색됨)",
	            "paginate": {
	              "first": '처음',
	              "last": '끝',
	              "previous": "이전",
	              "next": "다음"
	            }
	        }
	    });
	});



$(function(){
	$.ajax({
		url : "my_order_list.fdl",
		type : "get",
		success : function(data){
			var html = "";
			data.forEach(function(item){
				html += '<tr>';
					html += '<td>' + item.orderId + '</td>';
					html += '<td><a href="${pageContext.request.contextPath}truckDetail.fdl?sellerId=' + item.sellerId + '">' + item.orderFoodtruckName + '</a></td>';
					html += '<td>' + item.orderName + '</td>';
					html += '<td>' + item.orderPriceSum + '원</td>';
					html += '<td>' + moment(item.orderDate).format('YYYY-MM-DD HH:mm:ss') + '</td>';
					html += '<td>';
				
					//if( item.orderState == undefined || item.orderState == null ) item.orderState = 0;
					
 					var orVals = ['Error! 관리자에게 문의해주세요', '주문완료', '주문취소', '조리중', '판매자 주문거절', '판매자 주문취소'];

 					html += orVals[item.orderState];
					
					// 					switch(item.orderState) {
// 						case 1: html += '주문완료'; break;
// 					}
					html += '</td>';
					
					html += '<td>';
					
					var btndis = item.orderState == 1 ? '': 'disabled'; 
					//var loginId = item.login;
					var loginId = "test1234";
					html += '<input type="button" id="cancelBt_'+item.orderId+'" onclick="cancelOrder('+item.orderId+' , ' +'\'' + loginId +'\'' +')" value="취소하기" '+
						btndis
						+'>';
								
					html += '</td>';
				
				html += '</tr>';
				
			})
			$("#listOrder").empty().append(html);
			
// 			if( item.orderState > 2)
// 				$("#cancelBt").attr("disabled", true);
// 			else
// 				$("#cancelBt").attr("disabled", false);

		},
		error : function(err1,err2,err3){
			console.log(err1)
			console.log(err2)
			console.log(err3)
			
		},
		complete : function(){
			console.log("complete");			
		}
	})
});

function cancelOrder(id, login) {
	alert("정말 취소하시겠습니까?");
	location.href = "${pageContext.request.contextPath}/my_order_cancel.fdl?oid="+id +"&login=" +login;
}

</script>
