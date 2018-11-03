<%@page import="fithy.project.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl 사용한다고 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<META name="Descript-xion" content="체육시설을 조회 및 예약하는 사이트입니다.">

<title>커뮤니티</title>

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
<link rel="stylesheet" href="../css/media-queries.css">
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">

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

<style>
#writeStyle:hover{background-color:#ffffff;color:#000000}
</style>

<script>
	$(function() {
		$.ajax({
			url : "../boardList.fithy",
			dataType : "json",
			success : function(data) {
				console.log("데이터 가져오기 성공");
				console.log(data);

				var str = "";

				str = str + "<table class='table table-hover'>";
				str = str + "<thead><tr>";
				str = str + "<th class='text-center'>번 호</th>";
				str = str + "<th class='text-center'>제 목</th>";
				str = str + "<th class='text-center'>작성자</th>";
				str = str + "<th class='text-center'>작성일</th></tr></thead><tbody>";

				$.each(data, function(index, item) {
					var boardNum = "";
					var boardTitle = "";
					var userId = "";
					var boardDate = "";

					boardNum = boardNum + item.boardNum;
					boardTitle = boardTitle + item.boardTitle;
					userId = userId + item.userId;
					boardDate = boardDate + item.boardDate;

					str = str + "<tr><td class='text-center'>" + boardNum + "</td>";
					str = str + "<td class='text-center'>" + boardTitle + "</td>";
					str = str + "<td class='text-center'>" + userId + "</td>";
					str = str + "<td class='text-center'>" + boardDate + "</td></tr>";
				
				});

				str = str + "</tbody></table>";

				$("#tableAdd").html(str);

			},
			error : function(request, status, error) {
				console.log("실패");
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});
</script>
</head>



<body id="blog-page">
	<!-- ====================================  로딩화면 -->
	<div id="loading-mask">
		<div class="loading-img">
			<img alt="Preloader" src="../img/preloader.gif" />
		</div>
	</div>
	<!-- ==================================== 고정 상단 바(이름 수정) -->
	<header id="navigation" class="navbar navbar-inverse navbar-fixed-top"
		role="navigation">
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

				</ul>
			</nav>
		</div>
	</header>



	<!-- ==================================== 커뮤니티 배너 -->
	<section id="blog-banner" class="bg-one">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">

					<div class="blog-icon">
						<i class="fa fa-book fa-4x"></i>
					</div>
					<div class="blog-title">
						<h1>
							<b><span class="color">커뮤니티</span></b>
						</h1>
					</div>

				</div>
				<!-- End col-lg-12 -->
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</section>
	<!-- End Section -->


	<!-- ==================================== 커뮤니티 -->
	<section id="blog" class="bg-one">
		<div class="container">
			<div class="panel panel-success" >
				<div class="panel-heading" style = "background-image: linear-gradient(to bottom, #6cb670 100%, #6cb670 100%);border-color:#6cb670;color:#ffffff">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-3">
							<h2 class="text-center pull-left" style="padding-left: 30px;">
								<span class="glyphicon glyphicon-list-alt"> </span> 함께해요!
							</h2>
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="col-xs-12 col-md-7">
									<label> Search </label>
									<div class="form-group">
										<div class="input-group">
											<input type="text" class="form-control input-md" name="search">

											<button type="button" class="btn btn-sm btn-warning">
												<span class=" glyphicon glyphicon-search"></span>
											</button>

										</div>
									</div>
								</div>
								<a class="btn btn-green pull-right" id="writeStyle" href="./boardWrite.jsp">글쓰기</a>
							</div>
						</div>

					</div>
				</div>

				<div class="panel-body table-responsive" id="tableAdd"></div>

				<div class="panel-footer">
					<div class="row">
						<div class="col-lg-12">
							<div class="col-md-8"></div>
							<div class="col-md-4">
								<p class="muted pull-right">
									<strong> © 2017 All rights reserved </strong>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="../js/board.js"></script>



	<!-- ========================================== 하단 부분-->

	<footer id="footer" class="bg-one">
		<div class="container">
			<div class="row wow fadeInUp animated" data-wow-duration="500ms"
				style="visibility: visible; animation-duration: 500ms; animation-name: fadeInUp;">
				<div class="col-lg-12">

					<!-- copyright -->
					<div class="copyright text-center">
						<a href="../index.jsp"> <img src="../img/logo_fithy.png"
							alt="Fithy" />
						</a> <br />
						<p>Copyright © 2014. All Rights Reserved.</p>
					</div>
					<!-- /copyright -->

				</div>
				<!-- end col lg 12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->


	<!-- 	<!-- Back to Top -->
	<!-- 		============================== -->
	-->
	<!-- 	<a href="javascript:;" id="scrollUp"> <i class="fa fa-angle-up fa-2x"></i></a> -->

	<!-- 
		Essential Scripts
		=====================================-->

	<!-- Main jQuery -->
	<script src="../js/jquery-1.11.0.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="../js/bootstrap.min.js"></script>

	<script src="../js/classie.js"></script>
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