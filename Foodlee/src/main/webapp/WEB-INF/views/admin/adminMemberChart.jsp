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

  <script>
  	var mmale = "${membersGender['남']}";
  	var mfemale = "${membersGender['여']}";
  	
  	var smale = "${sellersGender['남']}";
  	var sfemale = "${sellersGender['여']}";
  	
  	var mMembersJoin = new Array(); 
  	var mSellersJoin = new Array();
  	
  	<c:forEach var="mMember" items="${monthMembers}" varStatus="vs">
  		mMembersJoin.push('<c:out value="${mMember.c}"></c:out>');
	</c:forEach>
	
	<c:forEach var="mSeller" items="${monthSellers}" varStatus="vs">
		mSellersJoin.push('<c:out value="${mSeller.c}"></c:out>');
	</c:forEach>
	
  </script>
</head>

<body>

  <!-- Page Wrapper -->
  <div id="admin-wrapper">

    <!-- Sidebar -->
    <ul class="admin-navbar bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.fdl">
        <div class="sidebar-brand-text mx-3">FDL Admin </div>
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
            <a class="collapse-item" href="<%= CON %>/adminMemberChart.fdl">회원가입 및 정보 통계</a>
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
              <a id="aId" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='<c:out value="${LoginName}" default="guest"/> 로그인 중'"
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
            <h1 class="h3 mb-0 text-gray-800">회원가입 정보 및 통계</h1>
          </div>

          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">현재 회원 명수 </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${memberCount}"/>명</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

			<!-- 
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">회원 평균 주문 건</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${orderCount / memberCount}" pattern=".00"/>건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-bag fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">회원 평균 주문 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${orderPriceSum / memberCount}"/>원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-won-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
             -->


            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">회원 평균 마지막 방문일</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${lastLoginSumMembers / memberCount}" pattern="0.0"/>일</div>
                    </div>
                    <div class="col-auto">
                      <i class="far fa-calendar-check fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
             <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">현재 판매자 명수 </div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${sellerCount}"/>명</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-user-tie fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			
			<!-- 
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">판매자 평균 주문 받는 건</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${orderCount / memberCount}" pattern=".00"/>건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-bag fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">판매자 평균 주문 받는 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${orderPriceSum / memberCount}"/>원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-won-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
             -->


            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">판매자 평균 마지막 방문일</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <fmt:formatNumber value="${lastLoginSumSellers / sellerCount}" pattern="0.0"/>일</div>
                    </div>
                    <div class="col-auto">
                      <i class="far fa-calendar-check fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">2020년 월별 회원가입 현황</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                
                <!-- test -->
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">회원 성별 통계</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 일반 회원 남성
                    </span>
                    <span class="mr-2">
                      <i style="color: red;" class="fas fa-circle"></i> 일반 회원 여성
                    </span>
                    <p/>
                    <span class="mr-2">
                      <i style="color: #00FF00;" class="fas fa-circle"></i> 판매자 회원 남성
                    </span>
                    <span class="mr-2">
                      <i style="color: #F9D71C;" class="fas fa-circle"></i> 판매자 회원 여성
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- Project Card Example -->

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
 <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript-->
  <script src="resources/adminTool/jquery/jquery.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/adminTool/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugins -->
  <script src="resources/adminTool/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="resources/js/admindemo/chart-area-mChart.js"></script>
  <script src="resources/js/admindemo/chart-pie-mPie.js"></script>
</html>