<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">
<link rel="stylesheet" href="../css/login.css">
<script src="../js/jquery-3.2.1.js"></script>
<!-- 한페이지에서 아이디 중복 체크를 하기 위한 ajax함수----------------------------------- -->
<script>
	$(function() {
		$("#faIdCheck").click(function() {

			$.ajax({
				url : "../faIdCheck.fithy",
				data : {
					"faId" : $("#faCheckId").val()
				},
				dataType : "text",
				success : function(data) {
					if (data == 0)
						$("#msg").html("중복된 아이디입니다.");
					else {
						$("#msg").html("사용가능한 아이디입니다.");
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
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel" align="center">반갑습니다</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8"
							style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#Login" data-toggle="tab">로그인</a></li>
								<li><a href="#Registration" data-toggle="tab">회원가입</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="Login">
									<form role="form" class="form-horizontal"
										action="../faLogin.fithy" method="post">
										<div class="form-group">
											<label for="faId" class="col-sm-2 control-label"> ID</label>
											<div class="col-sm-10">
												<input type="text" name="faId" id="faId" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="faPw" class="col-sm-2 control-label">PASSWORD</label>
											<div class="col-sm-10">
												<input type="password" name="faPw" id="faPw"
													class="form-control">
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
										action="../faRegister.fithy" method="post">
										<div class="form-group">
											<label for="faId" class="col-sm-2 control-label"> ID</label>
											<div class="col-sm-10">
												<div class="row">
													<div class="col-md-9">
														<input type="text" class="form-control" name="faCheckId" id="faCheckId">
														<input type="button" value="중복확인" id="faIdCheck" class="btn btn-primary btn-sm">
														<span id="msg"></span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="faPw" class="col-sm-2 control-label">
												Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="faPw" id="faPw" />
											</div>
										</div>
										<div class="form-group">
											<label for="faName" class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="faName" id="faName" />
											</div>
										</div>
										<div class="form-group">
											<label for="faNum" class="col-sm-2 control-label">Mobile</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="faNum" id="faNum" />
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>
</body>
</html>