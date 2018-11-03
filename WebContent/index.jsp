<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<!DOCTYPE html>

<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META name="Descript-xion" content="체육시설을 예약하는 사이트입니다.">

<title>Fithy</title>

<!-- Mobile Specific Meta ================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.png" />

<!-- CSS ================================================== -->
<!-- Fontawesome Icon font (아이콘) -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Animate.css (동작)-->
<link rel="stylesheet" href="css/animate.css">
<!-- Owl Carousel (슬라이드) -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- Grid Component css -->
<link rel="stylesheet" href="css/component.css">
<!-- Slit Slider css -->
<link rel="stylesheet" href="css/slit-slider.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/main.css">
<!-- Media Queries -->
<link rel="stylesheet" href="css/media-queries.css">

<!-- Google Font =========================== -->

<!-- Oswald / Title Font -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
<!-- Ubuntu / Body Font -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/login.css">

<!-- Modernizer Script for old Browsers -->
<script src="js/modernizr-2.6.2.min.js"></script>
<script src="js/jquery-3.2.1.js"></script>

<!-- 추천 메뉴에 데이터를 가져오기 위해 사용된 ajax -->
<script>
	$(function() {
			$.ajax({
				url : "./reservationFriend.fithy",
				dataType : "json",
				data : {
					
				},
				success : function(data) {
					console.log("데이터 가져오기 성공");
					console.log(data);
	
					var str = "<table class='table-users table' border='0'><tbody>";
	
					$.each(data, function(index, item) {
						console.log(item);
						var userId = "";
						var userName = "";
						userId = userId + item.uId;
						userName = userName + item.uName;
						str = str + "<tr><td width='10' align='center'><i class='fa fa-2x fa-user fw'></i></td><td><span style = 'color : black'>"+ userId + "</span><br><i class='fa fa-envelope'></i></td><td><span style = 'color : black'>"+userName+"</span></td>";
						str = str + "<td align='center'>Last Login: 6/14/2017<br><small class='text-muted'>2 days ago</small></td></tr>";

					});
					str = str+"</tbody></table>";
					$("#friendList").html(str);
				},
				error : function() {
					console.log("error");
				}
			});
			
			$.ajax({
				url : "./userFavorite.fithy",
				dataType : "json",
				success : function(data) {
					console.log("데이터 가져오기 성공");
					console.log(data);

					var str = "<table class='table-users table' border='0'><tbody>";
	
					$.each(data, function(index, item) {
						var fcName = "";
						var fcAddress = "";
						var kind ="";
						if(item.fcName == "" && item.fcAddress == ""){
							fcName = "해당 시설이 없습니다.";
							fcAddress = "해당 시설이 없습니다.";
						}
						fcName = fcName + item.fcName;
						fcAddress = fcAddress + item.fcAddress;
						kind = kind + item.kind;
						
						str = str + "<tr><td width='10' align='center'>";
						
						if(kind == "테니스"){
							str = str + "<img src = './img/tennis-ball.png' />";
						}else if(kind == "농구"){
							str = str + "<img src = './img/basketball.png' />";
						}else if(kind == "배드민턴"){
							str = str + "<img src = './img/badminton.png' />";
						}else if(kind == "풋살"){
							str = str + "<img src = './img/soccer1.png' />";
						}else if(kind == "수영"){
							str = str + "<img src = './img/swimming.png' />";
						}else{
							str = str + "<img src = './img/shooting.png' />";
						}
						str = str + "</td><td><span style = 'color : black'>"+ fcName + "</span><br><i class='fa fa-envelope'></i></td><td><span style = 'color : black'>"+fcAddress+"</span></td></tr>";
					});
					str = str+"</tbody></table>";
					$("#favKindTable").html(str);
				},
				error : function(data) {
					console.log("실패");
				}
			});
			
			$.ajax({
				url : "./userMachineRecommend.fithy",
				dataType : "json",
				success : function(data) {
					console.log("데이터 가져오기 성공");
					
					console.log(data);

					var str = "<table class='table-users table' border='0'><tbody>";

					$.each(data, function(index, item) {
						console.log("기계학습"+item.maFcName);
						
						var maFcName = "";
						var maFcAddress = "";
						var maKindCode = "";

						maFcName = maFcName + item.maFcName;
						maFcAddress = maFcAddress + item.maFcAddress;
						maKindCode = maKindCode + item.machinKindCode;
						
						str = str + "<tr><td width='10' align='center'>";
						if(maKindCode == "TE"){
							str = str + "<img src = './img/tennis-ball.png' />";
						}else if(maKindCode=="BA"){
							str = str + "<img src = './img/basketball.png' />";
						}else if(maKindCode=="BD"){
							str = str + "<img src = './img/badminton.png' />";
						}else if(maKindCode=="FO"){
							str = str + "<img src = './img/soccer1.png' />";
						}else if(maKindCode=="SW"){
							str = str + "<img src = './img/swimming.png' />";
						}else{
							str = str + "<img src = './img/shooting.png' />";
						}
						str = str + "</td><td><span style = 'color : black'>"+ maFcName + "</span><br><i class='fa fa-envelope'></i></td><td><span style = 'color : black'>"+maFcAddress+"</span></td></tr>";
	
					});
					str = str+"</tbody></table>";
					$("#machineFacility").html(str);
				},
				error : function(data) {
					console.log("실패");
				}
			});
	});
