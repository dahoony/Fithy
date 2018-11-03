<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 완료</title>
</head>
<body>
	<%
	String faName = (String) session.getAttribute("faName");
	String faId = (String) session.getAttribute("faId");
	
	if(faName != null || faId != null){
		out.print(faName + "(" + faId + ")님 환영합니다!");
	}
	else{
		response.sendRedirect("faLogin.jsp");
	}
	%>
</body>
</html>