<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>	
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>

		<section class="main_section" id="section_manage">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 42 32" enable-background="new 0 0 42 32" xml:space="preserve" data-svg-content="true" fill="rgb(242, 92, 5)"> <g> <path fill="rgb(242, 92, 5)" d="M35.652,14.023c-0.264-0.082-0.544,0.062-0.628,0.325c-0.083,0.263,0.062,0.544,0.325,0.628   C39.257,16.221,41,18.078,41,21c0,2.599-2.371,4.616-3.783,5.588C37.081,26.682,37,26.835,37,27v3.823   c-0.73-0.272-2.003-0.89-3.126-2.155c-0.117-0.131-0.295-0.191-0.468-0.159c-0.285,0.055-0.576,0.133-0.871,0.212   C32.025,28.858,31.499,29,31,29c-2.568,0-4.366-0.552-6.204-1.903c-0.224-0.164-0.535-0.115-0.699,0.107   c-0.164,0.223-0.116,0.535,0.106,0.699C26.23,29.393,28.199,30,31,30c0.631,0,1.223-0.159,1.795-0.313   c0.178-0.049,0.355-0.097,0.53-0.138c1.869,1.974,3.983,2.423,4.075,2.441c0.033,0.007,0.066,0.01,0.1,0.01   c0.114,0,0.227-0.039,0.316-0.113C37.933,31.792,38,31.65,38,31.5v-4.239c2.582-1.841,4-4.057,4-6.261   C42,17.619,39.983,15.402,35.652,14.023z"></path> <path fill="rgb(242, 92, 5)" d="M33,13.5C33,5.804,25.982,0,16.677,0C7.325,0,0,5.931,0,13.502c0,4.539,3.211,7.791,6,9.759v6.636   c0,0.17,0.086,0.327,0.228,0.42c0.083,0.053,0.177,0.08,0.272,0.08c0.069,0,0.139-0.015,0.205-0.044   c0.146-0.065,3.559-1.616,6.479-4.809c1.265,0.235,2.696,0.461,3.994,0.461C26.641,26.005,33,20.979,33,13.5z M17.177,25.005   c-1.31,0-2.799-0.251-4.083-0.496c-0.173-0.031-0.351,0.028-0.468,0.159c-2.05,2.312-4.459,3.781-5.626,4.414V23   c0-0.165-0.081-0.318-0.217-0.412C4.145,20.773,1,17.725,1,13.502C1,6.491,7.886,1,16.677,1C25.413,1,32,6.374,32,13.5   C32,20.382,26.043,25.005,17.177,25.005z"></path> <path fill="rgb(242, 92, 5)" d="M16.5,11.5c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S17.603,11.5,16.5,11.5z M16.5,14.5   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S17.051,14.5,16.5,14.5z"></path> <path fill="rgb(242, 92, 5)" d="M23.5,11.5c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S24.603,11.5,23.5,11.5z M23.5,14.5   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S24.051,14.5,23.5,14.5z"></path> <path fill="rgb(242, 92, 5)" d="M9.5,11.595c-1.103,0-2,0.897-2,2s0.897,2,2,2s2-0.897,2-2S10.603,11.595,9.5,11.595z M9.5,14.595   c-0.551,0-1-0.448-1-1s0.449-1,1-1s1,0.448,1,1S10.051,14.595,9.5,14.595z"></path> </g> </svg>
						<div class="msg">QnA관리</div>
					</div>
				</div>

				<table class="table sm" id="qnaTable">
					<thead>
						<tr>
							<th>푸드트럭</th>
							<th>질문</th>
							<th>질문등록일</th>
						</tr>
					</thead>
					<tbody id = "listQna" class ="ftLink">
			
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


				<div class="title" style="margin-top:80px;">
					<div class="icon">
						<svg width="70" height="70" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve" data-svg-content="true" fill="rgb(242, 92, 5)"> <g> <path fill="rgb(242, 92, 5)" d="M1.5,32h29c0.827,0,1.5-0.673,1.5-1.5v-29C32,0.673,31.327,0,30.5,0h-29C0.673,0,0,0.673,0,1.5v29   C0,31.327,0.673,32,1.5,32z M1,1.5C1,1.224,1.225,1,1.5,1h29C30.775,1,31,1.224,31,1.5v29c0,0.276-0.225,0.5-0.5,0.5h-29   C1.225,31,1,30.776,1,30.5V1.5z"></path> <path fill="rgb(242, 92, 5)" d="M4,28.479c0.048,0,0.096-0.007,0.143-0.021l10-2.979c0.081-0.024,0.154-0.068,0.213-0.127l10.09-10.205   c0.023-0.024,0.035-0.053,0.052-0.08l3.658-3.658c0.607-0.607,0.607-1.595,0-2.203L22.92,3.972c-0.607-0.607-1.595-0.608-2.202,0   l-3.739,3.739c-0.024,0.024-0.036,0.054-0.054,0.081L6.807,17.911c-0.056,0.056-0.098,0.124-0.122,0.199l-3.16,9.715   c-0.058,0.177-0.012,0.371,0.117,0.504C3.737,28.426,3.867,28.479,4,28.479z M17.359,8.771l1.04,1.04l-8.523,8.563l-1.727-0.392   L17.359,8.771z M10.5,19.165l8.607-8.646l2.434,2.434L12.796,21.5H10.5V19.165z M23.385,14.797l-9.246,9.352l-0.576-1.999   l8.684-8.489L23.385,14.797z M7.493,18.859L9.5,19.315V22c0,0.276,0.224,0.5,0.5,0.5h2.624l0.633,2.2l-8.487,2.528L7.493,18.859z    M21.425,4.679c0.218-0.217,0.572-0.216,0.788,0l5.235,5.235c0.218,0.217,0.218,0.571,0,0.789l-3.372,3.372l-6.023-6.023   L21.425,4.679z"></path> </g> </svg>
						<div class="msg">리뷰관리</div>
					</div>
				</div>

				<table class="table sm" id="reviewTable">
					<thead>
						<tr>
							<th>푸드트럭</th>
							<th>리뷰사진</th>
							<th>리뷰내용</th>
							<th>리뷰작성일</th>
						</tr>
					</thead>
					<tbody id = "listRv" class ="ftLink">
						
					</tbody>
				</table>
				
			</div>
		</section>
	

