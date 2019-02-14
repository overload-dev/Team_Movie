<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center><h2>찾으시는 아이디는 " ${findId} " 입니다.</h2>
	<h3><a href="userLogin.tm?usid=${findId }">바로 로그인 하시겠습니까?</a></h3>
	<h3><a href="#">비밀번호를 잊으셨습니까?</a></h3> </center>
</body>
</html>