<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 커스텀 css & script -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">
<script src="<c:url value='/resources/js/commonScript.js'/>"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 동영상 재생 -->
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<title>Planet Ark</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" >
		<div class="container">
			<div class="navbar-header">
				<c:if test="${usid == null }">
					<a class="navbar-brand" href="main.tm">Planet Ark</a>
				</c:if>
				<c:if test="${usid != null }">
					<a class="navbar-brand" href="main.tm?usid=${usid }">Planet Ark</a>
				</c:if>
			</div>
				 
		<ul class="nav navbar-nav">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">장르 카테고리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach var="list" items="${genreList }">
							<li><a href="genreView.tm?gname=${list.gname}">${list.gname}</a></li>
						</c:forEach>
					</ul>
			</li>
			
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">컨텐츠보기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
						<a href="allMovieView.tm">모든 컨텐츠</a>
					</li>
					<li class="dropdown">
						<a href="freeContents.tm">무료 컨텐츠</a>
					</li>
					<li class="dropdown">
						<a href="memberContents.tm">멤버쉽 컨텐츠</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="noticeView.tm">공지사항</a>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right" >
		<c:choose>
			<c:when test="${sessionScope.ugrade == null}"><!-- none acount -->
			
				<li><a href="userLogin.tm"><span class="glyphicon glyphicon-log-in"></span> Login </a></li>
				<li><a href="userInsert.tm"><span class="glyphicon glyphicon-user"></span> Sign Up </a></li>
			</c:when> 
			
			<c:when test="${sessionScope.ugrade == '0'}"><!-- admin acount -->
			
				<li>
					<a href="adminUserEdit.tm">
						<font style="color: white; font-weight: bold; font-size: medium;">
							환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님 
						</font>
					</a>
				</li>
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">내 정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a class="dropitem" href="adminUserEdit.tm">회원 관리</a></li>
						<li><a class="dropitem" href="adminContentsEdit.tm">컨텐츠 관리</a></li>
						<li><a class="dropitem" href="adminNoticeEdit.tm">공지사항</a></li>
						<li><a class="dropitem" href="adminEditMembership.tm">멤버십 관리</a></li>
						<li><a class="dropitem" href="adminEditEvent.tm">이벤트 컨텐츠 설정</a></li>
					</ul>
				</li>
				<li><a href="userLogout.tm">Logout</a></li>
			</c:when>
			<c:when test="${sessionScope.ugrade == '1'}"><!-- nomal acount -->
				<li>
					<a href="">
						<font style="color: white; font-weight: bold; font-size: medium;">
							환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님  
						</font> 
					</a>
				</li>
				<li><a href="userDetail.tm">회원 정보 관리</a></li>
				<li><a href="userLogout.tm">Logout</a></li>
			</c:when>
			<c:when test="${sessionScope.ugrade == '2'}"><!-- sp acount -->
				<li>
				<a href="">
					<font style="color: white; font-weight: bold; font-size: medium;">
						환영합니다. ${sessionScope.usid} (${sessionScope.uname}) 님
					</font>
				</a>
				</li>
				<li><a href="userDetail.tm">회원 정보 관리</a></li>
				<li><a href="userLogout.tm">Logout</a></li>
			</c:when>
		</c:choose>  	
		</ul>
		</div>
	</nav>
	<div style="margin-bottom: 55px"></div>
</body>
</html>

