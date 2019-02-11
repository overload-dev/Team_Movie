<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../top.jsp"%>


</head>
<body>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="img1" alt="이미지1">
				</div>

				<div class="item">
					<img src="img2" alt="이미지2">
				</div>

				<div class="item">
					<img src="img3" alt="이미지3">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>공지사항</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr align="right">
						<td colspan="2"><a href="#"> <font
								style="font-weight: bold; font-size: large;">+</font>
						</a></td>
					</tr>
					<tr>
						<td width="10%" align="center"><font class="text-primary"
							style="font-weight: bold;">번호</font> <!-- 공지사항인 게시글 타입의 칼럼만 순차적으로 count -->
						</td>
						<td width="90%"><font class="text-primary"
							style="font-weight: bold;">내용</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>선호 장르별 인기 영화</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr align="right">
						<td colspan="2"><a href="#"> <font
								style="font-weight: bold; font-size: large;">+</font>
						</a></td>
					</tr>
					<tr>
						<td width="10%" align="center"><font class="text-primary"
							style="font-weight: bold;">번호</font> <!-- 공지사항인 게시글 타입의 칼럼만 순차적으로 count -->
						</td>
						<td width="90%"><font class="text-primary"
							style="font-weight: bold;">내용</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>