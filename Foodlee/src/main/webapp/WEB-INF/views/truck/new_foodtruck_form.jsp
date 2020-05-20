<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
<link href="<%= application.getContextPath()%>/resources/css/insert-foodtruck.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="wrapper">
	<div id="main-header">
		<div id="menu-list">
            <ul>
                <li><a href="#">위치찾기</a></li>
                <li><a href="#introduce">소개</a></li>
                <li><a href="#truck-list">푸드트럭</a></li>
                <li><a href="#event-list">이벤트</a></li>
            </ul>
        </div>
        <a href="${pageContext.request.contextPath}/main.fdl"><img class="logo" src="resources/css/imgs/logo.png"></a>
    	<hr class="line">
	</div>
    <div id="main-content">	
		<div id="truck_insert_wrap" class="truck_insert_slide">
			<div id="insert_form">
				<form style="padding-left: 14.59px;" action="<%= application.getContextPath() %>/ft_new.fdl" method="post">
					<table border='0'>
						<tr id="ft_insert_title"><th>푸드 트럭 등록</th></tr>
						<tr>
							<td><label for="sel_id">판매자 아이디:</label></td>
						</tr>
						<tr id="seller_id">
							<td>
								<input type="text" name="user"
									id="sel_id" size='20'
									placeholder="판매자 아이디 입력">
							</td>
						</tr>
						<tr>
							<td><label for="ft_name">푸드 트럭 이름:</label></td>
						</tr>
						<tr id="foodtruck_name">
							<td>
								<input type="text" name="name"
									id="ft_name" size="20"
									placeholder="트럭 이름 입력">
							</td>
						</tr>
						<tr>
							<td><label for="ft_menu">대표 메뉴:</label></td>
						</tr>
						<tr id="foodtruck_main_menu">
							<td>
								<input type="text" name="menu"
									id="ft_menu" size="20"
									placeholder="메인 메뉴 입력">
							</td>
						</tr>
						<tr>
							<td><label for="ft_location">푸드 트럭 위치:</label></td>
						</tr>
						<tr>
							<td>
								<select name="location" id="ft_location">
									<option value="강남구">강남구</option>
									<option value="강동구">강동구</option>
									<option value="강북구">강북구</option>
									<option value="강서구">강서구</option>
									<option value="관악구">관악구</option>
									<option value="광진구">광진구</option>
									<option value="구로구">구로구</option>
									<option value="금천구">금천구</option>
									<option value="노원구">노원구</option>
									<option value="도봉구">도봉구</option>
									<option value="동대문구">동대문구</option>
									<option value="동작구">동작구</option>
									<option value="마포구">마포구</option>
									<option value="서대문구">서대문구</option>
									<option value="서초구">서초구</option>
									<option value="성동구">성동구</option>
									<option value="성북구">성북구</option>
									<option value="송파구">송파구</option>
									<option value="양천구">양천구</option>
									<option value="영등포구">영등포구</option>
									<option value="용산구">용산구</option>
									<option value="은평구">은평구</option>
									<option value="종로구">종로구</option>
									<option value="중구">중구</option>
									<option value="중랑구">중랑구</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="open_time">푸드 트럭 영업 시작 시간:</label></td>
						</tr>
						<tr>
							<td>
								<input type="time" id="open_time">
							</td>
						</tr>
						<tr>
							<td><label for="close_time">푸드 트럭 영업 종료 시간:</label></td>
						</tr>
						<tr>
							<td>
								<input type="time" id="close_time">
							</td>
						</tr>
						<tr><td>좋아요:</td> <td>$(foodtruck.favoriteCount)</td></tr>
						<tr><td>푸드 트럭 위치 좌표:(</td> <td>$(foodtruck.sellerFoodtruckCoordinate))</td></tr>
						<tr>
							<td><label for="move_date">위치 이동 날짜:</label></td> 
							<td><input type="date" id="move_date"></td>
						</tr>
						
						<tr>
							<td><input type="reset" value="리셋"></td>
							<td><input type="submit" value="푸드 트럭 등록"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="foot">
	<%@ include file="../common/_footer.jsp" %>
	</div>
</body>
</html>
















