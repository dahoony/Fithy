<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META name="Descript-xion" content="체육시설을 조회 및 예약하는 사이트입니다.">

<title>Fithy</title>

<!-- Mobile Specific Meta
		================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />

<!-- CSS ================================================== -->
<!-- Fontawesome Icon font (아이콘) -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
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
<link rel="stylesheet" href="../css/media-queries.css">

<!-- Google Font
		=========================== -->

<!-- Oswald / Title Font -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css'>
<!-- Ubuntu / Body Font -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/detail.css">

<!-- Modernizer Script for old Browsers -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<script src="../js/jquery-3.2.1.js"></script>
<!-- 관리자 회원의 개인 정보를 한페이지에 가져오기 위해 사용한 ajax  -->
<script>
	$(function() {
		$.ajax({
			url : "../faDetail.fithy",
			dataType : "json",
			success : function(data) {
				console.log("데이터 가져오기 성공");
				console.log(data);

				var faName = "";
				var faNum = "";
			
				$.each(data, function(index, item) {
					faName = faName + item.faName;
					faNum = faNum + item.faNum;
				});

				$("#faName").html(faName);
				$("#faNum").html(faNum);
			},
			error : function(data) {
				console.log("실패");
			}
		});

		$.ajax({
			url : "../fcDetail.fithy",
			dataType : "json",
			success : function(data) {
				console.log("데이터 가져오기 성공");
				console.log(data);

				var fcName = "";
				var fcAddress = "";
				var fcNum = "";

				$.each(data, function(index, item) {
					fcName = fcName + item.fcName;
					fcAddress = fcAddress + item.fcAddress;
					fcNum = fcNum + item.fcNum;
				});

				$("#fcName").html(fcName);
				$("#fcAddress").html(fcAddress);
				$("#fcNum").html(fcNum);

			},
			error : function(data) {
				console.log("실패");
			}
		});
		
		$("#faDelete").click(function() {
			alert("회원탈퇴");
		});
		
		$("#fcDelete").click(function(){
			alert("시설삭제");
		});
	});
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
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- 메인 아이콘 -->
				<a class="navbar-brand" href="../index.jsp">
					<h1 id="logo">
						<span class="color"> Fi</span>tness + heal<span class="color">thy</span>
					</h1>
				</a>
			</div>

			<!-- 메뉴 -->
			<nav class="collapse navbar-collapse navbar-right" role="Navigation">
				<ul id="nav" class="nav navbar-nav">
					<li class="current"><a href="../index.jsp">홈</a></li>

					<li><a href="#blog">마이페이지</a></li>
					<!-- 로그인 로그아웃을 했을 때 바꿔주기 위해서 jquery사용 -->
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

	<!-- ==================================== 커뮤니티 -->

	<section id="blog" class="bg-one">
		<div class="container">
			<div class="row">
				<section>
					<div class="title text-center wow fadeInDown">
						<h2>
							나의 <span class="color">정보</span>
						</h2>
						<div class="border"></div>
					</div>
				</section>
				<div class="clearfix">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
								<div class="panel panel-info">
									<div class="panel-heading">
										<h3 class="panel-title">나의 정보</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class=" col-md-9 col-lg-9 ">
												<table class="table table-user-information">
													<tbody>
														<tr>
															<td>이름</td>
															<td><span id="faName"></span></td>
														</tr>
														<tr>
															<td>번호</td>
															<td><span id="faNum"></span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="panel-footer">
										<span class="pull-right"> 
										<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" id="userDelete" href="../faDelete.fithy">회원 탈퇴</a>
										</span>
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

	<section id="blog" class="bg-one">
		<div class="container">
			<div class="row">
				<section>
					<div class="title text-center wow fadeInDown">
						<h2>시설 <span class="color">정보</span></h2>
						<div class="border"></div>
					</div>
				</section>
				<div class="clearfix">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
								<div class="panel panel-info">
									<div class="panel-heading">
										<h3 class="panel-title">시설 정보</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class=" col-md-9 col-lg-9">
												<table class="table table-user-information">
													<tbody>
														<tr>
															<td>시설 이름</td>
															<td><span id="fcName"></span></td>
														</tr>
														<tr>
															<td>시설 주소</td>
															<td><span id="fcAddress"></span></td>
														</tr>
														<tr>
															<td>시설 전화번호</td>
															<td><span id="fcNum"></span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div>
										<span class="pull-right"> 
										<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" id="fcDelete" href="../fcDelete.fithy">시설 삭제</a>
										</span>
									</div>
									<div>
										<span class="pull-right"> 
										<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" id="fcRegister" href="fcRegister.jsp">시설 등록</a>
										</span>
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

	<!-- Back to Top
		============================== -->
	<a href="javascript:;" id="scrollUp"> 
	<i class="fa fa-angle-up fa-2x"></i>
	</a>

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


	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>
</body>
</html>