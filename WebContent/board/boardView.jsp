<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<META name="Descript-xion" content="체육시설을 조회 및 예약하는 사이트입니다.">

<title>상세 게시판 & 댓글</title>

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
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/media-queries.css">
<link rel="stylesheet" href="../css/board.css">

<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/detail.css">

<!-- Google Font
		=========================== -->
	<!-- Titillium Web -->
	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,200' rel='stylesheet' type='text/css'>
	<!-- Source Sans Pro -->
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300' rel='stylesheet' type='text/css'>
	<!-- Oswald / Title Font -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
	<!-- Ubuntu / Body Font -->
	<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300' rel='stylesheet' type='text/css'>



<!-- Modernizer Script for old Browsers -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<script src="../js/jquery-3.2.1.js"></script>




<!-- 수정!!!! -->
<script>
$(function(){
	
	// 댓글 쓰기------------------
	$("#write").click(function(){
		alert("입력")
		$.ajax({
			url : "../writecomments.kdata",
			data : {"usCode": $("#usCode").val(), "comment": $("#comment").val(), "num":1},
			dataType :"json", 
			success : function(data) {
				//console.log(data)
				var str = "<table>";
				$.each(data, function(index, item){
					//console.log(index);
					console.log(item.usCode);
					
					str = str + "<tr>";
					str = str + "<td>" + item.usCode + "</td>";
					str = str + "<td>" + item.comment + "</td>";
//					str = str + "<td><input type = 'button' value='x' id='delete'>com='"+item.commentNum+"'></td>"
					str = str + "</tr>";
				});
				
				str = str + "</table>"
				
				$("#list").html(str);
				
			},
			error : function() {
				console.log("error");
			}
		});
	});
/* 	
	// 댓글 삭제------------------
	$("#list").on("click", "#delete", function(){		//동작에 함수를 걸때는 2가지 방법 중 반드시 on을 이용하여야 한다.
		alert("해당 댓글을 삭제하시겠습니까?")
		//console.log($(this).parent().find("td"));
		$.ajax({
			url : "deletecomments.kdata",
			data : {"commentsNum" : $(this).val()},
			success : function(data) {
				console.log("sss");
			},
			error : function() {
				console.log("ggg");
			}
		});
	});
*/	
});
	
</script>
</head>



<body class="blog-page">
	<!-- ====================================  로딩화면 -->
	<div id="loading-mask">
		<div class="loading-img">
			<img alt="Preloader" src="../img/preloader.gif" />
		</div>
	</div>
	  <!-- ==================================== 고정 상단 바(이름 수정) -->
	<header class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">


				<!-- 메인 아이콘 -->
				<a class="navbar-brand" href="../index.jsp">
					<h1 id="logo">
						<span class="color"> Fi</span>tness + heal<span class="color">thy</span>
					</h1>
				</a>
			</div>

			<!-- 메뉴 -->
			<nav class="collapse navbar-collapse navbar-right">
				<ul id="nav" class="nav navbar-nav">
					<li class="current"><a href="../index.jsp">홈</a></li>

				</ul>
			</nav>
		</div>
	</header>



       <!-- ==================================== 커뮤니티 배너 -->
        <section id="blog-banner" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                       
                        <div class="blog-icon">
                            <i class="fa fa-book fa-4x"></i>
                        </div>
                        <div class="blog-title">
                            <h1><b><span class="color">커뮤니티</span></b></h1>
                        </div>
                        
					</div>     <!-- End col-lg-12 -->
				</div>	    <!-- End row -->
			</div>       <!-- End container -->
		</section>		<!-- End Section -->
        
        
	<!-- ==================================== 커뮤니티 -->

        <section id="blog-page">
            <div class="container">
                <div class="row">
                   
                    <div id="blog-posts" class="col-md-12 col-sm-12">
                        <div class="post-item">
                           
                        
                           <!-- Single Post -->
                            <article class="entry wow fadeInDown"  data-wow-duration="1000ms" data-wow-delay="300ms">                               
								<div class="post-excerpt text-center">
									<h3><span class="color">아이유는 사랑입니다</span></h3>
									<br><br><br>
									
									<p>봄 사랑 벚꽃 말고</p>

									<p>이런 엔딩</p>

								</div>
								
								<div class="post-meta">
									<!-- 게시글 날짜 sysdate-->
									<span class="post-date">
										<i class="fa fa-calendar"></i>30 jun 2014
									</span>
									
									<!-- 댓글 갯수 count -->
									<span class="comments">
										<i class="fa fa-comments"></i>18 Comments
									</span>

									<!-- 작성자 아이디 -->
									<span class="author">
										<i class="fa fa-user"></i>Admin
									</span>
									
								</div>
                            </article>
                            <!-- End Single Post -->

							
