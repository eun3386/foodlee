<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta charset="UTF-8">
<title>이벤트 작성</title>
</head>
<body>
<form id="frm" action="event_update.fdl" method="post" >
	<table width="100%"> 
		<tr> 
			<td colspan="2">제목
			<input type="hidden" name="eventId" value="${event.eventId}"> 
			<input type="text" id="title" name="eventTitle" value="${event.eventTitle}" size="53%"/>
			시작일
			<input type="date" id="std" name="eventStartDate" value="${event.eventStartDate}"/>
			종료일
			<input type="date" id="edd" name="eventEndDate" value="${event.eventEndDate}"/>
			진행중 
			<select name="eventOngoing"> <option value="1">진행</option> <option value="0">종료</option> </select> </td>
		</tr> 
		<tr> <td>내용</td> 
		<td> <textarea rows="10" cols="30" id="ir1" name="eventContent" style="width:766px; height:412px; "></textarea>
		<script type="text/javascript"> 
			var oEditors = []; 
			$(function(){ 
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: oEditors, elPlaceHolder: "ir1", 
					//SmartEditor2Skin.html 파일이 존재하는 경로 
					sSkinURI: "smartEditor/SmartEditor2Skin.html", 
					htParams : { 
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseToolbar : true, 
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseVerticalResizer : true, 
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseModeChanger : true, 
						fOnBeforeUnload : function(){ 
							
						} 
					}, 
					fOnAppLoad : function(){ 
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
						oEditors.getById["ir1"].exec("PASTE_HTML", ['${event.eventContent}']);
						 
					}, 
						fCreator: "createSEditor2" 
				}); 
			}); 
			
			
			</script>
		 </td> </tr> 
		<tr> <td colspan="2"> <input type="button" id="save" value="저장"/> 
		<input type="button" value="취소"/> </td> 
		</tr> 
	</table> 
</form>
<script type="text/javascript">
$("#save").click(function(){ 
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [""]); 
	$("#frm").submit(); 
	});
</script>
</body>
</html>