<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P><%request.setCharacterEncoding("utf-8"); 
System.out.println("제목:"+request.getParameter("title")); 
System.out.println("내용:"+request.getParameter("content")); %></P>

</body>
</html>

