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
	<div class="container wrap">
		<div class="panel panel-info"> 
			<div class="panel-heading"><h2>${gname }</h2></div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${movielist.size() == 0}">
						<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
							<h1 class="display-3 text-primary">No Contents</h1>
							<p class="lead">해당 장르의 컨텐츠가 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<c:forEach var="mlist" items="${movielist}">
								<div class="col-sm-3" align="center">
									<a class="contents-link" href="#"
									onclick=
										<c:if test="${sessionScope.ugrade!=null }">
												special(${sessionScope.ugrade},${mlist.mnum},${mlist.mwcon })
										</c:if>
										<c:if test="${sessionScope.ugrade==null }">	
												special(null,${mlist.mnum},${mlist.mwcon })
										</c:if>>
										<div class="contents-portrait" onmouseover="movie_description(0,${mlist.mnum})" onmouseout="movie_description(1,${mlist.mnum})">
										    <img src="<c:url value="/resources/saveMovieDB/${mlist.mnum }/${mlist.mimg}"/>" width="100%" >
											<div class="contents-desc-frame ${mlist.mnum}" >
													<h3>${mlist.mname }</h3><hr>
												<div class="contents-desc">
													${mlist.msynop }
												</div>
											</div>							
										</div>
										<h4 class="text-primary">
										<c:if test="${mlist.mwcon==2 }">
											<img alt="멤버전용" src="resources/img/sub/mbs.png" class="memIcon">
										</c:if> ${mlist.mname }</h4>
									</a>
								</div>
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