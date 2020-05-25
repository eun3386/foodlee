<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.choice_btn {
		border: none;
		width: 200px;
		height: 200px;
  		line-height: 40px;
  		cursor: default;
		border-radius: 300px;
		background-color: gray;
		color: black;
		font-size: 1.5em;
		margin: 0 auto;
	}
	#btn {
		width: 600px;
		text-align: center;
		height: 300px;
	}
	#choice_table {
		margin: 0 auto;
	}
	*{margin: 0;padding: 0;box-sizing: border-box}
	body{background-color: #f7f7f7;}
	ul>li{list-style: none}
	a{text-decoration: none;}
	.clearfix::after{content: "";display: block;clear: both;}
	#joinForm{width: 80%;margin: 0 auto;}
	ul.join_box{border: 1px solid #ddd;background-color: #fff;}
	.checkBox,.checkBox>ul{position: relative;}
	.checkBox>ul>li{float: left;}
	.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
	.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
	.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none; resize: none;}
	.footBtwrap{margin-top: 15px;}
	.footBtwrap>li{float: left;width: 50%;height: 60px;}
	.fpmgBt1{background-color: #fff;color:#888}
	.fpmgBt2{background-color: lightsalmon;color: #fff}
	.wrap {
		overflow: auto; height: 597px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var ROOT_PATH = '<%= application.getContextPath() %>';
		
		$('#choice_mb').on('click', function() {
			var url = ROOT_PATH
			+'/member/join_form.fdl';
			$(".wrap").load(url);

		});
		
		$('#choice_sel').on('click', function() {
			var url = ROOT_PATH
			+'/seller/join_form.fdl';
			$(".wrap").load(url);

		});
		
		$("#chk").click(function(){
		    var chk = $(this).is(":checked");//.attr('checked');
		    if(chk) {
		    	$(".clearfix input").prop('checked', true);
		    	$('ul.join_box').css('border', '2px solid orange');
		    	$('.choice_btn').css('background-color','orange');
				$('.choice_btn').css('cursor','pointer');
				$('.choice_btn').attr('disabled', false);
				$('.choice_btn').hover(function() {
					$(this).css('color','white');
					$(this).css('background-color','#FF8C00');
				}, function() {
					$(this).css('color','black');
					$(this).css('background-color','orange');
				});
		    }
		    else {
		    	$('ul.join_box').css('border', '1px solid #ddd');
		    	$(".clearfix input").prop('checked', false);
		    	$('.choice_btn').css('background-color','gray');
				$('.choice_btn').css('cursor','default');
				$('.choice_btn').attr('disabled', true);
		    }
		});
		
		$('.checkBtn input').click(function() {
			if($('.check02 input').is(":checked") && 
				$('.check03 input').is(":checked") && 
				$('.check04 input').is(":checked")) {
				$('ul.join_box').css('border', '2px solid orange');
				$('.choice_btn').css('background-color','orange');
				$('.choice_btn').css('cursor','pointer');
				$('.choice_btn').attr('disabled', false);
				$('.choice_btn').hover(function() {
					$(this).css('color','white');
					$(this).css('background-color','#FF8C00');
				}, function() {
					$(this).css('color','black');
					$(this).css('background-color','orange');
				});
			} else {
				$('ul.join_box').css('border', '1px solid #ddd');
				$('.choice_btn').css('background-color','gray');
				$('.choice_btn').css('cursor','default');
				$('.choice_btn').attr('disabled', true);
			}
		});		
// 			if($('.check02 input').is(":checked") == false || 
// 				$('.check03 input').is(":checked") == false || 
// 				$('.check04 input').is(":checked") == false ) {
// 				$('.choice_btn').attr('disabled', false);
// 				$('.choice_btn').css('background-color','gray');
// 			} else if($('.check01 input').is(":checked")) {
// 				$('.choice_btn').attr('disabled', true);
// 				$('.choice_btn').css('background-color','orange');
// 			} else {
// 				$('.choice_btn').attr('disabled', true);
// 				$('.choice_btn').css('background-color','orange');
				
// 			}
	});
</script>
<div class="wrap">
<div>
	<table border="0" id="choice_table">
		<tr>
			<td id="btn">
				<button type="button" id="choice_mb" class="choice_btn" disabled="disabled">일반<br>회원가입</button>
			</td>
			<td id="btn">
				<button type="button" id="choice_sel" class="choice_btn" disabled="disabled">판매자<br>회원가입</button>
			</td>
		</tr>
	</table>
</div>
<div>
	<form action="" id="joinForm">
    	<ul class="join_box">
        	<li class="checkBox check01">
            	<ul class="clearfix">
                	<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관, 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
                    <li class="checkAllBtn">
                    	<input type="checkbox" name="chkAll" id="chk" class="chkAll">
                    </li>
                </ul>
            </li>
            <li class="checkBox check02">
                <ul class="clearfix">
                    <li>이용약관 동의(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk"> 
                    </li>
                </ul>
                <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       			</textarea>
            </li>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk">
                    </li>
                </ul>
				<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       			</textarea>
            </li>
            <li class="checkBox check04">
                <ul class="clearfix">
                    <li>위치정보 이용약관 동의(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk">
                    </li>
                </ul>
 
                <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       			</textarea>
            </li>
            <li class="checkBox check05">
                <ul class="clearfix">
                    <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                    <li class="checkBtn1">
                        <input type="checkbox" name="chk">
                    </li>
                </ul>
            </li>
        </ul>
    </form>
</div>
</div>















