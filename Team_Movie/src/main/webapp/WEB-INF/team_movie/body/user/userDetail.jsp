<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 

<div class="container">
	<div class="col-md-9"> 
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading"> <h4 >회원개인정보</h4></div>
				<div class="panel-body">
                    <div class="col-md-8 col-xs-8 col-sm-6 col-lg-10" >
						<div class="container" > 
							<h3><b>${sessionScope.uname}</b> 님의 정보</h3>  
                    	</div>
                    <br>
                    <table class="table">
                    	<tr>
                    		<td width="20%">아이디</td>
                    		<td>${userInfo.usid }</td>
                    	</tr>
                    	<tr>
                    		<td>이름</td>
                    		<td>${userInfo.uname }</td>
                    	</tr>
                    	<tr>
                    		<td>생년월일</td>
                    		<td>${userInfo.ubirth }</td>
                    	</tr>
                    	<tr>
                    		<td>선호장르</td>
                    		<td> ${userInfo.ugenre }</td>
                    	</tr>
                    	<tr>
                    		<td>등급</td>
                    		<td>${userInfo.ugrade}</td>
                    	</tr>
                    </table>
                  
					<hr> 
						<div class="col-sm-12 col-xs-6 tital " ><p>Date Of Joining  : ${userInfo.udate}</p></div><br>
					<hr>
						<center><button class="btn" type="button" onclick="location.href='userUpdate.tm'" >회원 정보 수정</button></center>
					</div>
                </div>
		</div>
	</div>
	</div>
</div>
	
</body>
</html>