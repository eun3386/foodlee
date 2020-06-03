<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String CON = application.getContextPath();
%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
    <meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> charset랑 같음 이게 버전이 더 낮음 -->
    <!-- Tell the browser to be responsive to screen width -->
    <!-- - width=device-width : 페이지의 너비를 기기의 스크린 너비로 설정합니다. 즉, 렌더링 영역을 기기의 뷰포트의 크기와 같게 만들어 줍니다.
- initial-scale=1.0 : 처음 페이지 로딩시 확대/축소가 되지 않은 원래 크기를 사용하도록 합니다. 0~10 사이의 값을 가집니다.-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
#main-wrapper[data-layout=vertical][data-sidebartype=full] .page-wrapper
	{
	margin-left: 130px !important;
	margin-right: 130px !important ;
}
</style>
	<!-- footer css -->
	<link href="<%=application.getContextPath()%>/resources/css/main.css" type="text/css" rel="stylesheet">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <%-- <link href="<%=application.getContextPath()%>/boss/bossorder/orderlist.fdl" > --%>
    <title>menulist</title>
	
	 <!-- jquery -->
	  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	
    <!-- Custom CSS -->
<!--     <link href="assets/extra-libs/c3/c3.min.css" rel="stylesheet"> -->
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
<![endif]-->
	<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
	<script src="resources/adminTool/jquery-easing/jquery.easing.min.js"></script>

	<script>
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
		});
  	
	  $(document).ready(function() {
			var ROOT_PATH = '<%= application.getContextPath() %>';
			
			$('.login').click(function() {
				var url = ROOT_PATH
					+'/seller/menu_add_form.fdl';
				$("#main").load(url);
			});
			
			$('.sign_up').click(function() {
				var url = ROOT_PATH
					+'///mb_sign_up_choice_form.jsp';
				$("#main").load(url);
			});
			$('.graph').click(function() {
				var url = ROOT_PATH
					+'/views/bossorder/graph.jsp';
				$("#main").load(url);
			});
			$('.orderlist').click(function() {
				var url = ROOT_PATH
					+'/views/bossorder/orderlist.jsp';
				$("#main").load(url);
			});
		}); 
	 
	</script>

</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <!-- Logo icon -->
                        <a href="main.fdl">
                            <b class="logo-icon">
                                <!-- Dark Logo icon -->
                                <img src="resources/imgs/boss/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
<!--                                 <img src="assets/images/logo-icon.png" alt="homepage" class="light-logo" /> -->
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="resources/imgs/boss/Seller5.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
<!--                                 <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" /> -->
                            </span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent"><!-- 헤더부분 -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
					<ul class="nav justify-content-center" >
					  <li class="nav-item">
					    <a class="nav-link active" href="boss.fdl">시작화면</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/menulist.fdl">메뉴추가/수정</a>
					    <!--  style="a {color: #7c8798} a:hover {color: #5f76e8;}"style.min.css 6242 -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/seller/show_form.fdl">정보조회/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/orderlist.fdl" >주문리스트</a>
					  </li>
					</ul>
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right"><!--  오른쪽 부분-->
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item d-none d-md-block">
                            <a class="nav-link" href="javascript:void(0)">
                                    <div class="customize-input"><!-- 검색부분 -->
                                        <input class="form-control custom-shadow custom-radius border-0 bg-white"
                                            type="search" placeholder="Search" aria-label="Search">
                                        <i class="form-control-icon" data-feather="search"></i>
                                    </div>
                            </a>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <img src="assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle"
                                    width="40">
                                <span class="ml-2 d-none d-lg-inline-block"><span>안녕하세요,</span> <span
                                        class="text-dark">${svo.login}님</span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="user"
                                        class="svg-icon mr-2 ml-1"></i>
                                    My Profile</a>
                                <a id="bannerLink" class="dropdown-item" href="${pageContext.request.contextPath}/ad2.fdl"><i data-feather="credit-card"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Banner apply</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Inbox</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="settings"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout.fdl" id="logout">
                                <i data-feather="power" class="svg-icon mr-2 ml-1"></i>  Logout</a>
                                <div class="dropdown-divider"></div>
                                <div class="pl-4 p-3"><a href="javascript:void(0)" class="btn btn-sm btn-info">View
                                        Profile</a></div>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>

        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">List Media</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
			     <li class="breadcrumb-item"><a href="<%=application.getContextPath()%>/menulist.fdl" class="text-muted">메뉴리스트</a></li>
			     <li class="breadcrumb-item"><a href="<%=application.getContextPath()%>/seller/menu_add_form.fdl" class="text-muted">메뉴추가</a></li>
			     <li class="breadcrumb-item"><a href="<%=application.getContextPath()%>/menuadd.fdl" class="text-muted">메뉴수정</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- main -->
	<!-- ============================================================== -->
	    <div class="row">
	        <div class="col-12">
	            <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-warning">메뉴 리스트</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="display" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
