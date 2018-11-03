<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 선택</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/loginchoice.css">
<script src="../js/jquery-3.2.1.js"></script>
<style>h1 {color:#5d586f}</style>
</head>
<body background="../img/bg.png">
<br><br><br><br><br><br><br>
<div align="center"><h1><b>로그인 유형을 선택해주세요</b></h1></div>
	<div class="wrap">
		<a href="./login.jsp" class="button" id="user">&nbsp;&nbsp;회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;</a> 
		<a href='./faLogin.jsp' class="button" id="admin">&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;설&nbsp;&nbsp;</a>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/login.js"></script>
</body>
</html>