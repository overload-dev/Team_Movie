<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-info">
<div class="panel-heading">User List</div>
<div class="panel-body">			
	<h4 class="text-primary">Search Tool</h4>
		<div class="form-group row" align="center">
			<div class="col-xs-4">
				<select id="searchAt" class="form-control">
					<option value="1">고유번호</option>
					<option value="2">아이디</option>
					<option value="3">닉네임</option>
					<option value="6">선호 장르</option>
					<option value="7">멤버십</option>
				</select>
			</div>
			<div class="col-xs-6">
				<input class="form-control"type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
			</div>
		</div>
		<hr>
		<b>가입 멤버 : ${fn:length(userList) } 명</b>
		<table id="myTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
			<thead class="thead-dark">
				<tr class="header">
					<th class="th-sm" align="center"><input type="checkbox"></th>
					<th class="th-sm" align="center">고유번호</th>
					<th class="th-sm" align="center">아이디</th>
					<th class="th-sm" align="center">닉네임</th>
					<th class="th-sm" align="center">가입일</th>
					<th class="th-sm" align="center">생년월일</th>
					<th class="th-sm" align="center">선호 장르</th>
					<th class="th-sm" align="center">멤버십</th>
					<th class="th-sm" align="center">스페셜 등록 기간</th>
					<th class="th-sm" align="center">강제 탈퇴</th>
				</tr>
			</thead>
			<c:forEach var ="user" items="${userList}">
			<tr>
				<td><input type="checkbox" value="${user.unum }"></td>
				<td align="center">${user.unum }</td>
				<td align="center">${user.usid }</td>
				<td align="center">${user.uname }</td>
				<td align="center">
					<fmt:formatDate value="${user.udate}" pattern="yyyy-MM-dd"/>	
				</td>
				<td>
					<fmt:formatDate value="${user.ubirth}" pattern="yyyy-MM-dd"/>
					<!-- 날짜 비교해 오늘이 생일인 경우 뱃지 출력 -->
					<jsp:useBean id="toDay" class="java.util.Date" />
					<fmt:formatDate value="${toDay}" pattern="MM-dd" var ="todays"/>
					<fmt:formatDate value="${user.ubirth}" pattern="MM-dd" var="userbirth"/>
						<c:if test="${userbirth == '01-01' }">
						<span class="badge badge-primary">ToDay</span>
					</c:if>
				</td>
				<td>${user.ugenre }</td>
				<td align="center">
					<c:choose>
						<c:when test="${user.ugrade =='0'}">
							Admin
						</c:when>
						<c:when test="${user.ugrade =='1'}">
							Normal
						</c:when>
						<c:otherwise>
							Spatial
						</c:otherwise>
					</c:choose>						
				</td>
				<td align="center">
					<c:choose>
						<c:when test="${user.ugrade =='2'}">
							<td>${user.uupstart } ~ ${user.uupend }</td>
						</c:when>
						<c:otherwise>
							해당 없음
						</c:otherwise>
					</c:choose>
				<td align="center">
					<c:if test="${user.ugrade !='0'}">
						<input type="button" class="btn btn-danger" value="Del" onclick="location.href='adminUserDel.tm?unum=${user.unum }'">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>