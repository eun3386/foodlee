<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가 
<%request.setCharacterEncoding("utf-8"); 
out.println("제목:"+request.getParameter("title"));
out.println("내용:"+request.getParameter("content"));%>
</body>
</html>