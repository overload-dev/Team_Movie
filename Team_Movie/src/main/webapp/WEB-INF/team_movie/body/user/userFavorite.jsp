
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<div class="container">
	<div class="col-sm-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row"> 
					<div class="col-sm-9">
						<font style="font-size: 20px;">즐겨 찾기
					</font>
					</div>
					<div class="col-sm-3">
						<a href="main.tm" > 
							<font style="font-weight: bold; color:black; font-size: large; text-align:right;">다른 영화 보기</font>
						</a>
					</div>
				</div>
			</div>
		<div class="panel-body">
			<c:if test="${ fn:length(mLists)==0}">
				<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
					<h1 class="display-3 text-primary">No Contents</h1>
					<p class="lead">즐겨 찾기한 컨텐츠가 없습니다.</p>
				</div>
			</c:if>
				<c:if test="${fn:length(mLists)!=0 }">
					<div class="panel-body">
						<div class="col-md-12">
							
							<!-- 즐겨찾기 목록 시작-->
								<div class="row" style="text-align: center;">
									<c:set var="col" value="0" />
										<c:set var="more" value="false" />
											<c:forEach var="mLists" items="${mLists}">
												<c:set var="col" value="${col + 1 }" />
														<div class="col-md-3">
															<a href="movieContent.tm?mnum=${mLists.mnum }&usid=${sessionScope.usid }">
												<img src="<c:url value="/resources/saveMovieDB/${mLists.mnum }/${mLists.mimg}"/>" width="80%" >
															<br>
																${mLists.mimg }<br>
																${mLists.mname }<br>  
															${mLists.mgenre }<br>										
										</a>
									</div>
										<c:if test="${col%4 == 0 }">
											<c:set var="more" value="true" />
										</c:if>
										</c:forEach>
									</div>
							
							
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	</div>
</body>
</html>