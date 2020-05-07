<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/main.css" type="text/css" rel="stylesheet">
<link href="../../css/reset.css" type="text/css" rel="stylesheet">
<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var ROOT_PATH = '<%= application.getContextPath() %>';
		
		$('.login').click(function() {
			var url = ROOT_PATH
				+'///mb_login_form.jsp';
			$("#main").load(url);
		});
		
		$('.sign_up').click(function() {
			var url = ROOT_PATH
				+'///mb_sign_up_choice_form.jsp';
			$("#main").load(url);
		});
		$('.comment').click(function() {
			var url = ROOT_PATH
				+'/views/bossreview/comment.jsp';
			$("#main").load(url);
		});
		$('.review').click(function() {
			var url = ROOT_PATH
				+'/views/bossreview/review.jsp';
			$("#main").load(url);
		});
	});
</script>
<title>bossinfo</title>
</head>
<body id="wrapper">
<div>
	<header id="_header">
			<%@ include file="../../common/_header.jsp"%>
		</header>
</div>
	<div id="comment-main">
	<nav id="comment_header">
		<a class="review" href="#">리뷰목록</a> 
		<a class="comment" href="#">댓글목록</a> 
	</nav>
		<div>
			<div>
				<table border="1">
					<tr>
						<td>FOODLI22**</td><td>오늘 readonly로하면 될듯</td>
					</tr>
					<tr>
						<td>댓글입니다.</td>
					</tr>
					<tr>
						<td>큐브 스테이크</td><td>하트</td>
					</tr>
					<tr>
						<td>새우 파스타</td><td>하트</td>
					</tr>
				</table>
				<table border="1">
					<tr>
						<td>사장님</td><td>오늘</td><td></td>
					</tr>
					<tr>
						<td colspan="3"><input type="text" size="50" name="comment"/></td>
					</tr>
					
				</table><!-- 댓글1 -->
				<button>취소</button>
					<button>등록</button>
			</div>
		</div>
		<div>
			<div>
				<table border="1">
					<tr>
						<td>FOODLI22**</td><td>오늘</td>
					</tr>
					<tr>
						<td>댓글입니다.</td>
					</tr>
					<tr>
						<td>큐브 스테이크</td><td>하트</td>
					</tr>
					<tr>
						<td>새우 파스타</td><td>하트</td>
					</tr>
				</table>
				<table border="1">
				<!-- 	<tr>
						<td>사장님</td><td>오늘</td><td></td>
					</tr> --><!-- 등록하면 나타나기 -->
					<tr>
						<td colspan="3"><input type="text" size="50" name="comment"/></td>
					</tr>
					
				</table><!-- 댓글2 -->
					<button>취소</button>
					<button>등록</button>
			</div>
		</div>
		<div>
		
		</div>
	</div>
	<div id="footer">
		
	</div>
</body>
</html>