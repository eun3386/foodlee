<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	<%
		String CON = application.getContextPath();
	%>
		<div id="trucklist_all_page">
			<div id="trucklist_page" class="tl_page">	
				<div id="trucklist_nav">
					<div id="ranktrucks" style="display: inline-block">
						<em>Top 10 푸드 트럭 리스트</em>
					</div>
				
					<div id="truck_search" style="display: inline-block">
						<input type="search" name="search" placeholder="검색" id="ft_search">
					</div>
				</div>
				<div id="toplist_content">
					<div id="top_content">
					<table id="top_content_table">
						<tr>
						
							<td>
							<div class="slider_bottom">
								<figure>
									<button type="button">
										<div class="sample1">
											<img src="resources/css/imgs/truckDetail/그랩고.jpg" width="250px"/>
											<p>
												<b>그랩고</b> <br>
												<br>
												장미에이드 - 5,500원
											</p>
										</div>
									</button>
									<figcaption>
	<!-- 								<em>Responsive Site7</em><span>슬라이드 플러그를 사용</span> -->
									</figcaption>
								</figure>
							</div>
							</td>
							
							<td>
							<div class="slider_bottom">
								<figure>
									<button type="button">
									<div class="sample2">
										<img src="resources/css/imgs/truckDetail/쉬림프킹.jpg" width="250px"/>
										<p>
											<b>쉬림프킹</b> <br>
											<br>
											버터새우구이 - 3,000원
										</p>
									</div>
									</button>
									<figcaption>
	<!-- 								<em>Responsive Site7</em><span>슬라이드 플러그를 사용</span> -->
									</figcaption>
								</figure>
							</div>
							</td>
							
							<td>	
							<div class="slider_bottom">
								<figure>
									<button type="button">
									<div class="sample3">
										<img src="resources/css/imgs/truckDetail/우주전복.jpg" width="250px"/>
										<p>
											<b>우주전복</b> <br>
											<br>
											우주전복 - 2,700원
										</p>
									</div>
									</button>
									<figcaption>
	<!-- 								<em>Responsive Site7</em><span>슬라이드 플러그를 사용</span> -->
									</figcaption>
								</figure>
							</div>
							</td>
							
						</tr>
					</table>
					</div>
				</div>
					
					<div id="menu_content">
						<table>
							<tr>
								<td>
									<div class="menu1">
										<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=1");'>간식</button>
									</div>
								</td>
								
								<td>
									<div class="menu2">
										<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=2")'>식사</button>
									</div>
								</td>
								
								<td>
									<div class="menu3">
										<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=3")'>디저트</button>
									</div>
									
								</td>
								
								<td>
									<div class="menu4">
										<button type="button" onclick='$("#truck-list").load("<%=CON%>/truckList.fdl?mc=4")'>밥차</button>
									</div>
								</td>
							</tr>
						</table>	
					</div>
					
					<div id="menu_truck_content">
					${ftListsize}개 카드
						<!-- <table id="menu_content_table">
							<tr> -->
								<c:forEach var="foodtruck" items="${ftList}" varStatus="vs">
									<c:if test="${vs.index % 4 == 0}"><br></c:if>
<!-- 									<td> -->
										<div class="truck_card">
											<img src="<%=CON%>/resources/imgs/foodtruck/${foodtruck.foodtruckImgPath}" width="100px" height="100px"> <br>
											<c:out value="${foodtruck.foodtruckName}" /> <br>
											<c:out value="${foodtruck.foodtruckMainMenu}" /> <br>
											<c:out value="${foodtruck.foodtruckLocation}" /> <br>
											<c:out value="♥${foodtruck.favoriteCount}" /> <br>
										</div>
<!-- 									</td> -->
								</c:forEach>
<!-- 							</tr> -->
<!-- 						</table>	 -->
					</div>
				</div>	
				
			
			
			<div id="foodtruckList_footer">
				<div class="foodtrucklist_pagenation">
					<a href="#">&laquo;</a>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">6</a>
					<a href="#">&raquo;</a>
				</div>
			</div>
		</div>























