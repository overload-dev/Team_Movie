<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

  
<!-- jQuery UI CSS파일  -->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<!-- jQuery 기본 js파일 삭제 가능성 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<title>Palnet Ark</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="main.tm">Palnet Ark</a>
	
	
	<div class="col-sm-2">
	 <form class="form-inline">
		<div class="input-group">
		  <input type="text" class="form-control" placeholder="Search">
		  <div class="input-group-append">
		    <input type="submit" class="btn btn-success" value="Search">
		  </div>
		</div>
	</form>
	</div>
	<div class="col-sm-1">
			<div class="dropdown col-sm-2">
			    <button class="btn btn-info dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
			    	장르 카테고리
			    </button>
				<ul class="dropdown-menu" >
				<c:forEach var="list" items="${genreList }">
					<li ><a href="genreView.tm?gname=${list.gname}">${list.gname} ${list.gnum} </a></li>
				</c:forEach>
				</ul>
			</div>
	
	</div>
	
	<div class="col-sm-4">
		<ul class="navbar-nav">
			<c:if test="${sessionScope.usid != null }">
				<li class="nav-item">
					<a class="nav-link" href="#">Feeling</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Link</a>
				</li>
			</c:if>
		</ul>
	</div>
	

	<div class="col-sm-4" >
	<c:choose>
		<c:when test="${sessionScope.ugrade == null}"><!-- none acount -->
		
			<input type="button" class="btn btn-info" value="Login" onclick="location.href='userLogin.tm'">
			<input type="button" class="btn btn-info" value ="Sign Up" onclick="location.href='userInsert.tm'">
			
		</c:when>
		
		
		<c:when test="${sessionScope.ugrade == '0'}"><!-- admin acount -->
			<a href="adminUserEdit.tm">
				<font style="color: white; font-weight: bold; font-size: medium;">
					환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님
				</font>
			</a>

				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">내 정보</button>
				<div class="dropdown-menu">
					<a class="dropitem" href="#">공지사항</a><br>
					<a class="dropitem" href="adminUserEdit.tm">회원 관리</a><br>
					<a class="dropitem" href="#">작품 관리</a><br>
					<a class="dropitem" href="#">이벤트</a><br>
				</div>

				<input type="button" class="btn btn-danger" value="logout" onclick="location.href='userLogout.tm'">

		</c:when>
		
		
		
		
		<c:when test="${sessionScope.ugrade == '1'}"><!-- normal acount -->
			<a href="">
				<font style="color: white; font-weight: bold; font-size: medium;">
					환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님
				</font>
			</a>
			<input type="button" class="btn btn-danger" value="logout" onclick="location.href='userLogout.tm'">
		</c:when>
		
		
		
		<c:when test="${sessionScope.ugrade == '2'}"><!-- special acount -->
			<a href="">
				<font style="color: white; font-weight: bold; font-size: medium;">
					환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님
				</font>
			</a>
			<input type="button" class="btn btn-danger" value="logout" onclick="location.href='userLogout.tm'">
		</c:when>
	</c:choose>  	
	</div>
</nav>




</body>
</html>

