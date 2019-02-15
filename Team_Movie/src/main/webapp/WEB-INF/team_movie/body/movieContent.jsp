<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
</script>
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">
</head>
<body>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 40px;">${movie.mname }</font>
			</div>
			<div class="panel-body">
				<iframe class="embed-responsive-item" src="//www.youtube.com/embed/80lNjkcp6gI" width="100%" height="400%" frameborder="0" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">${movie.mname }</font>
				<div class="pull-right">
					<a href="#comment">
          				<span class="glyphicon glyphicon-pencil" style="font-size:18px;" title="댓글쓰기"></span>
        			</a>
        			&nbsp;&nbsp;
        			<a href="movieLike.tm?mnum=${movie.mnum }">
          				<span class="glyphicon glyphicon-heart" style="font-size:18px;" title="좋아요"></span>
        			</a>
        			&nbsp;&nbsp;
        			<a href="#">
          				<span class="glyphicon glyphicon-bookmark" style="font-size:18px;" title="즐겨찾기"></span>
        			</a>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-3">
							${movie.mgenre }
						</div>
						<div class="col-md-3">
							분
						</div>
						<div class="col-md-3">
							${movie.mage }세 이상 관람가
						</div>
						<div class="col-md-3">
							<b>개봉일</b> ${movie.mrdate }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>감독</b>
						</div>
						<div class="col-md-5">
							${movie.mdir }
						</div>
						<div class="col-md-1">
							<b>연출</b>
						</div>
						<div class="col-md-5">
							${movie.mpro }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>배우</b>
						</div>
						<div class="col-md-11">
							${movie.mactor }, ${movie.msup }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>줄거리</b>
						</div>
						<div class="col-md-11">
							${movie.msynop }
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 랜덤으로 나온 인기장르 for carousel1-->
	<c:forEach items="${map }" var="map" varStatus="status">
		<div class="container">
		<c:set var="pg" value="${pg + 1 }" />
			<div class="panel panel-info">
				<div class="panel-heading">
					<font style="font-size: 20px;">${map.key } 인기 영화</font>
				</div>
				<div class="panel-body">
					<c:if test="${fn:length(map.value) == 0 }">
						<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
	         				<h1 class="display-3 text-primary">No Contents</h1>
	        		    	<p class="lead">${map.key } 장르의 컨텐츠가 없습니다.</p>
	        			</div>
					</c:if>
					<div class="row" style="text-align: center;">
						<c:set var="col" value="0" />
						<div class="col-md-12">
							<div id="Carousel${pg }" class="carousel slide media-carousel">
								<div class="carousel-inner">
									<div class="item active">
										<div class="row">
										<c:forEach items="${map.value }" var="movie" varStatus="status">
										<c:set var="col" value="${col + 1 }" />
											<div class="col-md-3">
												<a href="movieContent.tm?mnum=${movie.mnum }&usid=${usid }">
													<img src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289a21bfc39a73f3702f1000356f5d85b90b25cae3d483b159e8a5349d562fb69e" width="80%"><br>
													${movie.mimg }<br>
													${movie.mname }<br>
													${movie.mgenre }<br>
												</a>
											</div>
										<c:if test="${col%4 == 0 }">
										</div>
									</div>
									<div class="item">
										<div class="row">
										</c:if>
										</c:forEach>
										</div>
									</div>
									<!--.carousel-inner-->
									<a data-slide="prev" href="#Carousel${pg }" class="left carousel-control"><i class="glyphicon glyphicon-chevron-left"></i></a> 
									<a data-slide="next" href="#Carousel${pg }" class="right carousel-control"><i class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
								<!--.Carousel-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<div class="container" id="comment">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">댓글</font>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<div class="row">
						<form method="POST" action="commentMovie.tm" id="commentForm">
							<input type="hidden" name="unum" value="${user.unum }">
							<div class="col-md-12">
								${user.usid }
							</div>
							<div class="col-md-12">
								<label class="col-sm-12">제목</label>
								<div class="col-md-12">
									<input type="text" name="bsubject" class="form-control" placeholder="제목을 입력하세요.">
								</div>
								<label class="col-sm-12">내용</label>
								<div class="col-md-12">
									<textarea name="bcon" rows="8" cols="100" style="resize:none;" class="form-control" placeholder="내용을 입력하세요."></textarea>
								</div>
								<div class="form-group" align="right">
									<input type="submit" value="등록" class="btn login_btn">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">댓글 목록</font>
			</div>
			<div class="panel-body" id="commentReply">
			</div>
		</div>
	</div>
	
</body>
</html>