<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
<title>ad2</title>
<link href="${pageContext.request.contextPath}/dist/css/style.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 
 <link href="${pageContext.request.contextPath}/resources/css/boss-ad.css" rel="stylesheet">
<style type="text/css">
#main-wrapper[data-layout=vertical][data-sidebartype=full] .page-wrapper
	{
	margin-left: 260px;
	margin-right: 260px;
}
</style>
</head>
<body>
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
                        <a href="index.html">
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
                                <img src="resources/imgs/boss/logo-text.png" alt="homepage" class="dark-logo" />
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
                        <!-- Notification -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                                id="bell" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="bell" class="svg-icon"></i></span>
                                <span class="badge badge-primary notify-no rounded-circle">5</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                                <ul class="list-style-none">
                                    <li>
                                        <div class="message-center notifications position-relative">
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <div class="btn btn-danger rounded-circle btn-circle">
                                                <i data-feather="airplay" class="text-white"></i></div>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                                    <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-success text-white rounded-circle btn-circle"><i
                                                        data-feather="calendar" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Event today</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-info rounded-circle btn-circle"><i
                                                        data-feather="settings" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Settings</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-primary rounded-circle btn-circle"><i
                                                        data-feather="box" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                        class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
                                            <strong>Check all notifications</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- End Notification -->
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i data-feather="settings" class="svg-icon"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <ul class="nav justify-content-center" >
					  <li class="nav-item">
					    <a class="nav-link active" href="boss.fdl">시작화면</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/menumodify.fdl">메뉴수정</a>
					    <!--  style="a {color: #7c8798} a:hover {color: #5f76e8;}"style.min.css 6242 -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/infomodify.fdl">정보수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/orderlist.fdl" >주문리스트</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="<%=application.getContextPath()%>/review.fdl">수정</a>
					  </li>
					</ul>
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right"><!--  오른쪽 부분-->
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item d-none d-md-block">
                            <a class="nav-link" href="javascript:void(0)">
                                <form>
                                    <div class="customize-input"><!-- 검색부분 -->
                                        <input class="form-control custom-shadow custom-radius border-0 bg-white"
                                            type="search" placeholder="Search" aria-label="Search">
                                        <i class="form-control-icon" data-feather="search"></i>
                                    </div>
                                </form>
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
                                        class="text-dark">판매자님</span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="user"
                                        class="svg-icon mr-2 ml-1"></i>
                                    My Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="credit-card"
                                        class="svg-icon mr-2 ml-1"></i>
                                    My Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Inbox</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="settings"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="power"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Logout</a>
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
                <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a>
                                    </li>
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
	                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                   <div class="row"><!--옴ㄹ기기 -->
                    <div class="col-lg-6 col-md-12">
                       <div class="signup-form pl-4 mb-5">
						    <form action="${pageContext.request.contextPath}/결제.fdl" method="post">
								<div class="form-header">
									<h2>파워링크</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center">55,000 <small><i class="fas fa-won-sign"></i></small></h1>
								<form class="mt-4">
                                    <div class="form-group">
                                        <input type="number" class="form-control" value="6029"  step="1000"
                                        min="10000" max="50000" required>
                                    </div>
                                </form>
						        </div>
						        <div class="form-group">
									<p>소비자와 가장 가까운 광고!<br>
										높은 전환 효과를 기대할 수 있는
										프리미엄 배너 광고 상품입니다.
										낮은 비용과 높은 타겟팅 정확도를 누리세요!
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input type="date" class="form-control" name="startdate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
								<div class="form-group">
									<label>노출위치</label>
									<select name="location"  class="form-control" id="inlineFormCustomSelect">
										<option value="강남구">강남구</option>
										<option value="강동구">강동구</option>
										<option value="강북구">강북구</option>
										<option value="강서구">강서구</option>
										<option value="관악구">관악구</option>
										<option value="광진구">광진구</option>
										<option value="구로구">구로구</option>
										<option value="금천구">금천구</option>
										<option value="노원구">노원구</option>
										<option value="도봉구">도봉구</option>
										<option value="동대문구">동대문구</option>
										<option value="동작구">동작구</option>
										<option value="마포구">마포구</option>
										<option value="서대문구">서대문구</option>
										<option value="서초구">서초구</option>
										<option value="성동구">성동구</option>
										<option value="성북구">성북구</option>
										<option value="송파구">송파구</option>
										<option value="양천구">양천구</option>
										<option value="영등포구">영등포구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="종로구">종로구</option>
										<option value="중구">중구</option>
										<option value="중랑구">중랑구</option>
									</select>
						        </div>        
						        <div class="form-group">
									<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block btn-lg">등록</button>
								</div>	
						    </form>
							<div class="text-center small">Already have an account? <a href="#">Login here</a></div>
						</div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                       <div class="signup-form pl-4 mb-5">
						    <form action="${pageContext.request.contextPath}/결제.fdl" method="post">
								<div class="form-header">
									<h2>배너광고</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center">45,000 <small><i class="fas fa-won-sign"></i></small></h1>
						        </div>
						        <div class="form-group">
									<p>광고 노출에 따른 인지도 증가 효과!<br>
										띠배너 형태의 광고로 강력한 타겟팅 기능과
										풍부하고 정확한 데이터를 지원하는 광고상품입니다.
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input type="date" class="form-control" name="startdate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
								<div class="form-group">
									<label>노출위치</label>
