<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    
</style>
<div>   
    <form action="${pageContext.request.contextPath}/member/join.fdl" method="post">
    	<div>
        <table border="0">
        	<tr>
        		<td><img alt="사진" src="${pageContext.request.contextPath}/resources/imgs/join/profile_dummy.PNG"> </td>
        		<td colspan="2"><textarea rows="10" cols="60" readonly>일반 회원가입 소개글 더미</textarea></td>
        	</tr>
            <tr>
                <td><label for="id">아이디</label></td>
                <td>
                    <input type="text" id="id" name="id" maxlength="20">
                    <input type="button" value="중복확인" >
                </td>
            </tr>
                    
            <tr>
                <td><label for="password">비밀번호</label></td>
                <td>
                    <input type="password" id="password" name="password" maxlength="15">
                </td>
            </tr>
            
            <tr>
                <td><label for="passwordCheck">비밀번호 확인</label></td>
                <td>
                    <input type="password" id="passwordCheck" name="passwordCheck" maxlength="15">
                </td>
            </tr>
                
            <tr>
                <td><label for="name">이름</label></td>
                <td>
                    <input type="text" id="name" name="name" maxlength="40">
                </td>
            </tr>
                
            <tr>
                <td><label for="man">성별</label></td>
                <td>
                    <input type="radio" id="man" name="gender" value="남" checked><label for="man">남</label>
                    <input type="radio" id="woman" name="gender" value="여"><label for="woman">여</label>
                </td>
            </tr>
                
            <tr>
                <td><label for="age">나이</label></td>
                <td>
                    <input type="number" id="age" name="age" value="20">
                </td>
            </tr>
                
            <tr>
                <td><label for="residentRN1">주민번호</label></td>
                <td>
                    <input type="text" id="residentRN1" name="residentRN1" maxlength="6">&nbsp;-&nbsp;
                    <input type="password" id="residentRN2" name="residentRN2" maxlength="7">
                </td>
            </tr>
                
            <tr>
                <td><label for="email">이메일주소</label></td>
                <td>
                    <input type="email" id="email" name="email" maxlength="30">
                </td>
            </tr>
                
            <tr>
                <td><label for="phoneNumber">휴대전화번호</label></td>
                <td>
                    <input type="text" id="phoneNumber" maxlength="13" placeholder="ex)010-1234-5678" name="phoneNumber">
                </td>
            </tr>
            <tr>
                <td><label for="address">주소(사는곳)</label></td>
                <td>
                    <input type="text" size="50" id="address" name="address"/>
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><input type="submit" value="가입"/> <input type="reset" value="리셋"></td>
            </tr>
        </table>
        </div>
    </form>
</div>



