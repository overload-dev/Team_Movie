<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h2>비밀번호를 잊으셨나요?</h2>
				</div>
				<div class="card-body">
					<form method="POST" action="findPw.tm">
						<!-- 아이디와 이름과 생년월일이 같은 아이디가가 있다면 비밀번호 찾기controller로 이동  -->
						<!-- ID 입력 부분  -->
						<div class="input-group form-group">
							<label class="col-sm-12">아이디</label> 
							<div class="col-sm-12">
								<input type="text" name="usid" class="form-control" placeholder="ID를 입력하세요.">
							</div>
						</div>

						<!-- 이름 입력 부분  -->
						<div class="input-group form-group">
							<label class="col-sm-12">이름</label> 
							<div class="col-sm-12">
								<input type="text" name="uname" class="form-control" placeholder="이름을 입력하세요.">
							</div>
						</div>

						<!-- 생년월일 입력부분  -->
						<div class="input-group form-group">
							<label class="col-sm-12">생년월일</label> 
							<div class="col-sm-12">
								<select name="yy">
									<c:forEach var="y" begin="1950" end="2019">
										<option>${y}</option>
									</c:forEach>
								</select> - <select name="mm">
									<c:forEach var="m" begin="1" end="12">
										<option>${m}</option>
									</c:forEach>
								</select> - <select name="dd">
									<c:forEach var="d" begin="1" end="31">
										<option>${d}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<!-- 아이디 및 비밀번호 찾기버튼 부분  -->
						<div class="form-group" align="center">
							<input type="submit" value="비밀번호 찾기" class="btn login_btn">
						</div>
					</form>
				</div>
				<!-- 회원가입 및  ID 찾기  -->

				<div class="card-footer">

					<div class="d-flex">
						<a href="userInsert.tm">아직 회원가입을 안하셨나요??</a>
						<!--회원가입 폼으로 이동  -->
					</div>
					<div class="d-flex">
						<a href="findId.tm">ID를 잊으셨나요??</a>
						<!--ID찾기 폼으로 이동  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>