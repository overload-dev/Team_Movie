<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$('input[name=thumbnail]').on("change",handleImgFileSelect);
});
	
</script>

<c:forEach var ="movie" items="${movieList }">
	<input type="hidden" name="movieName${movie.mnum }" value="${movie.mname }">
	<input type="hidden" name="movieNum${movie.mnum }" value="${movie.mimg }">
	<input type="hidden" name="movieAge${movie.mnum }" value="${movie.mage }">
	<input type="hidden" name="movieMwcon${movie.mnum }" value="${movie.mwcon }">
</c:forEach>

<body>
	<div class="container wrap">
		<h2 class="text-primary">New Event</h2>
		<form action="addEventEdit.tm" method="post" enctype="multipart/form-data" onsubmit="return addEventDataChk()">
			<div class="panel panel-info">
				<div class="panel-heading">New Event</div>
				
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-5">
							<div align="center">
								<img name ="movieThumb" width="50%" src ="<c:url value="/resources/img/sub/no-image.gif"/>"/>
								<hr>
								<div class="movieTitles">
									<h2 class="text-primary"></h2>
								</div>
							</div>
						</div>
						<div class="col-sm-1" style="border-left: 1px solid lightgrey;"></div>
						<div class="col-sm-6">
							<table width="100%" style="border-collapse: separate; border-spacing: 0 10px;">
								<tr>
									<td width="30%">서비스 중인 영화</td>
									<td>
										<select class="form-control" name="emnum" onchange="changeEventMovie()">
											
											<option value="">선택</option>
											
											<c:forEach var ="movie" items="${movieList }">
												<option value="${movie.mnum }" >
													${movie.mname}
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>관람 자격</td>
									<td>
										<div class="mwcon">
											<h4 class="text-primary"></h4>
										</div>
									</td>
								</tr>
								<tr>
									<td>관람 연령</td>
									<td>
									<div class="mage">
											<h4 class="text-primary"></h4>
										</div>
									</td>
								</tr>
								<tr>
									<td>이벤트용 사진 등록</td>
									<td>
										<input class="form-control-file" type="file" name="thumbnail">
										<hr>
										<img name="preview_img" width="100%"  src="<c:url value="/resources/img/sub/no-image-wide.png"/>">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer"align="center">
					<input type="submit" class="btn btn-primary btn-lg" value="등록">
				</div>
			</div>
		</form>
	</div>
	
</body>
<%@include file="../../footer.jsp"%>
</html>