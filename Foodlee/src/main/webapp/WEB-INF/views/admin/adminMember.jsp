<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String CON = application.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Foodlee Admin</title>

  <!-- Custom fonts for this template-->
  <link href="resources/adminTool/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript-->

  <!-- Core plugin JavaScript-->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
  <script src="resources/adminTool/jquery-easing/jquery.easing.min.js"></script>
  <style>
  /*
  #mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
	} 
	.window {
	    display: none;
	    position:absolute;  
	    left:50%;
	    top:15%;
	    margin-left: -500px;
	    width:1000px;
	    height:500px;
	    background-color:#FFF;
	    z-index:10000;   
	}
	#dataTable tr.mbCList:hover {
		background-color: #FFA500;
		color: white;
		cursor: pointer;
	}
	#dataTable td.sorting_1 {
		color: blue;
	}
	*/
  </style>
  <script>
  /*
  function wrapWindowByMask(){
		 
	    //화면의 높이와 너비를 구한다.
	    var maskHeight = $(document).height();  
	    var maskWidth = $(window).width();  

	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	    $("#mask").css({"width":maskWidth,"height":maskHeight});  

	    // $("#mask").fadeIn(0);      
	    $("#mask").fadeTo("slow",0.6);    

	    //윈도우 같은 거 띄운다.
	    $(".window").show();

	}*/
  
	  $(document).ready(function() {
		  // http://blog.naver.com/PostView.nhn?blogId=93immm&logNo=221348202134&parentCategoryNo=&categoryNo=341&viewDate=&isShowPopularPosts=true&from=search
		    $('#dataTable').DataTable( {
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
			
	  		/*
		    //검은 막 띄우기
		    $(".mbCList").click(function(e){
		        e.preventDefault();
		        wrapWindowByMask();
		    });

		    //닫기 버튼을 눌렀을 때
		    $(".window .close").click(function (e) {  
		        //링크 기본동작은 작동하지 않도록 한다.
		        e.preventDefault();  
		        $("#mask, .window").hide();  
		    });       

		    //검은 막을 눌렀을 때
		    $("#mask").click(function () {  
		        $(this).hide();  
		        $(".window").hide();  
		    });
		    */
		});
  	
  </script>
</head>

<body>

  <!-- Page Wrapper -->
  <div id="admin-wrapper">

    <!-- Sidebar -->
    <ul class="admin-navbar bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.fdl">
        <div class="sidebar-brand-text mx-3">FDL Admin</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<%= CON %>/admin.fdl">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Member Management</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Member :</h6>
            <a class="collapse-item" href="<%= CON %>/adminMember.fdl">일반 회원 관리</a>
            <a class="collapse-item" href="<%= CON %>/adminSeller.fdl">판매자 회원 관리</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Statistics Management</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">회원 :</h6>
            <a class="collapse-item" href="<%= CON %>/adminMemberChart.fdl">회원 가입 및 정보 통계</a>
<!--             <h6 class="collapse-header">푸드트럭 :</h6> -->
<%--             <a class="collapse-item" href="<%= CON %>/adminTruckMenuChart.fdl">푸드트럭 및 메뉴 통계</a> --%>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - Tables -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="tables.html"> -->
<!--           <i class="fas fa-fw fa-table"></i> -->
<!--           <span>Tables</span></a> -->
<!--       </li> -->

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>


          <!-- Topbar Navbar -->
          <ul class="admin-navbar ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a id="aId" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='<c:out value="${LoginName}"/> 로그인 중'"
              class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/logout.fdl" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <c:if test="${not empty LoginName}">
                <span class="mr-2 d-none d-lg-inline text-black-1100">
                <c:out value="${LoginName}" default="guest"/> 로그인 중
                </span>
                </c:if>
              </a>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">일반 회원 관리</h1>
          </div>
			
			
			<div id="mask"></div>
	          <div class="window">
	          	<div>test</div>
	          </div>
	          
           <div class="container-fluid">

          <!-- Page Heading -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">일반 회원 테이블</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="display" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>로그인명</th>
                      <th>이름</th>
                      <th>성별</th>
                      <th>나이</th>
                      <th>이메일</th>
                      <th>핸드폰 번호</th>
                      <th>주소</th>
                      <th>가입일</th>
                      <th>마지막 로그인</th>
                    </tr>
                  </thead>
<%--                 <c:forEach var="" items="" vs=""> --%>
                  <tbody>
				  <c:forEach var="mb" items="${mbList}" varStatus="vs">
                    <tr class="mbCList">
                      <td>${mb.login}</td>
                      <td>${mb.name}</td>
                      <td>${mb.gender}</td>
                      <td>${mb.age}</td>
                      <td>${mb.email}</td>
                      <td>${mb.phoneNumber}</td>
                      <td>${mb.address}</td>
                      <td><fmt:formatDate value="${mb.joinedAt}" pattern="yyyy-MM-dd"/></td>
                      <td><fmt:formatDate value="${mb.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
<!--   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--     <div class="modal-dialog" role="document"> -->
<!--       <div class="modal-content"> -->
<!--         <div class="modal-header"> -->
<!--           <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5> -->
<!--           <button class="close" type="button" data-dismiss="modal" aria-label="Close"> -->
<!--             <span aria-hidden="true">×</span> -->
<!--           </button> -->
<!--         </div> -->
<!--         <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div> -->
<!--         <div class="modal-footer"> -->
<!--           <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button> -->
<!--           <a class="btn btn-primary" href="login.html">Logout</a> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->


</body>
</html>