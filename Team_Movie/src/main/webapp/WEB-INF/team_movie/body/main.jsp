<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>

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
					<img src="#" alt="이미지1">
				</div>

				<div class="item">
					<img src="#" alt="이미지2">
				</div>

				<div class="item">
					<img src="#" alt="이미지3">
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
						<td width="90%" align="center"><font class="text-primary"
							style="font-weight: bold;">내용</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<!-- 랜덤으로 나온 인기장르 1 -->
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>${genre1 } 인기 영화</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<c:set var="col" value="0" />
						<c:forEach items="${movieByGenre1 }" var="movieByGenre1"
							varStatus="status">
							<c:set var="col" value="${col + 1 }" />
							<td align="center"><c:out value="${col }" /> <br>
								${movieByGenre1.mimg }<br> ${movieByGenre1.mname }</td>
							<c:if test="${col%5 == 0 }">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>

	<!-- 랜덤으로 나온 인기장르 2 -->
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>${genre2 } 인기 영화</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<c:set var="col" value="0" />
						<c:forEach items="${movieByGenre2 }" var="movieByGenre2"
							varStatus="status">
							<c:set var="col" value="${col + 1 }" />
							<td align="center"><c:out value="${col }" /> <br>
								${movieByGenre2.mimg }<br> ${movieByGenre2.mname }</td>
							<c:if test="${col%5 == 0 }">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>

	<!-- 랜덤으로 나온 인기장르 3 -->
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>${genre3 } 인기 영화</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<c:set var="col" value="0" />
						<c:forEach items="${movieByGenre3 }" var="movieByGenre3"
							varStatus="status">
							<c:set var="col" value="${col + 1 }" />
							<td align="center"><c:out value="${col }" /> <br>
								${movieByGenre3.mimg }<br> ${movieByGenre3.mname }</td>
							<c:if test="${col%5 == 0 }">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>


	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<b>전체 영화</b>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr align="right">
						<td colspan="5"><a href="#"> <font
								style="font-weight: bold; font-size: large;">전체보기</font>
						</a></td>
					</tr>
					<tr>
						<c:set var="col" value="0" />
						<c:set var="more" value="false" />
						<c:forEach items="${movie }" var="movie" varStatus="status">
							<c:if test="${not more}">
								<c:set var="col" value="${col + 1 }" />
								<td align="center"><c:out value="${col }" /> <br>
									${movie.mimg }<br> ${movie.mname }</td>
								<c:if test="${col%5 == 0 }">
									<c:set var="more" value="true" />
					</tr>
					<tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>