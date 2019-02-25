<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-info">
	<div class="panel-heading">Contents List (서비스 중인 컨텐츠 수: ${fn:length(movieList)})</div>
	<div class="panel-body" align="right">
		<h3 class="text-primary" align="left">장르 분포 현황</h3>
		<hr>
		<c:forEach var="genre" items="${genreList}">
			<c:set var="count" value="0" />
			<c:forEach var="movie" items="${movieList }">
				<c:if test="${fn:contains(movie.mgenre, genre.gname)}">
					<c:set var="count" value="${count + 1}" />
				</c:if>
			</c:forEach>
			<c:if test="${count > 0 }">
				<div class="progress">
					<div class="progress-bar progress-bar-striped"
						style="width:${(count / fn:length(movieList))*100}%">${genre.gname}(${count})</div>
				</div>
			</c:if>
		</c:forEach>
		<hr>
		<input type="button" class="btn btn-primary" value="신규 컨텐츠 추가" onclick="location.href='addContentsEdit.tm'">
		<table class="table">
			<thead class="thead">
				<tr>
					<th>번호</th>
					<!-- <th>섬네일</th> -->
					<th>이름</th>
					<th>장르</th>
					<th>관람 연령</th>
					<th>개봉일</th>
					<th>업로드일</th>
					<th>관람 등급</th>
					<th>Edit</th>
				</tr>
			</thead>
			<c:forEach var="movie" items="${movieList}">
				<tr>
					<td>${movie.mnum }</td>
					<%-- <img src="${movie.mimg }" width="80px"> --%>
<!-- 					<img
						src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289a21bfc39a73f3702f1000356f5d85b90b25cae3d483b159e8a5349d562fb69e"
						width="80px"> -->

					
					<td>${movie.mname }</td>
					<td>${movie.mgenre }</td>
					<td width="10%">
						<c:choose>
							<c:when test="${movie.mage == 0}"><font color="green">전체</font></c:when>
							<c:when test="${movie.mage == 1}"><font color="blue">12세</font></c:when>
							<c:when test="${movie.mage == 2}"><font color="orange">15세</font></c:when>
							<c:otherwise><font color="red">18세</font></c:otherwise>
						</c:choose>
						<br>
						<%-- <img width="80%" src="<c:url value='/resources/img/classification/${movie.mage}.png'/>"/> --%>
					</td>
					<td><fmt:formatDate value="${movie.mrdate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${movie.midate}" pattern="yyyy-MM-dd" /></td>
					<td>
					<c:choose>
						<c:when test="${movie.mwcon == 1}">
							전체 회원
						</c:when>
						<c:otherwise>
							스페셜 한정
						</c:otherwise>
					</c:choose>				
					</td>
					<td>
					<div class="btn-group" role="group">
						<input type="button" class="btn btn-info" value="View" onclick="location.href='adminContentsView.tm?mnum=${movie.mnum}'">
						<input type="button" class="btn btn-danger" value="Del" onclick="location.href='deleteContentsEdit.tm?mnum=${movie.mnum}'">
					</div>
					</td>
				</tr>		
			</c:forEach>
		</table>
	</div>
</div>