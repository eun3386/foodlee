<%@page import="java.util.ArrayList" %>
<%@page import="Process.Data" %>
<!-- order 페이지 가져오기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% //세션에 있는 Data(하나의 주문)목록을 빼내서 OrderList를 정의한다.
    ArrayList<Data> OrderList = (ArrayList<Data>) session.getAttribute("Order_List");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order data list</title>
</head>
<body>
	<% //orderlist 가 비어있는 경우
		if(OrderList == null || OrderList.size()<=0) {
	%>
	현재 주문 리스트가 비었습니다.
	<%
	} else {%>
	<table boder="2px">
	<tr>
		<th width="200">성</th>
		<th width="300">이름</th>
		<th width="200">상품</th>
		<th width="200">가격</th>
	</tr>
	<%
		for (int i = 0; i< OrderList.size(); i ++) {
			Data Data = OrderList.get(i);
		
	%>
	<tr>
		<td align="center"><%=Data.getLastname()%></td>
		<td align="center"><%=Data.getFirstname()%></td>
		<td align="center"><%=Data.getProduct()%></td>
		<td align="center"><%=Data.getPrice()%></td>
	</tr>
	<%
		}//end for%>
	</table>
	<%
	}//end if
	%>
	<%=session.getId() %><br>
	<%=OrderList.size() %><br>
	<a href="main.jsp"></a> <a href="indes.jsp"></a><br>
</body>
</html>