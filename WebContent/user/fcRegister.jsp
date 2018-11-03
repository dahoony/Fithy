<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META name="Descript-xion" content="체육시설을 조회 및 예약하는 사이트입니다.">

<title>Fithy</title>

<!-- Mobile Specific Meta
		================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />

<!-- CSS
		================================================== -->
<!-- Fontawesome Icon font (아이콘) -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- Animate.css (동작)-->
<link rel="stylesheet" href="../css/animate.css">
<!-- Owl Carousel (슬라이드) -->
<link rel="stylesheet" href="../css/owl.carousel.css">
<!-- Grid Component css -->
<link rel="stylesheet" href="../css/component.css">
<!-- Slit Slider css -->
<link rel="stylesheet" href="../css/slit-slider.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="../css/main.css">
<!-- Media Queries -->
<link rel="stylesheet" href="../css/media-queries.cs	s">

<!-- Google Font
		=========================== -->

<!-- Oswald / Title Font -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css'>
<!-- Ubuntu / Body Font -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300'
	rel='stylesheet' type='text/css'>
<!-- 예약 조회 테이블 css -->
<link href="../css/reservationTable.css" rel="stylesheet">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/detail.css">

<link href='http://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../css/style.css">


<!-- Modernizer Script for old Browsers -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<script src="../js/jquery-3.2.1.js"></script>

<script>
	// 	(function(i, s, o, g, r, a, m) {
	// 		i['GoogleAnalyticsObject'] = r;
	// 		i[r] = i[r] || function() {
	// 			(i[r].q = i[r].q || []).push(arguments)
	// 		}, i[r].l = 1 * new Date();
	// 		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
	// 		a.async = 1;
	// 		a.src = g;
	// 		m.parentNode.insertBefore(a, m)
	// 	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
	// 			'ga');

	// 	ga('create', 'UA-54152927-1', 'auto');
	// 	ga('send', 'pageview');
</script>

</head>

