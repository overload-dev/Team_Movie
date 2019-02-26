<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<script src="<c:url value='/resources/js/commonScript.js'/>"></script>
<body>
	<div class="container wrap">
		<h2 class="text-primary" ><font color="black">회원정보 관리</font></h2>
		<div class="row">
			<div class="col-sm-3" >
				<div class="panel panel-default">
					<div class="panel-heading">회원공간</div>
					<div class="panel-body" align="center">
						<jsp:include page="./userEditMenu.jsp"/>
			      	</div>
			    </div>
			</div> 
			<div class="col-sm-9">
  				<jsp:include page="./${page}.jsp"/>
			</div>
		</div>
	</div>
<%@include file="../../footer.jsp"%>
</body>
</html>