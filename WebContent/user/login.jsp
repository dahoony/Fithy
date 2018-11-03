<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 로그인</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">
<link rel="stylesheet" href="../css/login.css">
<script src="../js/jquery-3.2.1.js"></script>
<!-- 사용자 회원가입에서 아이디 중복 체크를 한페이지에 해주기 위해 사용된 ajax -->
<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();

		$("#idCheck").click(function() {
			$.ajax({
				url : "../userIdCheck.fithy",
				data : {
					"userId" : $("#userCheckId").val()
				},
				dataType : "text",
				success : function(data) {
					console.log("성공");
					if (data == 0) {
						$("#msg").html("중복된 아이디입니다.");
					} else {
						$("#msg").html("사용가능합니다.");
					}
				},
				error : function() {
					console.log("error");
				}
			});
		});
	});
</script>
</head>
<body background="../img/bg.png">
	<div>
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel" align="center">반갑습니다</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-11">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#Login" data-toggle="tab">로그인</a></li>
								<li><a href="#Registration" data-toggle="tab">회원가입</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="Login">
									<form role="form" class="form-horizontal"
										action="../userLogin.fithy" method="post">
										<div class="form-group">
											<label for="userId" class="col-sm-2 control-label">ID</label>
											<div class="col-sm-10">
												<input type="text" name="userId" id="userId" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="userPw" class="col-sm-2 control-label">PASSWORD</label>
											<div class="col-sm-10">
												<input type="password" name="userPw" id="userPw" class="form-control">
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10" align="right">
												<button type="submit" class="btn btn-primary btn-sm">로그인</button>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane" id="Registration">
									<form role="form" class="form-horizontal"
										action="../userRegister.fithy" method="post">
										<div class="form-group">
											<label for="userId" class="col-sm-2 control-label">ID</label>
											<div class="col-sm-10">
														<input type="text" class="form-control" name="userCheckId" id="userCheckId"> 
														<span><input type="button" value="중복확인" id="idCheck" class="btn btn-primary btn-sm"></span>
														<span id="msg"></span>
											</div>
										</div>
										<div class="form-group">
											<label for="userPw" class="col-sm-2 control-label"> Password </label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="userPw" id="userPw" />
											</div>
										</div>
										<div class="form-group">
											<label for="userName" class="col-sm-2 control-label"> Name </label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="userName" id="userName" />
											</div>
										</div>
										<div class="form-group">
											<label for="userGender" class="col-sm-2 control-label"> Gender </label>
											<div class="col-sm-10">
												<input type="radio" name="userGender" checked value="m" id="userGender" checked>남자<input type="radio" name="userGender" checked value="f" id="userGender">여자
											</div>
										</div>
										<div class="form-group">
											<label for="userJob" class="col-sm-2 control-label"> Job </label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="userJob" id="userJob" />
											</div>
										</div>
										<div class="form-group">
											<label for="birthDate" class="col-sm-2 control-label"> BirthDay </label>
											<div class="col-sm-10">
												<input type="date" name="birthDate" value="날짜" id="birthDate">
											</div>
										</div>
										<div class="form-group">
											<label for="userPhoneNum" class="col-sm-2 control-label"> Mobile </label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="userPhoneNum" id="userPhoneNum" />
											</div>
										</div>
										<div class="form-group">
											<label for="userPostNumber" class="col-sm-2 control-label"> PostNumber </label>
											<div class="col-sm-10">
												<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
												<input type="text" name="userPostNumber" class="postcodify_postcode5" /> 
												<input type="button" id="postcodify_search_button" value="검색" class="btn btn-primary btn-sm">
											</div>
										</div>
										<div class="form-group">
											<label for="userAddress" class="col-sm-2 control-label"> Address </label>
											<div class="col-sm-10">
												<input type="text" name="userAddress" class="postcodify_address" />
											</div>
										</div>
										<div class="form-group">
											<label for="userDetailAddress" class="col-sm-2 control-label"> DetailAddress </label>
											<div class="col-sm-10">
												<input type="text" name="userDetailAddress" class="postcodify_details" />
											</div>
										</div>
										<div class="form-group">
											<label for="userFavoriteKind" class="col-sm-2 control-label"> FavoriteKind </label>
											<div class="col-sm-10">
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="테니스" checked>테니스 
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="풋살">풋살
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="배드민턴">배드민턴 
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="수영">수영
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="사격">사격 
												<input type="checkbox" name="favoriteKind" id="favoriteKind" value="농구">농구
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10" align="right">
												<input type="submit" value="회원가입" class="btn btn-primary btn-sm">
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
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>