<script>
// $(document).ready(function()) {
// 	$("td#ftLink").click(function(){
// 		location.href = $(this).attr("http://localhost:8082/foodlee/truckDetail.fdl?sellerId=")
// 	})
// }


$(function(){
	$.ajax({
		url : "my_QnA_list.fdl",
		type : "get",
		success : function(data){
			var html = "";
			data.forEach(function(item){
					html += '<tr>';
						html += '<td><a href="http://localhost:8082/foodlee/truckDetail.fdl?sellerId=' + item.sellerId + '">' + item.qnaFoodtruckName + '</a></td>';
						html += '<td>' + item.qnaContent + '</td>';
						html += '<td>' + moment(item.qnaCreatedAt).format('YYYY-MM-DD HH:mm:ss') + '</td>';
				html += '</tr>';
			})
			$("#listQna").empty().append(html);
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


$(function(){
	$.ajax({
		url : "my_review.fdl",
		type : "get",
		success : function(data){
			var html = "";
			data.forEach(function(item){
					html += '<tr>';
						html += '<td><a href="http://localhost:8082/foodlee/truckDetail.fdl?sellerId=' + item.sellerId + '">' + item.reviewFoodtruckName + '</a></td>';
						html += '<td>' + item.reviewPic + '</td>';
						html += '<td>' + item.reviewContent + '</td>';
						html += '<td>' + moment(item.reviewCreatedAt).format('YYYY-MM-DD HH:mm:ss') + '</td>';
				html += '</tr>';
			})
			$("#listRv").empty().append(html);
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
</script>
</body>
</html>