<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section>
	<!--  이미지 슬라이드 top -->
	<div class="map_slider">
		<%@ include file="map_sliderTop.jsp"%>
	</div>
	<!--  //이미지 슬라이드 -->
</section>
<section id="map_content">
	<div class="map_container">
		<h2 class="map_ir_su"></h2>
		<section id="cont_left">
			<h3 class="cl_tit">주변 찾기</h3>
			<p class="cl_dotted"></p>
<!-- 			<div id='map_view'> -->
				<%@ include file="../map/NaverMap.jsp"%>
<!-- 			</div> -->
		</section>
<!-- 		<h2 class="map_ir_su"></h2> -->
<!-- 		<section id="cont_right"> -->
<!-- 			<h3 class="cl_tit">정보</h3> -->
<!-- 			<p class="cl_dotted"></p> -->
<!-- 			<div class="map_sidebar"> -->
<%-- 				<%@ //include file="map_truck_list.jsp"%> --%>
<!-- 			</div> -->
<!-- 		</section> -->
		<section id="cont_truck_view">
			<h3 class="cl_tit">텍스트</h3>
			<p class="cl_dotted"></p>
			<div class="truck_view"></div>
		</section>
		<section id="cont_truck_view">
			<h3 class="cl_tit">텍스트</h3>
			<p class="cl_dotted"></p>
			<div class="truck_view"></div>
			<div></div>
		</section>
	</div>
</section>
<section>
	<!--  이미지 슬라이드 bottom -->
	<div class="map_slider">
		<%@ include file="map_sliderBottom.jsp"%>
	</div>
	<!--  //이미지 슬라이드 -->
</section>
<!-- //contents -->