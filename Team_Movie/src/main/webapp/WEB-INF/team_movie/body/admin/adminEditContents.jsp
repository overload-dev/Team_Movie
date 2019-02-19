<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-info">
	<div class="panel-heading">Contents List</div>
	<div class="panel-body" align="center">
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
		<table class="table">
			<thead class="thead">
				<tr>
					<th>고유번호</th>
					<th>섬네일</th>
					<th>컨텐츠 이름</th>
					<th>장르</th>
					<th>관람 연령</th>
					<th>개봉일</th>
					<th>업로드일</th>
					<th>관람 회원 등급</th>
					<th>Edit</th>
				</tr>
			</thead>
			<c:forEach var="movie" items="${movieList}">
				<tr>
					<td>${movie.mnum }</td>
					<td><img src="${movie.mimg }" width="80px"> <img
						src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289a21bfc39a73f3702f1000356f5d85b90b25cae3d483b159e8a5349d562fb69e"
						width="80px"></td>
					<td>${movie.mname }</td>
					<td>${movie.mgenre }</td>
					<td>${movie.mage }</td>
					<td><fmt:formatDate value="${movie.mrdate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${movie.midate}" pattern="yyyy-MM-dd" /></td>
					<td>${movie.mwcon }</td>
					<td><input type="button" class="btn btn-info" value="View"
						onclick="location.href='adminContentsView.tm?mnum=${movie.mnum}'">
					</td>
				</tr>		
			</c:forEach>
		</table>
	</div>
</div>