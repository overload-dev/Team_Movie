<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/userPageStyle.css' />">
<script type="text/javascript" src="resources/js/userScript.js"></script>

<html>
<head>
<meta charset="UTF-8">
</head>
<body> 
	
<div class="container wrap">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">아이디찾기</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">비밀번호찾기</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="findId.tm" method="POST"  role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="uname" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="date" name="ubirth" id="ubirth" tabindex="2" class="form-control" >
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="아이디 찾기">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<div class="d-flex">
											<a href="userInsert.tm">아직 회원가입을 안하셨나요??</a>
											<!--회원가입 폼으로 이동  -->
										</div>
					
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="findPw.tm" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="usid" id="usid" tabindex="2" class="form-control" placeholder="ID">
									</div>
									<div class="form-group">
										<input type="text" name="uname" id="username" tabindex="1" class="form-control" placeholder="USER NAME" >
									</div>
									<div class="form-group">
										<input type="date" name="ubirth" id="ubirth" tabindex="1" class="form-control" >
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="비밀번호 찾기">
											</div>
									</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="text-center">
													<div class="d-flex">
											<a href="userInsert.tm">아직 회원가입을 안하셨나요??</a>
											<!--회원가입 폼으로 이동  -->
										</div>
					
												</div>
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
<%@include file="../../footer.jsp"%>
</body>
</html>