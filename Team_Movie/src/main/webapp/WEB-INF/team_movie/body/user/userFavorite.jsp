
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading"><h4>즐겨 찾기</h4></div>
		
			<c:if test="${ fn:length(mLists)==0}">
				<div class="panel-body">
					<div class="col-sm-12">
						<div class="jumbotron jumbotron-fluid"
							style="background-color: #DCDDE2;">
							<h1 class="display-3 text-primary">No Contents</h1>
							<p class="lead">즐겨 찾기한 컨텐츠가 없습니다.</p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${fn:length(mLists)!=0 }">
				<div class="panel-body">
					<div class="col-sm-12">

						<!-- 즐겨찾기 목록 시작-->
						<div class="row" style="text-align: center;">
							<c:set var="col" value="0" />
							<c:set var="more" value="false" />
							<c:forEach var="mLists" items="${mLists}">
								<c:set var="col" value="${col + 1 }" />
								<div class="col-md-3">
									<a class="favorite"
										href="movieContent.tm?mnum=${mLists.mnum }&usid=${sessionScope.usid }">
										<img
										src="<c:url value="/resources/saveMovieDB/${mLists.mnum }/${mLists.mimg}"/>"
										width="80%"> <br>
										<h4 class="text-primary">
											<c:if test="${mLists.mwcon==2 }">
												<img alt="멤버전용" src="resources/img/sub/mbs.png"
													class="memIcon">
											</c:if>
											${mLists.mname }
										</h4>

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
</body>
</html>