<!--                       <th>메뉴사진</th> -->
                      <th>메뉴이름</th>
                      <th>메뉴종류</th>
                      <th>메뉴가격</th>
                      <th>메뉴정보</th>
                      <th>메뉴사진</th>
                    </tr>
                  </thead>
<%--                 <c:forEach var="" items="" vs=""> --%>
                  <tbody>
				  <c:forEach var="mn" items="${menuList}" varStatus="vs">
                    <tr>
<%--                       <td>${mn.menuPic}</td> --%>
                      <td>${mn.menuName}</td>
                      <td>${mn.menuType}</td>
                      <td>${mn.menuPrice}</td>
                      <td>${mn.menuInfor}</td>
                      <td style="border-left: none;"><img
									src="<%=CON%>/resources/imgs/truckDetail/sellerid/${mn.sellerId}/${mn.menuPic}"
									style="width: 130px; height: 100px;"></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
<!-- 	            /.row -->
<!-- 	            <div class="row" id="move2"> -->
<!-- 	                <div class="col-12" > -->
<!-- 	                    <div class="card"> -->
<!-- 	                        <div class="card-body"> -->
<!-- 	                            <h5 class="card-title">리뷰목록</h5> -->
	                            
<!-- 	                            페이지 넘기기 top -->
<!-- 	                             <div class="col-lg-4 mb-4"> -->
<!-- 	                               <nav aria-label="Page navigation example"> -->
<!-- 	                                 <ul class="pagination justify-content-center"> -->
<!-- 	                                     <li class="page-item"> -->
<!-- 	                                         <a class="page-link" href="javascript:void(0)" -->
<!-- 	                                             aria-label="Previous"> -->
<!-- 	                                             <span aria-hidden="true">&laquo;</span> -->
<!-- 	                                             <span class="sr-only">Previous</span> -->
<!-- 	                                         </a> -->
<!-- 	                                     </li> -->
<!-- 	                                     <li class="page-item"><a class="page-link" -->
<!-- 	                                             href="javascript:void(0)">1</a></li> -->
<!-- 	                                     <li class="page-item"><a class="page-link" -->
<!-- 	                                             href="javascript:void(0)">2</a></li> -->
<!-- 	                                     <li class="page-item"><a class="page-link" -->
<!-- 	                                             href="javascript:void(0)">3</a></li> -->
<!-- 	                                     <li class="page-item"> -->
<!-- 	                                         <a class="page-link" href="javascript:void(0)" aria-label="Next"> -->
<!-- 	                                             <span aria-hidden="true">&raquo;</span> -->
<!-- 	                                             <span class="sr-only">Next</span> -->
<!-- 	                                         </a> -->
<!-- 	                                     </li> -->
<!-- 	                                 </ul> -->
<!-- 	                             </nav> -->
<!-- 	                         </div> -->
<!-- 	                            페이지 넘기기 end -->
<!-- 	                        </div> -->
<!-- 	                    </div> -->
<!-- 	                </div> -->
<!-- 	                <div class="col-12" id="move3"> -->
<!-- 	                    <div class="card"> -->
<!-- 	                        <div class="card-body"> -->
<!-- 	                            <h5 class="card-title">문의하기</h5> -->
<!-- 	                        </div> -->
<!-- 	                    </div> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
	        </div>
	    </div>
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                <%@include file="../../common/_footer.jsp" %>
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
<!--     <script src="assets/libs/jquery/dist/jquery.min.js"></script> -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!--     apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
<!--     Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
</body>
</html>