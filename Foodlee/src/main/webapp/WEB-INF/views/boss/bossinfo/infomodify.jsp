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
		$('.ad').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/ad.jsp';
			$("#main").load(url);
		});
		$('.infomodify').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/infomodify.jsp';
			$("#main").load(url);
		});
		$('.position').click(function() {
			var url = ROOT_PATH
				+'/views/bossinfo/position.jsp';
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
	<div id="infomain">
	<nav id=" in-main-header" class="navbar navbar-light bg-light justify-content-between">
		<form class="form-inline">
			<a class="infomodify" href="#">정보수정</a>
			<a class="ad" href="#">광고노출</a> 
			<a class="position" href="#">위치등록</a>
 		</form>
	</nav>
		<form>
        <table border="0">
        	<tr>
        		<td><img alt="" src="<%= application.getContextPath() %>/imgs/profile_dummy.PNG"> </td>
        	</tr>
            <tr>
                <td id="title">아이디</td>
                <td>
                    <input type="text" name="id" maxlength="20">
                       
                </td>
            </tr>
                    
            <tr>
            <td></td>
                <td id="title">비밀번호</td>
                <td>
                    <input type="password" name="password" size='20' placeholder="암호입력" required>
                </td>
            </tr>
            
            <tr>
                <td id="title">비밀번호 변경</td>
                <td>
                    <input type="password" name="password" size='20' placeholder="암호변경"  >
                </td>
            </tr>
            <tr>
                <td id="title">변경확인</td>
                <td>
                    <input type="password" name="password-modify" size='20' placeholder="암호변경" >
                    <input type="button" value="비밀번호 변경" > 
                </td>
            </tr>
                
            <tr>
                <td id="title">이름</td>
                <td>
                    <input type="text" name="name" maxlength="40">
                </td>
            </tr>
                
            <tr>
                <td id="title">성별</td>
                <td>
                    <input type="radio" name="gender" value="남" checked>남
                    <input type="radio" name="gender" value="여" checked>여
                </td>
            </tr>
                
            <tr>
                <td id="title">생일</td>
                <td>
                    <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                    <select name="birth_mm">
                        <option value="">월</option>
                        <option value="01" >1</option>
                        <option value="02" >2</option>
                        <option value="03" >3</option>
                        <option value="04" >4</option>
                        <option value="05" >5</option>
                        <option value="06" >6</option>
                        <option value="07" >7</option>
                        <option value="08" >8</option>
                        <option value="09" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select>
                    <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
                </td>
            </tr>
            <tr>
                <td id="title">주민번호</td>
                <td>
                    <input type="text" name="social-ID" />
                </td>
            </tr>
            <tr>
                <td id="title">사업자 번호</td>
                <td>
                    <input type="text" name="business-number" />
                </td>
            </tr>    
            <tr>
                <td id="title">연락처</td>
                <td>
                    <input type="text" name="phone" />
                </td>
            </tr>
            <tr>
                <td id="title">우편번호</td>
                <td>
                    <input type="text" size="50" name="address"/>
                    
                </td>
                <td><input type="button" value="우편번호 찾기" > </td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <input type="text" size="50" name="address"/>
                </td>
                
            </tr>
            <tr>
            	<td></td>
            	<td>
                    <input type="text" size="50" name="address"/>
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="수정"/>  <input type="button" value="취소">
    </form>
	</div>
	<div id="footer">
		
	</div>
</body>
</html>