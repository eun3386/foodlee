<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
<title>store new form</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- 제일 먼저 안하면 에러 -->

<link href="${pageContext.request.contextPath}/dist/css/style.min.css" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ksauwx09vv&submodules=geocoder"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <link href="${pageContext.request.contextPath}/resources/css/boss-ad.css" rel="stylesheet">
<style type="text/css">
#main-wrapper[data-layout=vertical][data-sidebartype=full] .page-wrapper
	{
	margin-left: 130px;
	margin-right: 130px;
}
</style>
<script type="text/javascript">
function clickevent() {	
	window.location.href ="${pageContext.request.contextPath}/store_add.fdl";
}
</script>
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
					    <a class="nav-link" href="<%=application.getContextPath()%>/review.fdl">트럭등록</a>
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
                                        class="text-dark">${sellerId}님</span> <i data-feather="chevron-down"
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
                <div class="row">
                <div class="col-lg-12 col-md-12"><!-- col-sm-12 col-md-6 col-lg-4 //col-sm-12 col-md-3 col-lg-3 -->
                        <div class="card text-center">
                        <form action="${pageContext.request.contextPath}/store_add.fdl" method="post" enctype="multipart/form-data">
                        	<h4 class="card-title">영업시간</h4>
                             <!-- *************************************************************** -->
                              <!-- *************테이블************** -->
                             <!-- *************************************************************** -->
                             <div class="table-responsive  mt-3 col-md-6 col-lg-4"><!-- 요일별 위치 end -->
                                <table class="table table-bordered  table-responsive-lg" id="tr">
<!--                                     <thead> -->
<!--                                         <tr> -->
<!--                                             <th scope="col">#</th> -->
<%--                                             <th scope="col"><code>일</code></th> --%>
<!--                                             <th scope="col">월</th> -->
<!--                                             <th scope="col">화</th> -->
<!--                                             <th scope="col">수</th> -->
<!--                                             <th scope="col">목</th> -->
<!--                                             <th scope="col">금</th> -->
<%--                                             <th scope="col"><code>토</code></th> --%>
<!--                                         </tr> -->
<!--                                     </thead> -->
                                    <tbody>
                                        <tr>
                                            <th scope="row">시작시간</th>
                                            <td><input type="time" name="OperationHour1" class="form-control" value="22:33:00"></td>
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
                                        </tr>
                                        <tr>
                                            <th scope="row">마감시간</th>
                                            <td><input type="time" name="OperationHour2" class="form-control" value="22:33:00"></td>
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
<!--                                             <td><input type="time" class="form-control" value="22:33:00"></td> -->
                                        </tr>
	                                     <tr>
                                            <th scope="row">구 이름</th>
		                                <td>
										<select name="location">
											<option value="11230,강남구">강남구</option>
											<option value="11250,강동구">강동구</option>
											<option value="11090,강북구">강북구</option>
											<option value="11160,강서구">강서구</option>
											<option value="11210,관악구">관악구</option>
											<option value="11050,광진구">광진구</option>
											<option value="11170,구로구">구로구</option>
											<option value="11180,금천구">금천구</option>
											<option value="11110,노원구">노원구</option>
											<option value="11100,도봉구">도봉구</option>
											<option value="11060,동대문구">동대문구</option>
											<option value="11200,동작구">동작구</option>
											<option value="11140,마포구">마포구</option>
											<option value="11130,서대문구">서대문구</option>
											<option value="11220,서초구">서초구</option>
											<option value="11040,성동구">성동구</option>
											<option value="11080,성북구">성북구</option>
											<option value="11240,송파구">송파구</option>
											<option value="11150,양천구">양천구</option>
											<option value="11190,영등포구">영등포구</option>
											<option value="11030,용산구">용산구</option>
											<option value="11120,은평구">은평구</option>
											<option value="11010,종로구">종로구</option>
											<option value="11020,중구">중구</option>
											<option value="11070,중랑구">중랑구</option>
										</select>
										</td>
	                                </tr>
                                    </tbody>
                                </table>
                            </div> <!-- 요일별 위치 end -->
		                    <div class="col-md-6 col-lg-4"><!--트럭이름  -->
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">판매트럭 이름</h4>
		                                <input type="text" name="truckName" class="form-control" >
		                            </div>
		                        </div>
		                    </div><!--트럭이름   end-->
		                    <div class="col-md-6 col-lg-4"><!--트럭위치  -->
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">판매트럭 상세위치</h4>
		                                <input type="text" name="truckLoca" class="form-control" >
		                            </div>
		                        </div>
		                    </div><!--트럭이름   end-->
		                    <div id="View_area" class="col-sm-12 col-md-6 col-lg-4"  
		                    style="position:relative; width: 100px; height: 100px;
									color: black; border: 0px solid black; display: inline;"><!--트럭사진 사진 -->
							</div><!--트럭사진 사진 -->
	 	                    <div class="col-sm-12 col-md-6 col-lg-4">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">트럭사진 경로</h4>
		                                   <div class="form-group">
