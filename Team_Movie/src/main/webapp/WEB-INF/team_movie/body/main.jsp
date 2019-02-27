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

			<!-- Wrapper for slides -->
			<div class="carousel-inner" id="slide">
				<div class="item active">
				
					<img src="resources/img/sliderImg/1.jpg" alt="이미지1">
				</div>

				<div class="item">
					<img src="resources/img/sliderImg/2.jpg" alt="이미지2">
				</div>

				<div class="item">
					<img src="resources/img/sliderImg/3.jpg" alt="이미지3">
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
				<c:choose>
					<c:when test="${noticeMainList.size() == 0 }">
						<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
							<h1 class="display-3 text-primary">No Contents</h1>
							<p class="lead">공지사항이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var ="count" value="${noticeMainList.size()}"/>
								<div align="right">
								<a href="noticeView.tm"> 
									<font style="font-weight: bold; font-size:large;">전체보기</font>
									</a>
								</div>
								<div class="row">
									<div class="col-sm-2">
										<font class="text-secondary" style="font-weight: bold;">No.</font>
									</div>
									<div class="col-sm-6" style="padding-left: 50px">
										<font class="text-secondary" style="font-weight: bold;">제목</font>
									</div>
									<div class="col-sm-4" align="right" style="padding-right: 50px">
										<font class="text-secondary" style="font-weight: bold;">등록일</font>
									</div>
								</div>
		
						<div class="panel-group" id="accordion">					
							<c:forEach var ="notice" items="${noticeMainList}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="row">
											<div class="col-sm-2">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
													No. ${count}
												</a>
											</div>
											<div class="col-sm-4">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
													 ${notice.bsubject }
												</a>
											</div>
											<div class="col-sm-6" align="right">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
													<fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/>
												</a>
											</div>
										</div>
									</div>
									<div id="collapse${notice.bnum}" class="panel-collapse collapse">
										<div class="panel-body">
											<pre>${notice.bcon }</pre>
										</div>
					    			</div>
					  			</div>
					  			<c:set var="count" value="${count - 1 }"/>
				  			</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- 멤버전용 영상 -->
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
								<a href="memberContents.tm"> 
									<font style="font-weight: bold; font-size:large;">전체보기</font>
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
									<div class="col-md-3" align="center">
									
										<a class="contents-link" href="#" onclick=
											<c:if test="${sessionScope.ugrade!=null }">
												"special(${sessionScope.ugrade},${movie.mnum},${movie.mwcon })"
											</c:if>
												
											<c:if test="${sessionScope.ugrade==null }">	
												special(null,${movie.mnum},${movie.mwcon })
											</c:if>>
											
											<div class="contents-portrait" onmouseover="movie_description(0,'s${movie.mnum}')" onmouseout="movie_description(1,'s${movie.mnum}')">
												<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="100%" >
												<div class="contents-desc-frame s${movie.mnum}" >
														<h3>${movie.mname }</h3><hr>
													<div class="contents-desc">
														${movie.msynop }
													</div>
												</div>
											</div>	
											<h4 class="text-primary">
												<c:if test="${movie.mwcon==2 }">
													<img alt="멤버전용" src="resources/img/sub/mbs.png" class="memIcon">
												</c:if> ${movie.mname }
											</h4>
										</a>
									</div>
									<c:choose>
										<c:when test="${col%4 == 0 }">
											<c:set var="more" value="true" />
											<div class="row">
											</div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									
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
											<div class="col-md-3" align="center">
												<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${movie.mnum})" onmouseout="movie_description(1,${movie.mnum})">
													<a class="contents-link" href="#" onclick=
														
													<c:if test="${sessionScope.ugrade!=null }">"special(${sessionScope.ugrade},${movie.mnum},${movie.mwcon })"</c:if>
													<c:if test="${sessionScope.ugrade==null }">	
														special(null,${movie.mnum},${movie.mwcon })
													</c:if>>
												
													<div class="contents-portrait" onmouseover="movie_description(0,'${pg}-${col}-${movie.mnum}')" onmouseout="movie_description(1,'${pg}-${col}-${movie.mnum}')">
														<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="100%" >
														<div class="contents-desc-frame ${pg}-${col}-${movie.mnum}" >
																<h3>${movie.mname }</h3><hr>
															<div class="contents-desc">
																${movie.msynop }
															</div>
														</div>
													</div>
													<h4 class="text-primary">
														<c:if test="${movie.mwcon==2 }">
															<img alt="멤버전용" src="resources/img/sub/mbs.png" class="memIcon">
														</c:if> ${movie.mname }
													</h4>
												</a>
												</div>
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
</body>
<%@include file="../footer.jsp"%>
</html>