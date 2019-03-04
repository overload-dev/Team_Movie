<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="panel panel-default">
	<div class="panel-heading"><h4>멤버십 구매 이력</h4></div>
	<div class="panel-body" align="center">
		<table class="table" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>No.</th>
					<th>구매 패키지</th>
					<th>패키지 가격</th>
					<th>기간</th>
					<th>적용일</th>
					<th>종료일</th>
					<th>만료 여부</th>
				</tr>
			</thead>
				
			<c:set var="count" value="${fn:length(membershipLogList) }"/>
			
			<c:choose>
				<c:when test="${count <= 0}">
					<tr>
						<td colspan="7">
							<div class="jumbotron jumbotron-fluid">
								<h1 class="display-3 text-primary">No Contents</h1>
								<p class="lead">결제 이력이 없습니다.</p>
							</div>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
					<c:forEach var="mlog" items="${membershipLogList}">
						<tr>
							<td>${count }</td>
							<td>${mlog.mlmbsname }</td>
							<td><fmt:formatNumber value="${mlog.mlmbsprice }" pattern="###,###" /> 원</td>
							<td>${mlog.mlmbsperiod }</td>
							<td>${mlog.mlupstart }</td>
							<td>${mlog.mlupend }</td>
							<td>
								<c:choose>
									<c:when test="${mlog.mlupend > nowDate}"><font style="color: orange; font-weight: bold;">유효</font></c:when>
									<c:otherwise><font style="color: red; font-weight: bold;">만료</font></c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:set var="count" value="${count -1 }"/>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>