<!-- 		                                   		<input type="file" name="ImgPath" multiple size="64"> -->
		                                   		<input type="file" name="imgfiles" id="file_add" multiple="multiple">
		                                   </div>
		                            </div>
		                        </div>
		                    </div><!-- 트럭사진 end  -->
				            <div class="col-md-7"><!-- 트럭카테고리  -->
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">트럭 카테고리</h4>
		                                <div class="form-check form-check-inline">
		                                    <div class="custom-control custom-checkbox">
		                                        <input class="form-check-input" type="radio" name="category" id="inRadio1" value="1">
		                                        <label class="form-check-label" for="inRadio1">간식</label>
		                                    </div>
		                                </div>
		                                <div class="form-check form-check-inline">
		                                    <div class="custom-control custom-checkbox">
		                                        <input type="radio" class="form-check-input" name="category" id="inRadio2" value="2">
		                                        <label class="form-check-label" for="inRadio2">식사</label>
		                                    </div>
		                                </div>
		                                <div class="form-check form-check-inline">
		                                    <div class="custom-control custom-checkbox">
		                                        <input type="radio" class="form-check-input" name="category" id="inRadio3" value="3" >
		                                        <label class="form-check-label" for="inRadio3">디저트</label>
		                                    </div>
		                                </div>
		                                <div class="form-check form-check-inline">
		                                    <div class="custom-control custom-checkbox">
		                                        <input type="radio" class="form-check-input"name="category" id="inRadio4" value="4" >
		                                        <label class="form-check-label" for="inRadio4">밥차</label>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div><!--트럭카테고리 end  -->
		                    
		                    
		                    <div class="col-sm-12 col-md-6 col-lg-4"><!--대표메뉴  -->
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">대표메뉴</h4>
		                                   <div class="form-group">
		                                       <input type="text" class="form-control" name="MainMenu">
		                                   </div>
		                            </div>
		                        </div>
		                    </div><!--대표메뉴 end  -->
		                    <div class="col-sm-12 col-md-8 col-lg-4"><!--위치죄표  -->
		                        <div class="card" style="width: 610px;">
		                            <div class="card-body" style="width: 600px;">
		                                <h4 class="card-title" >트럭위치</h4>
		                                   <div class="form-group" id="NaverMap" name="naverMap" style="width: 500px;max-width: 100%; height: 325px; ">
											
		                                   </div>
		                                   <div class="form-group" style="text-align: center; margin-top: 10px;">
												<input type="text" name="namp_lat" ><!-- 위도 -->
												<input type="text" name="namp_lng" ><!-- 경도 -->
											</div>
		                            </div>
		                        </div>
		                    </div><!--위치 end  -->
                            <div class="form-group"><!-- 보내기 -->
									<input type="submit" class="btn btn-primary btn-block btn-lg" value="등록">
								</div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
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
</div> <!-- End Main wrapper -->

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script>
    var nmap = new naver.maps.Map('NaverMap', {// naverMap 값은 div 의 id값
    	center : new naver.maps.LatLng(37.5782709,126.9770043), //지도 중앙 위치: 위도,경도 설정
    	zoom : 12, //줌 설정 1~14 숫자가 클수록 확대, default 9
    	zoomControl : true, //줌 컨트롤 표시(기본값 표시 안함)
    	zoomControlOptions : {//줌 컨트롤 오른쪽 위로 설정
    		position : naver.maps.Position.TOP_RIGHT
    	},
    	mapTypeControl : true, //일반 위성 지도보기 컨트롤 표시(기본값 표시안함)
    	
    });
    naver.maps.Event.addListener(nmap, 'click', function(e) {
		$('[name=namp_lat]').val(e.coord.lat()); //위도
		$('[name=namp_lng]').val(e.coord.lng()); //경도
	});
    </script>
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