<body id="body">
	<!-- ====================================  로딩화면 -->
	<div id="loading-mask">
		<div class="loading-img">
			<img alt="Preloader" src="../img/preloader.gif" />
		</div>
	</div>
	<!-- ==================================== 상단 바 -->
	<header id="navigation" class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- 메인 아이콘 -->
				<a class="navbar-brand" href="#body">
					<h1 id="logo">
						<span class="color"> Fi</span>tness + heal<span class="color">thy</span>
						<!-- 상단 로고 삽입부분 
							<img src="img/logo-meghna.png" alt="Meghna" /> -->
					</h1>
				</a>
			</div>

			<!-- 메뉴 -->
			<nav class="collapse navbar-collapse navbar-right" role="Navigation">
				<ul id="nav" class="nav navbar-nav">
					<li class="current"><a href="../index.jsp">홈</a></li>

					<li><a href="#blog">시설등록</a></li>
					<li>
						<%
							String faName = (String) session.getAttribute("faName");
							String faId = (String) session.getAttribute("faId");
							String uName = (String) session.getAttribute("uName");
							String uId = (String) session.getAttribute("uId");

							if ((faName != null && faId != null)) {
								out.print(faName + "님의 정보입니다!");
							} else if (uName != null && uId != null) {
								out.print(uName + "님의 정보입니다!");
							} else {
								out.print("로그인해주세요");
							}
						%>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();

		});
	</script>
	<!-- ==================================== 커뮤니티 -->

	<section id="blog" class="bg-one">
		<div class="container">
			<div class="row">

				<section>
					<div class="title text-center wow fadeInDown">
						<h2>
							시설 <span class="color">등록</span>
						</h2>
						<div class="border"></div>
					</div>
				</section>

				<div>
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-body">
								<div class="row">
									<div class="col-md-11"
										style="border-right: 1px; padding-right: 10px;">
										<!-- Nav tabs -->
										<ul class="nav nav-tabs">

										</ul>
										<!-- Tab panes -->
										<div>
											<div class="tab-pane" id="Registration">
												<form role="form" class="form-horizontal"
													action="../fcRegister.fithy" method="post">
													<div class="form-group">
														<label for="fcName" class="col-sm-2 control-label">
															Name </label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="fcName"
																id="fcName" />
														</div>
													</div>

													<div class="form-group">
														<label for="fcNum" class="col-sm-2 control-label">
															Mobile </label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="fcNum"
																id="fcNum" />
														</div>
													</div>
													<div class="form-group">
														<label for="userPostNumber" class="col-sm-2 control-label">
															PostNumber </label>
														<div class="col-sm-10">
															<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
															<input type="text" name="userPostNumber"
																class="postcodify_postcode5" /> <input type="button"
																id="postcodify_search_button" value="검색"
																class="btn btn-primary btn-sm">
														</div>
													</div>
													<div class="form-group">
														<label for="fcAddress" class="col-sm-2 control-label">
															Address </label>
														<div class="col-sm-10">
															<input type="text" name="fcAddress"
																class="postcodify_address" />
														</div>
													</div>
													<div class="form-group">
														<label for="fcDetailAddress"
															class="col-sm-2 control-label"> DetailAddress </label>
														<div class="col-sm-10">
															<input type="text" name="fcDetailAddress"
																class="postcodify_details" />
														</div>
													</div>
													<div class="form-group">
														<label for="Kind"
															class="col-sm-2 control-label"> Kind </label>
														<div class="col-sm-10">
															<input type="radio" name="Kind" id="Kind"
																value="TE" checked>테니스 <input type="radio"
																name="Kind" id="Kind" value="FO">풋살
															<input type="radio" name="Kind"
																id="Kind" value="BD">배드민턴 <input
																type="radio" name="Kind" id="Kind"
																value="SW">수영 <input type="radio"
																name="Kind" id="Kind" value="SH">사격
															<input type="radio" name="Kind"
																id="Kind" value="BA">농구
														</div>
													</div>
													<div class="form-group">
														<label for="price" class="col-sm-2 control-label">
															Price </label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="price"
																id="price" />
														</div>
													</div>
													<div class="row">
														<div class="col-sm-2"></div>
														<div class="col-sm-10" align="right">
															<input type="submit" value="등록"
																class="btn btn-primary btn-sm">

														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<footer id="footer" class="bg-one">
		<div class="container">
			<div class="row wow fadeInUp" data-wow-duration="500ms">
				<div class="col-lg-12"></div>
				<!-- end col lg 12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->

	<!-- Back to Top
		============================== -->
	<a href="javascript:;" id="scrollUp"> <i
		class="fa fa-angle-up fa-2x"></i>
	</a>

	<!-- end Footer Area
		========================================== -->

	<!-- 
		Essential Scripts
		=====================================-->

	<!-- Main jQuery -->
	<script src="../js/jquery-1.11.0.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Slitslider -->
	<script src="../js/jquery.slitslider.js"></script>
	<script src="../js/jquery.ba-cond.min.js"></script>
	<!-- Parallax -->
	<script src="../js/jquery.parallax-1.1.3.js"></script>
	<!-- Owl Carousel -->
	<script src="../js/owl.carousel.min.js"></script>
	<!-- Portfolio Filtering -->
	<script src="../js/jquery.mixitup.min.js"></script>
	<!-- Custom Scrollbar -->
	<script src="../js/jquery.nicescroll.min.js"></script>
	<!-- Jappear js -->
	<script src="../js/jquery.appear.js"></script>
	<!-- Pie Chart -->
	<script src="../js/easyPieChart.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing-1.3.pack.js"></script>
	<!-- tweetie.min -->
	<script src="../js/tweetie.min.js"></script>
	<!-- Google Map API -->
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<!-- Highlight menu item -->
	<script src="../js/jquery.nav.js"></script>
	<!-- Sticky Nav -->
	<script src="../js/jquery.sticky.js"></script>
	<!-- Number Counter Script -->
	<script src="../js/jquery.countTo.js"></script>
	<!-- wow.min Script -->
	<script src="../js/wow.min.js"></script>
	<!-- For video responsive -->
	<script src="../js/jquery.fitvids.js"></script>
	<!-- Grid js -->
	<script src="../js/grid.js"></script>
	<!-- Custom js -->
	<script src="../js/custom.js"></script>

	<!-- 	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<!-- 	<script -->
	<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<!-- 	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>



</body>
</html>