<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div class="panel panel-info">
	<div class="panel-heading">
		<div class="row">
			<div class="col-sm-6">
				Event List
			</div>
			<div class="col-sm-6" align="right">
				<input type="button" class="btn btn-info" value="새 이벤트 설정" onclick="location.href='addEventEdit.tm'">
			</div>
		</div>
	</div>
	<div class="panel-body">
		<table class="table" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="10%">고유 번호</th>
					<th width="15%">섬네일</th>
					<th width="40%">영화 이름</th>
					<th width="30%">Edit</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${fn:length(eventList) > 0 }">
					<c:forEach var="event" items="${eventList }">
						<tr>
							<td>${event.eenum }</td>
							<td width="30%"><img  width="70%" src="<c:url value='/resources/saveMovieDB/${event.emnum }/${event.eimg }'/>"/></td>
							<td>${event.emname }</td>
							<td>
								<input type="button" class="btn btn-info" value="수정">
								<input type="button" class="btn btn-danger" value="삭제">
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">
							<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
									<h1 class="display-3 text-primary">No Contents</h1>
									<p class="lead">설정된 이벤트가 없습니다.</p>
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		
		</table>
		
	</div>

</div>