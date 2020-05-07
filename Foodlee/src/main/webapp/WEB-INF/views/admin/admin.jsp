<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="<%=application.getContextPath()%>/resources/css/reset.css" type="text/css" rel="stylesheet">
<title>Layout1</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

body {
	background-color: #f3e5f5;
}

#wrap {
	width: 1200px;
	margin: 0 auto;
}

header {
	width: 100%;
	height: 150px;
	background-color: #9575cd;
}

/* aside { */
/* 	float: left; */
/* 	width: 30%; */
/* 	height: 700px; */
/* 	background-color: #7e57c2; */
/* } */
aside {
    position: absolute;
    width: 260px;
    height: 100%;
    top: 0;
    z-index: 10;
    padding-top: 80px;
    background: 0 0;
    box-shadow: 0 3px 9px 0 rgba(169, 184, 200, .15);
    -webkit-box-shadow: 0 3px 9px 0 rgba(169, 184, 200, .15);
    -moz-box-shadow: 0 3px 9px 0 rgba(169, 184, 200, .15);
}
/* section { */
/* 	float: left; */
/* 	width: 70%; */
/* 	height: 700px; */
/* 	background-color: #673ab7; */
/* } */
section {
    background: #f9fbfd;
    position: relative;
    display: none;
    box-shadow: 0 3px 9px 0 rgba(162, 176, 190, .15);
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

/* 푸터 */
footer {clear: both;text-align: center;border-top: 1px solid #dbdbdb;}
.map_footer {text-align: center; padding: 30px 50px; }
.map_footer li {position: relative; display: inline; padding: 0 7px 0 10px; white-space: nowrap;}
.map_footer li:before {content: ''; width: 1px; height: 12px; background-color: rgb(243, 156, 18); position: absolute; left: 0; top: 2px;}
.map_footer li:first-child:before {width: 0;}
.map_footer address {padding-top: 15px;}


/* 화면 너비 0 ~ 1200px */
@media ( max-width : 1220px) {
	#wrap {
		width: 95%;
	}
}
/* 화면 너비 0 ~ 768px */
@media ( max-width : 768px) {
	#wrap {
		width: 100%;
	}
}

/* 화면 너비 0 ~ 480px */
@media ( max-width : 600px) {
	#wrap {
		width: 100%;
	}
	header {
		height: 300px;
	}
	aside {
		float: none;
		width: 100%;
		height: 300px;
	}
	section {
		float: none;
		width: 100%;
		height: 300px;
	}
}
</style>
</head>
<body>
	<div id="wrap">
		<header></header>
		<aside></aside>
		<section></section>
		<footer>
			<jsp:include page="../common/_footer.jsp" />
		</footer>
	</div>
</body>
</html>
