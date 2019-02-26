<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">
<style type="text/css">
 .memIcon{
	
		width: 30px;
}
</style>
<script type="text/javascript">
function movie_description(io,mnum){	
	if(io == '0'){
		$("span." + mnum).show();		
	}else{ 
		$("span." + mnum).hide();		
	}
} 

function special(ugrade,mnum,mwcon){	
	alert("ugrade :"+ugrade)
	if(ugrade==1 && mwcon==2 ){
		var con=confirm("멤버등록한 회원만 시청가능합니다. 멤버 등록하시겠습니까?");
				
			if(con==false){
				
				return false;
			}else{
				location.href="mShipBuyForm.tm";
			}
		   
	} 
	if(ugrade == 2 || ugrade == 0 || mwcon==1){  
		alert("mnum:"+mnum);
		location.href="movieContent.tm?mnum="+mnum;
	}
	
	if(ugrade==null && mwcon==2){
		alert("로그인 후 이용하세요.");
		location.href="userLogin.tm";
		
	}
	
}
</script>
</head>
<body>

 
			
<c:forEach items="${genreList }" var="genre">
	
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">${genre.gname } 컨텐츠 </font>
			</div>
			<div class="panel-body">
				<c:if test="${totalCount == 0 }">
					<div class="jumbotron jumbotron-fluid"
						style="background-color: #DCDDE2;">
						<h1 class="display-3 text-primary">No Contents</h1>
						<p class="lead">컨텐츠가 없습니다.</p>
					</div>
				</c:if>
				<div class="row">
					
					<div class="col-md-12">
						<div class="row" style="text-align: center;">
							<c:set var="col" value="0" />
							<c:set var="more" value="false" />

							<c:forEach items="${memberMovie }" var="movie" varStatus="status">
								<c:if test="${fn:contains(movie.mgenre,genre.gname )}">
								<c:if test="${not more}">
									<c:set var="col" value="${col + 1 }" />
									<div class="col-md-3">
				 						<div style="position: relative; cursor: pointer;"
											onmouseover="movie_description(0,${movie.mnum})"
											onmouseout="movie_description(1,${movie.mnum})">
											
											<a href="#" onclick=
											<c:if test="${sessionScope.ugrade!=null }">
												"special(${sessionScope.ugrade},${movie.mnum},${movie.mwcon })"
												</c:if>
											<c:if test="${sessionScope.ugrade==null }">	
												special(null,${movie.mnum},${movie.mwcon })
											</c:if>>
												
												
												<img
												src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>"
												width="80%"> <span id="desc" class="${movie.mnum}">
													<b class="display-4" style="color: white;">
														${movie.mname } </b> <br>
												<br>
												<br> <b style="color: white;"> ${movie.msynop} </b> <br>
												<br>
												<br> <b style="color: white;"> 상영 시간:
														${movie.mruntime} </b>
											</span>
											</a>
											
										</div>
										<br> 
									<h4 class="text-primary">
									<c:if test="${movie.mwcon==2 }">
										<img alt="멤버전용" src="resources/img/sub/mbs.png" class="memIcon">
									</c:if> ${movie.mname }</h4>
								
									</div>
									<c:if test="${col%4 == 0 }">
										 
										<p style="width:400px;">&nbsp;</p>
										
									</c:if> 
								</c:if> 
								</c:if>
							</c:forEach> 
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
<%@include file="../footer.jsp"%>
</body>
</html>