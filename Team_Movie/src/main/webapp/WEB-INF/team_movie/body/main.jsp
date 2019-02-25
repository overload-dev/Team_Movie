<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">
<script type="text/javascript">
	function movie_description(io,mnum){	
		if(io == '0'){
			$("span." + mnum).show();		
		}else{
			$("span." + mnum).hide();		
		}
	}
	function special(ugrade,mnum){	
		
		if(ugrade!=2){
			var con=confirm("멤버등록한 회원만 시청가능합니다. 멤버 등록하시겠습니까?");
				
			if(con==false){
				
				return false;
			}else{
				location.href="mShipBuyForm.tm";
			}
			
		}else{
			
			location.href="movieContent.tm?mnum="+mnum;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="http://placehold.it/1170x400" alt="이미지1">
				</div>

				<div class="item">
					<img src="http://placehold.it/1170x400" alt="이미지2">
				</div>

				<div class="item">
					<img src="http://placehold.it/1170x400" alt="이미지3">
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
	<br><br>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">공지사항</font>
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
	<!-- 멤버별 영상 -->
	
		<div class="container">
			<div class="panel panel-info">
				<div class="panel-heading">
				<font style="font-size: 20px;">멤버 전용관</font>
				</div>
			<div class="panel-body">
				<c:if test="${totalCount == 0 }">
					<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
         				<h1 class="display-3 text-primary">No Contents</h1>
        		    	<p class="lead">컨텐츠가 없습니다.</p>
        			</div>
				</c:if>
				<div class="row">
					<div class="col-md-12">
						<div class="row" style="text-align: right;">
							<div class="col-md-12">
							<a href="#"> <font
									style="font-weight: bold; font-size: large;">전체보기</font>
							</a>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row" style="text-align: center;">
							<c:set var="col" value="0" />
							<c:set var="more" value="false" />
							
							<c:forEach items="${memMovie }" var="movie" varStatus="status">
								
								<c:if test="${not more}">
									<c:set var="col" value="${col + 1 }" />
									<div class="col-md-3">
										<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${movie.mnum})" onmouseout="movie_description(1,${movie.mnum})">
											<a href="#" onclick="special(${sessionScope.ugrade},${movie.mnum})">
												<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="80%" >
												<span id="desc" class="${movie.mnum}" > 
													<b class="display-4" style="color: white;">
														${movie.mname }
													</b>
													<br><br><br>
													<b style="color: white;">
														${movie.msynop}
													</b>
													<br><br><br>
													<b style="color: white;">
														상영 시간: ${movie.mruntime}
													</b>
												</span>
											</a>
										</div>
										<br>
										<b class="text-info"> ${movie.mname }</b>
									</div>
									<c:if test="${col%4 == 0 }">
										<c:set var="more" value="true" />
										<div class="row">
										</div>
									</c:if>
								</c:if>
							</c:forEach>
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
												<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${movie.mnum})" onmouseout="movie_description(1,${movie.mnum})">
													<a href="movieContent.tm?mnum=${movie.mnum}">
														<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="80%" >
														<span id="desc" class="${movie.mnum}" >
															<b class="display-4" style="color: white;">
																${movie.mname }
															</b>
															<br><br><br>
															<b style="color: white;">
																${movie.msynop}
															</b>
															<br><br><br>
															<b style="color: white;">
																상영 시간: ${movie.mruntime}
															</b>
														</span>
													</a>
												</div>
												<br>
												<b class="text-info"> ${movie.mname }</b>
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
									<a data-slide="prev" href="#Carousel${pg }"	class="left carousel-control"><i class="glyphicon glyphicon-chevron-left"></i></a>
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

	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">전체 영화</font>
			</div>
			<div class="panel-body">
				<c:if test="${totalCount == 0 }">
					<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
         				<h1 class="display-3 text-primary">No Contents</h1>
        		    	<p class="lead">컨텐츠가 없습니다.</p>
        			</div>
				</c:if>
				<div class="row">
					<div class="col-md-12">
						<div class="row" style="text-align: right;">
							<div class="col-md-12">
							<a href="#"> <font
									style="font-weight: bold; font-size: large;">전체보기</font>
							</a>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row" style="text-align: center;">
							<c:set var="col" value="0" />
							<c:set var="more" value="false" />
							<c:forEach items="${movie }" var="movie" varStatus="status">
								<c:if test="${not more}">
									<c:set var="col" value="${col + 1 }" />
									<div class="col-md-3">
										<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${movie.mnum})" onmouseout="movie_description(1,${movie.mnum})">
											<a href="movieContent.tm?mnum=${movie.mnum}">
												<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="80%" >
												<span id="desc" class="${movie.mnum}" >
													<b class="display-4" style="color: white;">
														${movie.mname }
													</b>
													<br><br><br>
													<b style="color: white;">
														${movie.msynop}
													</b>
													<br><br><br>
													<b style="color: white;">
														상영 시간: ${movie.mruntime}
													</b>
												</span>
											</a>
										</div>
										<br>
										<b class="text-info"> ${movie.mname }</b>
									</div>
									<c:if test="${col%4 == 0 }">
										<c:set var="more" value="true" />
						</div>
						<div class="row">
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>