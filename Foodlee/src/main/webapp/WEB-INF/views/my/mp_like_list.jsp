<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
		<section class="main_section" id="section_menu">
			<div class="wrapper">
				<div class="title">
					<div class="icon">
						<svg width="80" height="80" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(192, 57, 43)" data-svg-content="true"><g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>
						<div class="msg">단골 리스트</div>
					</div>
				</div>

				<div class="cards clearfix" id = "listArea">
					
				</div>
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
$(function(){
	$.ajax({
		url : "my_like_list.fdl",
		type : "get",
		success : function(data){
			var html = "";
			data.forEach(function(item){
				html += '<div class="card_wrap"><div class="card">'; 
					html += '<div class="thumb"> ';
					html += '<a href="http://localhost:8082/foodlee/truckDetail.fdl?sellerId=' + item.sellerId + '">';
						html += '<img src="./resources/imgs/foodtruck2/' + item.foodtruckImgPath + '" width="220px"; height="170px";>';
							html += '</a>';
					html += '</div>'; 
					html += '<div class="content">';
						html += '<div class="foodtruck_name">' + item.foodtruckName + '</div>';
						html += '<div class="description">' + item.foodtruckMainMenu + '</div>';
						html += '<div class="foodtruck_location">' + item.foodtruckLocation + '</div>';
				html += '</div></div></div>';
			})
			$("#listArea").empty().append(html);
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
