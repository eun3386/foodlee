<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>푸들이-푸드트럭나들이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpreset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mpstyle.css">
<!-- <link href='./resources/css/main.css' rel="stylesheet" type="text/css"/> -->

<script src="resources/js/jquery-3.5.0.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 우편주소 api -->

<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script>
 $(document).ready(function() {
  // http://blog.naver.com/PostView.nhn?blogId=93immm&logNo=221348202134&parentCategoryNo=&categoryNo=341&viewDate=&isShowPopularPosts=true&from=search
    $('#orderTable').DataTable( {
        "pagingType": "full_numbers",
        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "전부"]],
        "language": {
        	"search": "검색 _INPUT_ ",
            "lengthMenu": "_MENU_ 개씩 페이지에 표시하기",
            "zeroRecords": "결과가 없습니다",
            "info": " 현재  _PAGE_ 마지막 _PAGES_ 총 개수 : _MAX_",
            "infoEmpty": "값이 없습니다.",
            "infoFiltered": "(_MAX_ 개의 값 중 _TOTAL_ 개 검색됨)",
            "paginate": {
              "first": '처음',
              "last": '끝',
              "previous": "이전",
              "next": "다음"
            }
        }
    });
});
 
 $(document).ready(function() {
	  // http://blog.naver.com/PostView.nhn?blogId=93immm&logNo=221348202134&parentCategoryNo=&categoryNo=341&viewDate=&isShowPopularPosts=true&from=search
	    $('#qnaTable').DataTable( {
	        "pagingType": "full_numbers",
	        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "전부"]],
	        "language": {
	        	"search": "검색 _INPUT_ ",
	            "lengthMenu": "_MENU_ 개씩 페이지에 표시하기",
	            "zeroRecords": "결과가 없습니다",
	            "info": " 현재  _PAGE_ 마지막 _PAGES_ 총 개수 : _MAX_",
	            "infoEmpty": "값이 없습니다.",
	            "infoFiltered": "(_MAX_ 개의 값 중 _TOTAL_ 개 검색됨)",
	            "paginate": {
	              "first": '처음',
	              "last": '끝',
	              "previous": "이전",
	              "next": "다음"
	            }
	        }
	    });
	});
 
 $(document).ready(function() {
	  // http://blog.naver.com/PostView.nhn?blogId=93immm&logNo=221348202134&parentCategoryNo=&categoryNo=341&viewDate=&isShowPopularPosts=true&from=search
	    $('#reviewTable').DataTable( {
	        "pagingType": "full_numbers",
	        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "전부"]],
	        "language": {
	        	"search": "검색 _INPUT_ ",
	            "lengthMenu": "_MENU_ 개씩 페이지에 표시하기",
	            "zeroRecords": "결과가 없습니다",
	            "info": " 현재  _PAGE_ 마지막 _PAGES_ 총 개수 : _MAX_",
	            "infoEmpty": "값이 없습니다.",
	            "infoFiltered": "(_MAX_ 개의 값 중 _TOTAL_ 개 검색됨)",
	            "paginate": {
	              "first": '처음',
	              "last": '끝',
	              "previous": "이전",
	              "next": "다음"
	            }
	        }
	    });
	});
 
  	
  </script>
</head>
<body>
	
		<%@include file="my/mp_header.jsp" %>
	
	<div class="main">
		<div id="main_nav_spacer">
			<div id="main_nav">
				<button data-to="section_menu" class="active" >단골 리스트</button>
				<button data-to="section_orderlist" >주문내역</button>
				<button data-to="section_manage" >댓글/리뷰 관리</button>
				<button data-to="section_edit" >정보수정</button>
			</div>
		</div>

		<%@include file="my/mp_like_list.jsp" %>

		<%@include file="my/mp_order_list.jsp" %>

		<%@include file="my/mp_comment_list.jsp" %>
		
		<%@include file="my/mp_profile.jsp" %>
		
	</div>
	
	<div id='footer'>
		<%@include file="common/_footer.jsp" %>
	</div>
<script>
$(function() {
	  $("#changePasswordButton").on("click", function(e){
		  e.preventDefault();
		  $(".changePassword").show();
	  });

});

//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
  // iframe을 넣은 element를 안보이게 한다.
  element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample2_extraAddress").value = extraAddr;
          
          } else {
              document.getElementById("sample2_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample2_postcode').value = data.zonecode;
          document.getElementById("sample2_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample2_detailAddress").focus();

          // iframe을 넣은 element를 안보이게 한다.
          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
          element_layer.style.display = 'none';
      },
      width : '100%',
      height : '100%',
      maxSuggestItems : 5
  }).embed(element_layer);

  // iframe을 넣은 element를 보이게 한다.
  element_layer.style.display = 'block';

  // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
  initLayerPosition();
}

//브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
//resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
//직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
  var width = 300; //우편번호서비스가 들어갈 element의 width
  var height = 400; //우편번호서비스가 들어갈 element의 height
  var borderWidth = 5; //샘플에서 사용하는 border의 두께

  // 위에서 선언한 값들을 실제 element에 넣는다.
  element_layer.style.width = width + 'px';
  element_layer.style.height = height + 'px';
  element_layer.style.border = borderWidth + 'px solid';
  // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
  element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
  element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

</script>
</body>
</html>