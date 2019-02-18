<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	userDetail.jsp
	<div class="container">
		<h2 class="text-primary">회원 정보 관리</h2>
		<div class="row">
			<div class="col-sm-3" >
				<div class="panel panel-info">
					<div class="panel-heading">Menu</div>
						<div class="panel-body" align="center">
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action active">
								개인 정보 관리  
							</a> 
							<a href="#" class="list-group-item list-group-item-action">
								멤버십
							</a>
							<a href="userDelete.tm" class="list-group-item list-group-item-action">
								회원 탈퇴
							</a> 
						</div>
		      		</div>
		 	   </div>
			</div>
			<div class="col-sm-9">
					<div class="panel panel-info">
						<div class="panel-heading">개인정보관리</div>
							<div class="panel-body">			
								<h4 class="text-primary">${sessionScope.uname} 님의 정보</h4>
							아이디 : ${userInfo.usid }<br>
							이름 : ${userInfo.uname }<br>
							생년월일 :${userInfo.ubirth } <br>
							선호장르 : ${userInfo.ugenre }<br>
							멤버 등급 : ${userInfo.ugrade}<br>
							가입일자 : ${userInfo.udate}<br>
						</div> 
					</div> 
					<button type="button" onclick="location.href='userEdit.tm?usid=${sessionScope.usid}'">정보 수정하기</button>
			</div>
		</div>
	</div>
</body>
</html>