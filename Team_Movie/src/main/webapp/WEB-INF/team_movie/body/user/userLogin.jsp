<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGINFORM</title>
<%@include file="../../top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/userPageStyle.css' />">

</head> 
<body>
	

<div class="container wrap">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">LOGIN</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="userLogin.tm" method="POST">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="ID" name="usid" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="PASSWORD" name="upw" type="password" value="">
			    		</div>
			    		
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    	</fieldset>
			      	</form>
			    </div>
			    <!-- 회원가입 및 ID , PW 찾기  -->
				<div class="panel-footer">
					<div class="d-flex">
						<a href="userInsert.tm">회원가입을 아직 안하셨나요?</a>
						<!--ID찾기 폼으로 이동  -->
					</div>
					<div class="d-flex">
						<a href="findId.tm">ID를 잊으셨나요?</a>
						<!--ID찾기 폼으로 이동  -->
					</div>
					<div class="d-flex">
						<a href="findPw.tm">PASSWORD를 잊으셨나요?</a>
						<!--PASSWORD찾기 폼으로 이동  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../../footer.jsp"%>
</body>
</html>