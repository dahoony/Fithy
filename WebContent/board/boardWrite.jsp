<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<META name="Descript-xion" content="체육시설을 조회 및 예약하는 사이트입니다.">

<title>게시글 작성</title>

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
<link rel="stylesheet" href="css/board.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">

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


</head>



<body id="blog-page">
	<!-- ====================================  로딩화면 -->
	<div id="loading-mask">
		<div class="loading-img">
			<img alt="Preloader" src="../img/preloader.gif" />
		</div>
	</div>
	  <!-- ==================================== 고정 상단 바(이름 수정) -->
	<header id="navigation" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
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
						<h2> 게시글 <span class="color">작성</span>
						</h2>
						<div class="border"></div>
					</div>
				</section>
				
				
				
	                <div class="comment-reply-form">
                         <form id="comment-form" action="../boardWrite.fithy" method="post" >
                             <div class="form-group">
                                <input type="text" style = "width : 100%" placeholder="제목 *" id="bTitle" name=bTitle required>
                             </div>
                             <!-- End .form-group -->
                             <div class="form-group">
                                 <textarea style = "width : 100%" placeholder="내용 *" id="bContent" name="bContent" rows="10" cols="10" required></textarea>
                             </div>
                             <!-- End .form-group -->
                             
                             <div class="form-group">
                      	        <input type="submit" id="post-comment" value="작성하기" class="btn btn-transparent pull-left">
                  		   		<a class="btn btn-transparent pull-right" href="../board/boardList.jsp">돌아가기</a>
                             </div>
                             <!-- End .form-group -->
     
                         </form>
                     </div>
                     <!-- End Single Post -->
		</div>
	</div>
</section>
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
	<script src="../js/board.js"></script>



		<!-- ========================================== 하단 부분-->

		<footer id="footer" class="bg-one">
			<div class="container">
			    <div class="row wow fadeInUp animated" data-wow-duration="500ms" style="visibility: visible; animation-duration: 500ms; animation-name: fadeInUp;">
					<div class="col-lg-12">
						
						<!-- copyright -->
						<div class="copyright text-center">
							<a href="../index.jsp"> <img src="../img/logo_fithy.png"
							alt="Fithy" />
						</a> <br />
							<p>Copyright © 2014. All Rights Reserved.</p>
						</div>
						<!-- /copyright -->
						
					</div> <!-- end col lg 12 -->
				</div> <!-- end row -->
			</div> <!-- end container -->
		</footer> <!-- end footer -->


	<!-- Back to Top
		============================== -->
	<a href="javascript:;" id="scrollUp"> <i class="fa fa-angle-up fa-2x"></i></a>

	<!-- 
		Essential Scripts
		=====================================-->

	<!-- Main jQuery -->
	<script src="../js/jquery-1.11.0.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Back to Top -->
	<script src="../js/jquery.scrollUp.min.js"></script>
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