<!-- 이전/다음 게시글 이동====================================
                            <div class="next-prev clearfix">
                                <a href="" class="prev-post">
                                    <i class="fa fa-angle-left fa-2x"></i>Previous Post
                                </a>
                                <a href="" class="next-post pull-right">
                                    Next Post<i class="fa fa-angle-right fa-2x"></i>
                                </a>
                            </div>
 -->                            
                            
                            
                          <!-- ==================================== 댓글 확인 --> 
                            <div id="comments" class="comments-section">
                                <h4>3 Comments</h4>
                                <ol class="comment-list">
                                    <li id="comment-1">
                                        <div class="comment-wrap">
                                            <div class="author-comment">
                                                <cite class="pull-left"><a href="#">Smithson</a></cite>
                                                <a href="" class="replay pull-right">Replay</a>
                                                <div style="clear:both"></div>
                                                <div class="comment-meta">
                                                    <i class="fa fa-calendar"></i> 26 aug 2013 at 07:30 PM 
                                                </div>
                                            </div>
                                            <div class="comment-content">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, repellendus. Culpa nam aut vel. Ab, excepturi minus, quasi debitis quaerat animi, enim quod repellat minima dolores facere veniam quam quo!</p>
                                            </div>
                                        </div>
                                        <ul>
                                            <li id="comment-2">
                                                <div class="comment-wrap">
                                                    <div class="author-comment">
                                                        <cite class="pull-left"><a href="#">Smithson</a></cite>
                                                        <a href="" class="replay pull-right">Replay</a>
                                                        <div style="clear:both"></div>
                                                        <div class="comment-meta">
                                                            <i class="fa fa-calendar"></i> 26 aug 2013 at 07:30 PM 
                                                        </div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, repellendus. Culpa nam aut vel. Ab, excepturi minus, quasi debitis quaerat animi, enim quod repellat minima dolores facere veniam quam quo!</p>
                                                    </div>
                                                </div>
                                            </li>
                                           
                                        </ul>
                                        <div class="comment-wrap">
                                            <div class="author-comment">
                                                <cite class="pull-left"><a href="#">Smithson</a></cite>
                                                <a href="" class="replay pull-right">Replay</a>
                                                <div style="clear:both"></div>
                                                <div class="comment-meta">
                                                    <i class="fa fa-calendar"></i> 26 aug 2013 at 07:30 PM 
                                                </div>
                                            </div>
                                            <div class="comment-content">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, repellendus. Culpa nam aut vel. Ab, excepturi minus, quasi debitis quaerat animi, enim quod repellat minima dolores facere veniam quam quo!</p>
                                            </div>
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            
                            
                            
                            <!-- ==================================== 댓글 쓰기 --> 
                            <div class="comment-reply-form">
                               <h3>댓글 <span class="color">작성</span></h3>
                                <form id="comment-form" method="post" action="#">
                                    <div class="form-group">
                              		  <input type="text" class="form-control" placeholder="ID *" id="usCode" name="usCode" required>
                   		 	        </div>
                        	    <!-- End .form-group -->
                                   <div class="form-group">
                               		  <textarea class="form-control" placeholder="내용 *" id="comment" name="comment" rows="5" cols="5" required></textarea>
                            		</div>
                            	<!-- End .form-group -->

                                    <div class="form-group">
                                        <input type="submit" id="write" value="작성하기" class="btn btn-transparent">
                                    </div>
                                    <!-- End .form-group -->
                                </form>
                            </div>
                            <!-- End Single Post -->

                        </div>
                    </div>
				</div>	    <!-- End row -->
			</div>       <!-- End container -->
		</section>    <!-- End Section -->






		<!-- ========================================== 하단 부분-->

		<footer id="footer" class="bg-one">
			<div class="container">
			    <div class="row wow fadeInUp animated" data-wow-duration="500ms" style="visibility: visible; animation-duration: 500ms; animation-name: fadeInUp;">
					<div class="col-lg-12">
						
						<!-- copyright -->
						<div class="copyright text-center">
							<a href="../index.jsp"> <img src="../img/logo_fithy.png" alt="Fithy" />
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


	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
	<script src="../js/board.js"></script>


	<!-- 	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<!-- 	<script -->
	<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<!-- 	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>
</body>
</html>