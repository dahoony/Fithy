<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- CSS ================================================== -->
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

<!-- Google Font =========================== -->

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

<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../css/style.css">


<!-- Modernizer Script for old Browsers -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<script src="../js/jquery-3.2.1.js"></script>

<!-- 예약 시간을 확인하는 것을 한페이지에 모두 표현해주기 위해 ajax 사용 -->
<script>
	$(function() {

		$("#cityCheck").click(function() {//데이터베이스에 등록되어있는 시설 이름 리스트 반환하는 용도
			$.ajax({
				url : "../reservationCity.fithy",
				dataType : "json",
				data : {
					"cityName" : $("#cityName").val()
				},
				success : function(data) {
					var str = "<option value='' selected>-- 시설 선택 --</option>";
					$.each(data, function(index, item) {
						console.log(item.fname);
						str = str + "<option value='"+item.fname+"'>";
						str = str + item.fname;
						str = str + "</option>";
					});
					$("#fcName").html(str);
				},
				error : function() {
					console.log("error");
				}
			});
		});

		$("#check").click(function() {//예약 조회 눌렀을 때 가능한지 여부 출력하는 ajax
			alert("조회");
			$.ajax({
				url : "../reservationCheck.fithy",
				data : {
					"date" : $("#date").val(),
					"fcName" : $("#fcName").val(),
					"kindcode" : $("#kindcode").val()
				},
				dataType : "json",
				success : function(data) {
					console.log("success");
					console.log(data);
					var str ="";
					
					if(data == ""){
						str = "예약 가능 <input type='radio' id='times' name='times' value='09:00'>";
						$("#nine").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='10:00'>";
						$("#ten").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='11:00'>";
						$("#eleven").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='12:00'>";
						$("#tweleve").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='13:00'>";
						$("#one").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='14:00'>";
						$("#two").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='15:00'>";
						$("#three").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='16:00'>";
						$("#four").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='17:00'>";
						$("#five").html(str);
						str = "예약 가능 <input type='radio' id='times' name='times' value='18:00'>";
						$("#six").html(str);
					}
					
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "09:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#nine").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='09:00'>";
							$("#nine").html(str);
						}
					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "10:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#ten").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='10:00'>";
							$("#ten").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "11:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#eleven").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='11:00'>";
							$("#eleven").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "12:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#tweleve").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='12:00'>";
							$("#tweleve").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "13:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#one").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='13:00'>";
							$("#one").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "14:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#two").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='14:00'>";
							$("#two").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "15:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#three").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='15:00'>";
							$("#three").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "16:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#four").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='16:00'>";
							$("#four").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "17:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#five").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='17:00'>";
							$("#five").html(str);
						}

					});
					$.each(data,function(index,item){
						console.log(item.time);
						
						if(item.time == "18:00"){
							str = "<h5 style='color:red'>예약 불가</h5>";
							$("#six").html(str);
							return false;
						}else {
							str = "예약 가능 <input type='radio' id='times' name='times' value='18:00'>";
							$("#six").html(str);
						}
					});
				},
				error : function() {
					console.log("error");
				}
			});
		});
		
		$("#add").click(function(){
			$.ajax({
				url : "../reservationAdd.fithy",
				dataType : "json",
				data : {
					"fcName" : $("#fcName").val(),
					"kindcode" : $("#kindcode").val(),
					"date" : $("#date").val(),
					"times" : $("#times").val()
				},
				success : function(data) {
					alert("성공")
					if(data == 1){
						alert("예약 완료 되었습니다.");
					}else{
						alert("예약이 되지않았습니다.");
					}
				},
				error : function() {
					console.log("error");
					alert("에러입니다.");
				}
			});
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
					<li><a href="./reservation.jsp">예약페이지</a></li>
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
						<h2> 예약 <span class="color">정보</span></h2>
						<div class="border"></div>
					</div>
				</section>
				<div class="clearfix">
					<fieldset>
						<legend>예약</legend>
						<form method="post" action="../reservationAdd.fithy">
							<select name="cityName" size="1" id="cityName">
								<option value="" selected>-- 도시 선택 -- </option>
								<option value="서울"> 서울특별시 </option>
								<option value="인천"> 인천광역시 </option>
								<option value="대전"> 대전광역시 </option>
								<option value="대구"> 대구광역시 </option>
								<option value="울산"> 울산광역시 </option>
								<option value="부산"> 부산광역시 </option>
								<option value="광주"> 광주광역시 </option>
								<option value="경기"> 경기도 </option>
								<option value="경북"> 경상북도 </option>
								<option value="경남"> 경상남도 </option>
								<option value="전북"> 전라북도 </option>
								<option value="전남"> 전라남도 </option>
								<option value="강원"> 강원도 </option>
								<option value="제주"> 제주 </option>
							</select> <input type="button" value="지역 조회" id="cityCheck"
								class="btn btn-primary btn-sm">
						</form>
						<form method="post" action="../reservationAdd.fithy">
							<select name="fcName" size="1" id="fcName">

							</select> 
							<input type="date" name="date" value="날짜" id="date"> 
							<select name="kindcode" size="1" id="kindcode">
								<option value="" selected> -- 종목 선택 -- </option>
								<option value="FO"> 풋살 </option>
								<option value="TE">테니스</option>
								<option value="BD">배드민턴</option>
								<option value="SW">수영</option>
								<option value="SH">사격</option>
								<option value="BA">농구</option>
							</select> 
							<input type="button" value="예약 조회" id="check" class="btn btn-primary btn-sm"> 
							<table class="table table-striped"><!-- 시간당 예약 조회 테이블 -->
								<thead>
									<tr class="row-name">
										<th style="width: 10%">예약시간</th>
										<th style="width: 10%">예약확인</th>
										<th style="width: 10%">예약시간</th>
										<th style="width: 10%">예약확인</th>
									</tr>
								</thead>
								<tbody>
									<tr class="row-content">
										<td id="time9"><label>09:00</label></td>
										<td><span id="nine"></span></td>
										<td id="time14"><label>14:00</label></td>
										<td><span id="two"></span></td>
									</tr>
									<tr class="row-content">
										<td id="time10"><label>10:00</label></td>
										<td><span id="ten"></span></td>
										<td id="time15"><label>15:00</label></td>
										<td><span id="three"></span></td>
									</tr>
									<tr class="row-content">
										<td id="time11"><label>11:00</label></td>
										<td><span id="eleven"></span></td>
										<td id="time16"><label>16:00</label></td>
										<td><span id="four"></span></td>
									</tr>
									<tr class="row-content">
										<td id="time12"><label>12:00</label></td>
										<td><span id="tweleve"></span></td>
										<td id="time17"><label>17:00</label></td>
										<td><span id="five"></span></td>
									</tr>
									<tr class="row-content">
										<td id="time13"><label>13:00</label></td>
										<td><span id="one"></span></td>
										<td id="time18"><label>18:00</label></td>
										<td><span id="six"></span></td>
									</tr>
								</tbody>
							</table>
							<input type="button" value="예약 추가" id="add" class="btn btn-primary btn-sm"> 
						</form>
					</fieldset>
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
					<div class="copyright text-center">
						<a href="../index.jsp"> <img src="../img/logo-meghna.png" alt="Fithy" />
						</a> <br />
						<p>Design And Developed by 
						<a href="http://www.themefisher.com"> Themefisher Team</a>
						. Copyright &copy; 2015. All Rights Reserved.
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

	<!-- Back to Top
		============================== -->
	<a href="javascript:;" id="scrollUp"> <i class="fa fa-angle-up fa-2x"></i></a>

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