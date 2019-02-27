<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-9">
					<div class="panel panel-info">
						<div class="panel-heading">회원탈퇴</div>
							<div class="panel-body">			
								<h4 class="text-primary">${sessionScope.uname} 님 회원 탈퇴 하시겠습니까?</h4>								
								<input type="button" value="탈퇴하기" onclick="UserDelete(${userInfo.unum })">	
							</div>
					</div> 
			</div>
		</div>
	</div>
</body>
</html>