<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
</head>
<body>
	<div class="container wrap">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">모든 영화</font>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${fn:length(allMovie) <= 0}">
						<div class="jumbotron jumbotron-fluid"
							style="background-color: #DCDDE2;">
							<h1 class="display-3 text-primary">No Contents</h1>
							<p class="lead">컨텐츠가 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
							<div class="row">
								<c:set var="col" value="0" />
							<c:forEach var="movie" items="${allMovie}">
								<c:set var="col" value="${col + 1 }" />
									<div class="col-sm-3" align="center">
										<a class="contents-link" href="#"
											onclick=
												<c:if test="${sessionScope.ugrade!=null }">"special(${sessionScope.ugrade},${movie.mnum},${movie.mwcon })"</c:if>
												<c:if test="${sessionScope.ugrade==null }">	
													special(null,${movie.mnum},${movie.mwcon })
												</c:if>>
											<div class="contents-portrait" onmouseover="movie_description(0,'${movie.mnum}')" onmouseout="movie_description(1,'${movie.mnum}')">
												<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="100%" >
												<div class="contents-desc-frame ${movie.mnum}" >
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
									<c:if test="${col%4 == 0 }">
											 <div class="col-sm-12" style="height: 1px; border-bottom: 12px; border-bottom-color: black;"></div>
									</c:if>
							</c:forEach>
							</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>