</script>
<!-- 추천 하단 고정시켜주는 css -->
<style type="text/css">
#RightBottomLayerFixed {
	position: fixed;
	right: 0;
	bottom: 0;
	z-index: 10000;
}
</style>
</head>
<body id="body">

	<div id="RightBottomLayerFixed" style="width: 100px; height: 100px; text-align: left; padding-right: 150px">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="address">
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#ordine">추천 서비스</button>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<!-- Modal -->
		<div id="ordine" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content" style="margin-top: 100px; width: 750px;" >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title"><span style = "color : black">추천</span></h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-11" style="width:720px; width: 100%;">
								<ul class="nav nav-tabs" style="width:720px">
									<li class="active"><a href="#recommendFriends" data-toggle="tab">친구 추천</a></li>
									<li><a href="#recommendFacility" data-toggle="tab">시설 추천</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="recommendFriends">
										<div class="panel panel-default user_panel">
											<div class="panel-heading">
												<h3 class="panel-title">User List</h3>
											</div>
											<div class="panel-body">
												<div class="table-container" id = "friendList">
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="recommendFacility">
										<div class="panel panel-default user_panel" >
											<div class="panel-heading">
												<h3 class="panel-title">선호 종목 시설 추천</h3>
											</div>
											<div class="panel-body">
												<div class="table-container" id = "favKindTable">
												</div>
											</div>
										</div>
										<div class="panel panel-default user_panel" >
											<div class="panel-heading">
												<h3 class="panel-title">빅데이터 기반 기계학습 시설 추천</h3>
											</div>
											<div class="panel-body">
												<div class="table-container" id = "machineFacility">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ====================================  로딩화면 -->
	<div id="loading-mask">
		<div class="loading-img">
			<img alt="Preloader" src="img/preloader.gif" />
		</div>
	</div>

	<!-- ==================================== 홈화면 슬라이드 -->
	<section id="home">
		<div id="slitSlider" class="sl-slider-wrapper">
			<div class="sl-slider">
				<!-- 첫번째 슬라이드 -->
				<div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-1"></div>
						<div class="carousel-caption">
							<div>
								<h2 data-wow-duration="500ms" data-wow-delay="500ms" class="heading animated fadeInRight">Welcome To Fithy</h2>
								<br>
							</div>
						</div>
					</div>
				</div>
				<!-- 두번째 슬라이드 -->
				<div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-2"></div>
						<div class="carousel-caption">
							<div>
								<h2 class="heading animated fadeInDown">운동시설 예약</h2>
								<h3 class="animated fadeInUp">전국의 공공 운동시설을 간단하게 예약할 수 있습니다!</h3>
								<a class="btn btn-green animated fadeInUp" href="./user/reservation.jsp">바로가기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 세번째 슬라이드 -->
				<div class="sl-slide" data-orientation="horizontal"
					data-slice1-rotation="3" data-slice2-rotation="3"
					data-slice1-scale="2" data-slice2-scale="1">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-3"></div>
						<div class="carousel-caption">
							<div>
								<h2 class="heading animated fadeInRight">맞춤 정보 제공</h2>
								<h3 class="animated fadeInLeft">회원가입으로 Fithy와 함께해요!</h3>
								<a class="btn btn-green animated fadeInUp" href="#">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 슬라이드 이동 화살표 -->
			<nav id="nav-arrows" class="nav-arrows">
				<span class="nav-arrow-prev">Previous</span> 
				<span class="nav-arrow-next">Next</span>
			</nav>
			<!-- 슬라이드 이동 버튼-->
			<nav id="nav-dots" class="nav-dots">
				<span class="nav-dot-current"></span> 
				<span></span> 
				<span></span>
			</nav>
		</div>
	</section>
	<!-- ==================================== 상단 바 -->
	<header id="navigation" class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
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
					<li class="current"><a href="#body">홈</a></li>
					<li><a href="#about">About Fithy</a></li>
					<li><a href="#services">시설조회</a></li>
					<li><a href="./board/boardList.jsp">커뮤니티</a></li>
					<li>
						<%
							String check = (String) session.getAttribute("uId");
							String faCheck = (String) session.getAttribute("faId");

							if (check == null && faCheck == null) {
								out.print("<a href='./user/loginChoice.jsp'>");
								out.print("로그인");
								out.print("</a>");
							} else if (check != null) {
								out.print("<a href='./userLogout.fithy'>");
								out.print("로그아웃");
								out.print("</a>");
							} else if (faCheck != null) {
								out.print("<a href='./faLogout.fithy'>");
								out.print("로그아웃");
								out.print("</a>");
							}
						%>
					
					<li>
						<%
							if (faCheck != null && check == null) {
								out.print("<a href='./user/faPage.jsp'>마이페이지</a>");
							} else if (check != null && faCheck == null) {
								out.print("<a href='./user/userPage.jsp'>마이페이지</a>");
							}
						%>
					</li>
					<li>
						<%
							String faName = (String) session.getAttribute("faName");
							String faId = (String) session.getAttribute("faId");
							String uName = (String) session.getAttribute("uName");
							String uId = (String) session.getAttribute("uId");

							if ((faName != null && faId != null)) {
								out.print(faName + "님 환영합니다!");
							} else if (uName != null && uId != null) {
								out.print(uName + "님 환영합니다!");
							}
						%>
					</li>
				</ul>
			</nav>
		</div>
	</header>

	<!--
		Start About Section
		==================================== -->
	<section id="about" class="bg-one">
		<div class="container">
			<div class="row">

				<!-- section title -->
				<div class="title text-center wow fadeIn" data-wow-duration="1500ms">
					<h2>
						운동을 <span class="color">간편</span>하게 하는 방법
					</h2>
					<div class="border"></div>
					<br>
					<p>운동시설을 간편하게 예약하세요!</p>
				</div>
				<!-- /section title -->

				<!-- About item -->
				<div class="col-md-4 text-center wow fadeInUp"
					data-wow-duration="500ms">
					<div class="wrap-about">
						<div class="icon-box">
							<i class="fa fa-users fa-4x"></i>
						</div>
						<!-- Express About Yourself -->
						<div class="about-content text-center">
							<h3 class="ddd">함께하는 운동</h3>
							<p>같은 운동을 좋아하는 사람들과 함께하기</p>
						</div>
					</div>
				</div>
				<!-- End About item -->

				<!-- About item -->
				<div class="col-md-4 text-center wow fadeInUp"
					data-wow-duration="500ms" data-wow-delay="250ms">
					<div class="wrap-about">
						<div class="icon-box">
							<i class="fa fa-check-circle-o fa-4x"></i>
						</div>
						<!-- Express About Yourself -->
						<div class="about-content text-center">
							<h3>
								<a href="./user/reservation.jsp" id="ta_usps_bookingguarantee"
									target="_blank" rel="noopener noreferrer">간편한 예약</a>
							</h3>
							<p>
								<a href="./user/reservation.jsp" id="ta_usps_bookingguarantee"
									target="_blank" rel="noopener noreferrer">예약하러가기</a>
							</p>
						</div>
					</div>
				</div>
				<!-- End About item -->

				<!-- About item -->
				<div class="col-md-4 text-center wow fadeInUp"
					data-wow-duration="500ms" data-wow-delay="500ms">
					<div class="wrap-about kill-margin-bottom">
						<div class="icon-box">
							<i class="fa fa-thumbs-up fa-4x"></i>
						</div>
						<!-- Express About Yourself -->
						<div class="about-content text-center">
							<h3>내가 좋아하는 운동시설</h3>
							<p>내게 맞는 운동시설 추천</p>
						</div>
					</div>
				</div>
				<!-- End About item -->

			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</section>
	<!-- End section -->



	<!-- ==================================== 종목별 시설조회 -->
	<section id="services" class="bg-one">
		<div class="container">
			<div class="row">

				<!-- section title -->
				<div class="title text-center wow fadeIn animated"
					data-wow-duration="500ms"
					style="visibility: visible; animation-duration: 500ms; animation-name: fadeIn;">
					<h2>
						시설 종목 <span class="color">조회</span>
					</h2>
					<div class="border"></div>
				</div>
				<!-- /section title -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInUp animated"
					data-wow-duration="500ms"
					style="visibility: visible; animation-duration: 500ms; animation-name: fadeInUp;">
					<div class="service-block text-center">
						<div class="service-icon text-center">
							<img src="./img/icon/tennis.png">
						</div>
						<h3>테니스</h3>
						<p>Tennis</p>
					</div>
				</article>
				<!-- End Single Service Item -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInUp animated"
					data-wow-duration="500ms" data-wow-delay="200ms"
					style="visibility: visible; animation-duration: 500ms; animation-delay: 200ms; animation-name: fadeInUp;">
					<div class="service-block text-center">
						<div class="service-icon text-center">
							<img src="./img/icon/swim_icon.png">
						</div>
						<h3>수영</h3>
						<p>Swimming</p>
					</div>
				</article>
				<!-- End Single Service Item -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInUp animated"
					data-wow-duration="500ms" data-wow-delay="400ms"
					style="visibility: visible; animation-duration: 500ms; animation-delay: 400ms; animation-name: fadeInUp;">
					<div class="service-block text-center">
						<div class="service-icon text-center">
							<img src="./img/icon/soccer.png">
						</div>
						<h3>풋살</h3>
						<p>Football</p>
					</div>
				</article>
				<!-- End Single Service Item -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay="200ms"
					style="visibility: visible; animation-duration: 500ms; animation-delay: 200ms; animation-name: fadeInDown;">
					<div class="service-block text-center">
						<div class="service-icon text-center">
							<img src="./img/icon/basketball.png">
						</div>
						<h3>농구</h3>
						<p>Basketball</p>
					</div>
				</article>
				<!-- End Single Service Item -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay="400ms"
					style="visibility: visible; animation-duration: 500ms; animation-delay: 400ms; animation-name: fadeInDown;">
					<div class="service-block text-center">
						<div class="service-icon text-center">
							<img src="./img/icon/shooting.png">
						</div>
						<h3>사격</h3>
						<p>Shooting</p>
					</div>
				</article>
				<!-- End Single Service Item -->

				<!-- Single Service Item -->
				<article class="col-md-4 col-sm-6 col-xs-12 wow fadeInDown animated"
					data-wow-duration="500ms" data-wow-delay="600ms"
					style="visibility: visible; animation-duration: 500ms; animation-delay: 600ms; animation-name: fadeInDown;">
					<div class="service-block text-center kill-margin-bottom">
						<div class="service-icon text-center">
							<img src="./img/icon/badminton.png">
						</div>
						<h3>배드민턴</h3>
						<p>Badminton</p>
					</div>
				</article>
				<!-- End Single Service Item -->
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</section>

	<!-- ==================================== 커뮤니티 -->

	<section id="blog" class="bg-one">
		<div class="container">
			<div class="row">
				<!-- section title -->
				<div class="title text-center wow fadeInDown">
					<h2>
						Latest <span class="color">Posts</span>
					</h2>
					<div class="border"></div>
				</div>
				<!-- /section title -->
				<div class="clearfix">
					<!-- single blog post -->
					<article class="col-md-3 col-sm-6 col-xs-12 clearfix wow fadeInUp"
						data-wow-duration="500ms">
						<div class="note">
							<div class="media-wrapper">
								<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
							</div>

							<div class="excerpt">
								<h3>Simple Image Post</h3>
								<p>Anim pariatur cliche reprehenderit, enim eiusmod high
									life accusamus terry richardson ad squid. 3 wolf moon officia
									aute, non skateboard dolor brunch.</p>
								<a class="btn btn-transparent" href="single-post.html">Read more</a>
							</div>
						</div>
					</article>
					<!-- /single blog post -->

					<!-- single blog post -->
					<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp"
						data-wow-duration="500ms" data-wow-delay="200ms">
						<div class="note">
							<div id="gallery-post" class="media-wrapper">
								<div class="item">
									<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
								</div>
								<div class="item">
									<img src="img/blog/bicycle.jpg" alt="Flying bicycle" class="img-responsive">
								</div>
								<div class="item">
									<img src="img/blog/3D-beach-art.jpg" alt="3D Beach Art | Meghna" class="img-responsive">
								</div>
							</div>

							<div class="excerpt">
								<h3>Simple Slider Post</h3>
								<p>Anim pariatur cliche reprehenderit, enim eiusmod high
									life accusamus terry richardson ad squid. 3 wolf moon officia
									aute, non skateboard dolor brunch.</p>
								<a class="btn btn-transparent" href="single-post.html">Read more</a>
							</div>
						</div>
					</article>
					<!-- end single blog post -->
					<!-- single blog post -->
					<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp"
						data-wow-duration="500ms" data-wow-delay="400ms">
						<div class="note">
							<div class="media-wrapper">
								<img src="img/blog/amazing-caves-coverimage.jpg"
									alt="amazing caves coverimage" class="img-responsive">
							</div>
							<div class="excerpt">
								<h3>Simple Image Post</h3>
								<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia
								aute, non skateboard dolor brunch.</p>
								<a class="btn btn-transparent" href="single-post.html">Read more</a>
							</div>
						</div>
					</article>
					<!-- end single blog post -->

					<!-- single blog post -->
					<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp"
						data-wow-duration="500ms" data-wow-delay="600ms">
						<div class="note kill-margin-bottom">
							<div class="media-wrapper">
								<img src="img/blog/amazing-caves-coverimage.jpg"
									alt="amazing caves coverimage" class="img-responsive">
							</div>
							<div class="excerpt">
								<h3>Simple Image Post</h3>
								<p>
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia
								aute, non skateboard dolor brunch.
								</p>
								<a class="btn btn-transparent" href="single-post.html">Read more</a>
							</div>
						</div>
					</article>
					<!-- end single blog post -->
				</div>

				<div class="all-post text-center">
					<a class="btn btn-transparent" href="./board/boardList.jsp">View All Post</a>
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
										<div class="col-lg-12">
											<!-- copyright -->
											<div class="copyright text-center">
												<a href="index.html"> <img src="./img/logo_fithy.png"
													alt="Meghna" />
												</a> <br />

												<p>
													Design And Developed by <a
														href="http://www.themefisher.com"> Themefisher Team</a>.
													Copyright &amp;copy; 2015. All Rights Reserved.
												</p>
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

							<!-- Essential Scripts =====================================-->

							<!-- Main jQuery -->
							<script src="js/jquery-1.11.0.min.js"></script>
							<!-- Bootstrap 3.1 -->
							<script src="js/bootstrap.min.js"></script>
							<!-- Slitslider -->
							<script src="js/jquery.slitslider.js"></script>
							<script src="js/jquery.ba-cond.min.js"></script>
							<!-- Parallax -->
							<script src="js/jquery.parallax-1.1.3.js"></script>
							<!-- Owl Carousel -->
							<script src="js/owl.carousel.min.js"></script>
							<!-- Portfolio Filtering -->
							<script src="js/jquery.mixitup.min.js"></script>
							<!-- Custom Scrollbar -->
							<script src="js/jquery.nicescroll.min.js"></script>
							<!-- Jappear js -->
							<script src="js/jquery.appear.js"></script>
							<!-- Pie Chart -->
							<script src="js/easyPieChart.js"></script>
							<!-- jQuery Easing -->
							<script src="js/jquery.easing-1.3.pack.js"></script>
							<!-- tweetie.min -->
							<script src="js/tweetie.min.js"></script>
							<!-- Google Map API -->
							<script type="text/javascript"
								src="http://maps.google.com/maps/api/js?sensor=false"></script>
							<!-- Highlight menu item -->
							<script src="js/jquery.nav.js"></script>
							<!-- Sticky Nav -->
							<script src="js/jquery.sticky.js"></script>
							<!-- Number Counter Script -->
							<script src="js/jquery.countTo.js"></script>
							<!-- wow.min Script -->
							<script src="js/wow.min.js"></script>
							<!-- For video responsive -->
							<script src="js/jquery.fitvids.js"></script>
							<!-- Grid js -->
							<script src="js/grid.js"></script>
							<!-- Custom js -->
							<script src="js/custom.js"></script>

							<!-- 	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
							<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
							<!-- 	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

</body>
</html>