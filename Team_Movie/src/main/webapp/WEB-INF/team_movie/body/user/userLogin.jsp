<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGINFORM</title>
<%@include file="../../top.jsp"%>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h2>로그인</h2>
				</div>
				<div class="card-body">
					<form method="POST" action="userLogin.tm">
						<!-- 아이디 비밀번호가 일치한다면 로그인controller로 이동  -->
						<!-- ID 입력 부분  -->
						<div class="input-group form-group">
							<label class="col-sm-12">아이디</label>
							<div class="col-sm-12">
								<input type="text" name="usid" class="form-control"	placeholder="ID">
							</div>
						</div>
						<!-- PW 입력부분  -->
						<div class="input-group form-group">
							<label class="col-sm-12">비밀번호</label>
							<div class="col-sm-12">
								<input type="password" name="upw" class="form-control" placeholder="PASSWORD">
							</div>
						</div>
						<!-- login 버튼 부분  -->
						<div class="form-group" align="center">
							<input type="submit" value="로그인" class="btn login_btn">
						</div>
					</form>
				</div>
				<!-- 회원가입 및 ID , PW 찾기  -->
				<div class="card-footer">
					<div class="d-flex">
						<a href="userInsert.tm">회원가입을 아직 안하셨나요?</a>
						<!--ID찾기 폼으로 이동  -->
					</div>
					<div class="d-flex">
						<a href="findId.tm">ID를 잊으셨나요?</a>
						<!--ID찾기 폼으로 이동  -->
					</div>
					<div class="d-flex">
						<a href="#">PASSWORD를 잊으셨나요?</a>
						<!--PASSWORD찾기 폼으로 이동  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>