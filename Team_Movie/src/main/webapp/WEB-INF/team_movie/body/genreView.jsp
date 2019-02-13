<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>

<script type="text/javascript">
	function movie_description(){
		
		$("#desc").show();
	}
	
</script>

</head>
<body>
	<div class="container">
	<h2 class="text-primary">${gname } 장르 List</h2>	
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
						<div class="col-sm-3">
							<div style="position: relative;" onclick="#"style="cursor:pointer" onmouseover="movie_description()">
								
									<img src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289d29501a651b4e30ee9eb4d08fb6d765dbe1b5755d3a8b89900e1c09028c3726" width="80%">
								
								 	<span id="desc" style="display:none; background-color:black; opacity: 0.5; position: absolute; left:0; top: 0; width: 80%; height: 100%" >
										<b>aaszzzzzzzzzzzzzzzzzzd</b>
										<b>aaszzzzzzzzzzzzzzzzzzd</b>
										<b>aaszzzzzzzzzzzzzzzzzzd</b>
									</span>
							</div>
							<br>
							<b class="text-info"> ${mlist.mname }</b>
						</div>
					</c:forEach>
				</div>
		
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>