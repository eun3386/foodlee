<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	* {
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
    textarea {
    	width: 90%;
    	resize: none;
    }
    #join {
    	text-align: center;
    }
    .title {
    	text-align: right;
    }
    .input {
/*     	width: 90%; */
    }
    td {
    	padding-top: 10px;
    	border: none;
    }
    table{
		width: 90%;
		margin: 20px auto;
    }
    img {
     	width: 90%;
    }
    
</style>
<div id="wrap">   
    <form id="join">
    	<div id="table">
        <table border="0">
        	<tr>
        		<td><img alt="" src="<%= application.getContextPath() %>/resources/imgs/profile_dummy.PNG"> </td>
        		<td colspan="2"><textarea rows="10" cols="60" readonly>소개글 더미</textarea></td>
        	</tr>
            <tr>
                <td class="title">아이디</td>
                <td class="input">
                    <input type="text" name="id" maxlength="20">
                    <input type="button" value="중복확인" >    
                </td>
            </tr>
                    
            <tr>
                <td class="title"><span>비밀번호</span></td>
                <td class="input">
                    <input type="password" name="password" maxlength="15">
                </td>
            </tr>
            
            <tr>
                <td class="title"><span>비밀번호 확인</span></td>
                <td class="input">
                    <input type="password" name="password" maxlength="15">
                </td>
            </tr>
                
            <tr>
                <td class="title"><span>이름</span></td>
                <td class="input">
                    <input type="text" name="name" maxlength="40">
                </td>
            </tr>
                
            <tr>
                <td class="title"><span>성별</span></td>
                <td class="input">
                    <input type="radio" name="gender" value="남" checked>남
                    <input type="radio" name="gender" value="여" checked>여
                </td>
            </tr>
                
            <tr>
                <td class="title"><span>생일</span></td>
                <td class="input">
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
                <td class="title"><span>이메일</span></td>
                <td class="input">
                    <input type="text" name="email_1" maxlength="30">@
                    <select name="email_2">
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>                        
                    </select>
                </td>
            </tr>
                
            <tr>
                <td class="title"><span>휴대전화</span></td>
                <td class="input">
                    <input type="text" maxlength="13" name="phone"/>
                </td>
            </tr>
            <tr>
                <td class="title"><span>주소</span></td>
                <td class="input">
                    <input type="text" size="50" name="address"/>
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><input type="submit" value="가입"/>  <input type="button" value="취소"></td>
            </tr>
        </table>
        </div>
    </form>
</div>



