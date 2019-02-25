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
	<div class="container">
		<h2 class="text-primary">Admin Tool</h2>
		<div class="row">
			<div class="col-sm-3" >
				<div class="panel panel-info">
					<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
						<jsp:include page="./adminEditMenu.jsp"/>
			      	</div>
			    </div>
			</div>
			<div class="col-sm-9">
  				<jsp:include page="./${Selpage}.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>