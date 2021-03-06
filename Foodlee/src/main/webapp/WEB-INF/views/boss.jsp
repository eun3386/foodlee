<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <%-- <link href="<%=application.getContextPath()%>/boss/bossorder/orderlist.fdl" > --%>
    <title>seller</title>
	
	 <!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	    var data = google.visualization.arrayToDataTable([
                ['주문금액', '주문횟수'],
                ['만원미만', ${cntOPS[0]}],
                ['3만원미만', ${cntOPS[1]}],
                ['5만원미만',    ${cntOPS[2]}],
                ['5만원이상',    ${cntOPS[3]}]

              ]);

          var options1 = {
           /*  title: '주문금액', */
            pieHole: 0.4,
            legend:{position: 'none'},
  /*           legend: { position: 'bottom', maxLines: 4 }, */
            colors: ['#5f76e8','#ff4f70','#01caf1','#fdc16a']
            
            /* colors: ['#a561bd','#c784de'] */
  /*           0: { color: '#a561bd' },
            1: { color: '#c784de' } */
          };

          var chart1 = new google.visualization.PieChart(document.getElementById('donutchart'));
          chart1.draw(data, options1);
        }

    </script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() { 
//     	var week =['일','월','화','수','목','금','토'];
//     	var today = new Date(); // 오늘
//     	var yday1 = new Date(today.valueOf()-(24*60*60*1000)); //어제
//     	var yday2 = new Date(today.valueOf()-(2*24*60*60*1000)); //이틀전
//     	var yday3 = new Date(today.valueOf()-(3*24*60*60*1000)); //3일전
//     	var yday4 = new Date(today.valueOf()-(4*24*60*60*1000)); //4일전
//     	var yday5 = new Date(today.valueOf()-(5*24*60*60*1000)); //5일전
//     	var yday6 = new Date(today.valueOf()-(6*24*60*60*1000)); //6일전
//     	var day = week[today.getDay()];var day1 = week[yday1.getDay()];var day2 = week[yday2.getDay()];var day3 = week[yday3.getDay()];
//     	var day4 = week[yday4.getDay()];var day5 = week[yday5.getDay()];var day6 = week[yday6.getDay()];//요일 인덱스 구하기   	
//     	var month = date.getMonth()+1; //월 구하기

/* ['month', '개체수1'], 
        ['1월', 797],   ['2월', 864],  ['3월', 822],  ['4월', 814],  ['5월', 899],  ['6월', 1137],
        ['7월', 1176], ['8월', 1276], ['9월', 1694], ['10월', 2141], ['11월', 2609], ['12월', 2954]  */
        var data2 = google.visualization.arrayToDataTable([
        	['week', '이번주','지난주'], 
            ['${ytday[5]}', ${wsel[6]}, 17090],  
            ['${ytday[4]}', ${wsel[5]}, 22906],  
            ['${ytday[3]}', ${wsel[4]}, 11802],  
            ['${ytday[2]}', ${wsel[3]}, 33851],  
            ['${ytday[1]}', ${wsel[2]}, 31109],  
            ['${ytday[0]}', ${wsel[1]}, 10913],  
            ['${today}', ${wsel[0]}, 10917] 
        ]); 
        var options2 = { 
          hAxis: { title: '한주간 매출' },
          vAxis: {
              viewWindow: {min: 0 }  },

          curveType: 'function', 
/*           legend: { position: 'bottom' },  */
             tooltip:{isHtml: true }, 
             colors: ['#5f76e8','#ff4f70'],
          focusTarget: 'category', 
          crosshair: { trigger: 'both',orientation: 'vertical', color: 'silver', opacity: 0.1  },
          pointSize: 5,
          pointShape: 'circle'
       }; 
       var chart2 = new google.visualization.LineChart(document.getElementById('curve_chart')); 
       chart2.draw(data2, options2); 
      }
    </script>
      <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {	
      var data = google.visualization.arrayToDataTable([
        ["Element", "만 원", { role: "style" } ],
        ["1월", 894, "#5f76e8"], ["2월", 1049, "#fdc16a"], ["3월", 1930, "#ff4f70"],
        ["4월", 2145, "color: #01caf1"], ["5월", 2145, "color: #5f76e8"], ["6월", 245, "color: #fdc16a"],
        ["7월", 215, "color: #ff4f70"],  ["8월", 145, "color: #01caf1"],  ["9월", 2145, "color: #5f76e8"],
        ["10월", 0, "color: #fdc16a"],   ["11월", 0, "color: #ff4f70"],   ["12월", 0, "color: #01caf1"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]
      );

      var options3 = {
        //title: 월별 매출,
        width: 600,
        height: 400,
        bar: {groupWidth: "75%"},
        legend: { position: "none" },
      };
      var chart3 = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart3.draw(view, options3);
  }

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
<!-- 					    /seller/menu_add_form.fdl -->
					    <!--  style="a {color: #7c8798} a:hover {color: #5f76e8;}"style.min.css 6242 -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/seller/show_form.fdl">정보조회/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/orderlist.fdl" >주문리스트</a>
					  </li>
					  <li class="nav-item">
						<a class="nav-link" href="<%=application.getContextPath()%>/store_new_form.fdl" >트럭등록</a>
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
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div id="page-container" class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><!-- <a href="index.html"></a> -->
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                       
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
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">${cntOPStot}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">판매량</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                                            class="set-doller">￦</sup>${wseltot}</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">주간매출
                                    </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
<!--                                 	<span  > <img alt="" src="../../resources/imgs/boss/원.png" style="max-width: 24px;max-height: 24px;"></span> -->
                                    <span class="opacity-7"><i class="fas fa-won-sign"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">${fvo.memberLikeCount}</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">-18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">좋아요</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="thumbs-up"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 font-weight-medium">
                                    <sup class="set-doller">￦</sup>86445600</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">월매출</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="globe"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                   <div class="row"><!--옴ㄹ기기 -->
                    <div class="col-lg-7 col-md-12">
                        <div class="card">
                            <div class="card-body">
 <!--                                <div id="campaign-v2"  style="height:283px; width:100%;"></div> -->
 								<div class="float-left">
                                <div id="donutchart" class="mt-2 float-left" style="height: 315px; width:100%;"></div><!-- height:460px; height:283px; 원형차트 -->
                                </div>
                                
                        
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <i class="fas fa-circle text-primary font-10 mr-2"></i>
                                        <span class="text-muted">만원 미만</span>
                                        <span class="text-dark float-right font-weight-medium">${cntOPS[0]}</span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-danger font-10 mr-2"></i>
                                        <span class="text-muted">3만원 미만</span>
                                        <span class="text-dark float-right font-weight-medium">${cntOPS[1]}</span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-cyan font-10 mr-2"></i>
                                        <span class="text-muted">5만원 미만</span>
                                        <span class="text-dark float-right font-weight-medium">${cntOPS[2]}</span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-warning font-10 mr-2"></i>
                                        <span class="text-muted">5만원 이상</span>
                                        <span class="text-dark float-right font-weight-medium">${cntOPS[3]}</span>
                                    </li>
                                </ul>
                                <div class="mt-3">
                                <ul class="list-inline text-center mt-5 mb-2">
                                    <li class="list-inline-item text-muted font-italic">회당 총 주문 금액</li>
                                </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="card">
                      <!--       <div class="card-body"> -->
                                	<div id="curve_chart" style="height: 297px; width:100%;" ></div>
                                <ul class="list-inline text-center mt-5 mb-2">
                                    <li class="list-inline-item text-muted font-italic">주간 매출량</li>
                                </ul>
                   <!--          </div> -->
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-lg-7 col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="pl-4 mb-5" style="height: 370px;">
                                    <div id="columnchart_values" style="height:294px; position: relative;" ></div>
                                </div>
                                <ul class="list-inline text-center mt-5 mb-2">
                                    <li class="list-inline-item text-muted font-italic">이달의 판매</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mb-4">Memo</h4>
                                <div class="" style="height:250px">
                                <form>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="10" placeholder="Text Here..."></textarea>
                                        <small id="textHelp" class="form-text text-muted">Helper Text</small>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- *************************************************************** -->
                <!-- End Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
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
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!--     apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
<!--     Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
<!--     This page JavaScript -->
<!--     <script src="assets/extra-libs/c3/d3.min.js"></script> -->
<!--     <script src="assets/extra-libs/c3/c3.min.js"></script> -->
<!--     <script src="assets/libs/chartist/dist/chartist.min.js"></script> -->
<!--     <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script> -->
<!--     <script src="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script> -->
<!--     <script src="assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script> -->
<!--     <script src="dist/js/pages/dashboards/dashboard1.min.js"></script> -->
</body>

</html>