<!-- 						            <input type="password" class="form-control" name="confirm_password" required="required"> -->
						            <select name="location"  class="form-control" id="inlineFormCustomSelect">
										<option value="강남구">강남구</option>
										<option value="강동구">강동구</option>
										<option value="강북구">강북구</option>
										<option value="강서구">강서구</option>
										<option value="관악구">관악구</option>
										<option value="광진구">광진구</option>
										<option value="구로구">구로구</option>
										<option value="금천구">금천구</option>
										<option value="노원구">노원구</option>
										<option value="도봉구">도봉구</option>
										<option value="동대문구">동대문구</option>
										<option value="동작구">동작구</option>
										<option value="마포구">마포구</option>
										<option value="서대문구">서대문구</option>
										<option value="서초구">서초구</option>
										<option value="성동구">성동구</option>
										<option value="성북구">성북구</option>
										<option value="송파구">송파구</option>
										<option value="양천구">양천구</option>
										<option value="영등포구">영등포구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="종로구">종로구</option>
										<option value="중구">중구</option>
										<option value="중랑구">중랑구</option>
									</select>
						        </div>        
						        <div class="form-group">
									<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block btn-lg">등록</button>
								</div>	
						    </form>
							<div class="text-center small">Already have an account? <a href="#">Login here</a></div>
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
                    <div class="col-lg-6 col-md-12">
                       <div class="signup-form pl-4 mb-5">
						    <form action="${pageContext.request.contextPath}/결제.fdl" method="post">
								<div class="form-header">
									<h2>파워링크</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center">55,000 <small><i class="fas fa-won-sign"></i></small></h1>
						        </div>
						        <div class="form-group">
									<p>소비자와 가장 가까운 광고!<br>
										높은 전환 효과를 기대할 수 있는
										프리미엄 배너 광고 상품입니다.
										낮은 비용과 높은 타겟팅 정확도를 누리세요!
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input type="date" class="form-control" name="startdate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
								<div class="form-group">
									<label>노출위치</label>
						            <input type="password" class="form-control" name="confirm_password" required="required">
						        </div>        
<!-- 						        <div class="form-group"> -->
<!-- 									<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label> -->
<!-- 								</div> -->
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block btn-lg">해지</button>
								</div>	
						    </form>
							<div class="text-center small">Already have an account? <a href="#">Login here</a></div>
						</div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                       <div class="signup-form pl-4 mb-5">
						    <form action="${pageContext.request.contextPath}/결제.fdl" method="post">
								<div class="form-header">
									<h2>배너광고</h2>
<!-- 									<p>Fill out this form to start your free trial!</p> -->
								</div>
						        <div class="form-group">
								<h1 class="text-center">45,000 <small><i class="fas fa-won-sign"></i></small></h1>
						        </div>
						        <div class="form-group">
									<p>광고 노출에 따른 인지도 증가 효과!<br>
										띠배너 형태의 광고로 강력한 타겟팅 기능과
										풍부하고 정확한 데이터를 지원하는 광고상품입니다.
									</p>
						        </div>
								<div class="form-group">
									<label>적용기간</label>
						            <input type="date" class="form-control" name="startdate" required="required">
						            <!-- 오늘 날짜 default로 !! -->
						        </div>
								<div class="form-group">
									<label>노출위치</label>
						            <input type="password" class="form-control" name="confirm_password" required="required">
						        </div>        
<!-- 						        <div class="form-group"> -->
<!-- 									<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label> -->
<!-- 								</div> -->
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block btn-lg">해지</button>
								</div>	
						    </form>
							<div class="text-center small">Already have an account? <a href="#">Login here</a></div>
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
                    href="https://wrappixel.com">WrapPixel</a>
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
</div> <!-- End Main wrapper -->

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${pageContext.request.contextPath}/dist/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="${pageContext.request.contextPath}/assets/extra-libs/prism/prism.js"></script>


</body>
</html>                            