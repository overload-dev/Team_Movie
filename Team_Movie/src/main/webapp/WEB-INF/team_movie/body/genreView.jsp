<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/genrePageStyle.css' />">

<script type="text/javascript">
	function movie_description(io,mnum){	
		if(io == '0'){
			$("div." + mnum).show();		
		}else{
			$("div." + mnum).hide();		
		}
	}
</script>

</head>
<body>


	<div class="container">
	<h2 class="text-primary">무료 ${gname }</h2>	
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
						<a class="contents-link" href="movieContent.tm?mnum=${mlist.mnum}&usid=${sessionScope.usid }">
							<div class="contents-portrait" onmouseover="movie_description(0,${mlist.mnum})" onmouseout="movie_description(1,${mlist.mnum})">
							    <img src="<c:url value="/resources/saveMovieDB/${mlist.mnum }/${mlist.mimg}"/>" width="100%" >
								<div class="contents-desc-frame ${mlist.mnum}" >
										<h3 >${mlist.mname }</h3><hr>
									<div class="contents-desc">
										${mlist.msynop }
									</div>
								</div>							
							</div>
							<h4 class="text-primary"> ${mlist.mname }</h4>
							
						</a>
						
		
						
				<%-- 		<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${mlist.mnum})" onmouseout="movie_description(1,${mlist.mnum})">
							<img src="<c:url value="/resources/saveMovieDB/${mlist.mnum }/${mlist.mimg}"/>" width="80%" >
							 	<div id="desc" class="${mlist.mnum}" class="display-4" style="color: white;">
							 		<p style="float: inherit;;">
							 			${mlist.mname }
							 			${mlist.msynop}
							 		</p>
								</div>
								<div>
								${mlist.mname }
							 			${mlist.msynop}
								</div>
							</div> --%>
						
							<br>
						</div>
					</c:forEach>
					
				</div>
		</c:otherwise>
	</c:choose>
	</div>
	
	
	<div class="container">
	<h2 class="text-primary"> ${gname } 멤버전용관 </h2>	
	<c:choose>
		<c:when test="${mgMovie.size() == 0}">
			<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
				<h1 class="display-3 text-primary">No Contents</h1>
				<p class="lead">해당 장르의 컨텐츠가 없습니다.</p>
			</div>
		</c:when> 
		<c:otherwise> 
			<div class="row">
				<c:forEach var="mlist" items="${mgMovie}">
					<div class="col-sm-3" align="center">
						<a class="contents-link" href="movieContent.tm?mnum=${mlist.mnum}&usid=${sessionScope.usid }">
							<div class="contents-portrait" onmouseover="movie_description(0,${mlist.mnum})" onmouseout="movie_description(1,${mlist.mnum})">
							    <img src="<c:url value="/resources/saveMovieDB/${mlist.mnum }/${mlist.mimg}"/>" width="100%" >
								<div class="contents-desc-frame ${mlist.mnum}" >
										<h3 >${mlist.mname }</h3><hr>
									<div class="contents-desc">
										${mlist.msynop }
									</div>
								</div>							
							</div>
							<h4 class="text-primary"> ${mlist.mname }</h4>
							
						</a>
					
						
						
						
				<%-- 		<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${mlist.mnum})" onmouseout="movie_description(1,${mlist.mnum})">
							<img src="<c:url value="/resources/saveMovieDB/${mlist.mnum }/${mlist.mimg}"/>" width="80%" >
							 	<div id="desc" class="${mlist.mnum}" class="display-4" style="color: white;">
							 		<p style="float: inherit;;">
							 			${mlist.mname }
							 			${mlist.msynop}
							 		</p>
								</div>
								<div>
								${mlist.mname }
							 			${mlist.msynop}
								</div>
							</div> --%>
						
							<br>
						</div>
					</c:forEach>
					
				</div>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>