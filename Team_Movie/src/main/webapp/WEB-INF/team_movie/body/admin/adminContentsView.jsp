<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<body>
<div class="container">
	<h2></h2>
	
	<input type="button" class="btn btn-secondary" value="목록으로" onclick="history.go(-1)">
	<div class="card">
	 	<div class="card-header bg-dark text-white">
	 		Movie Profile
	 	</div>
		<div class="card-body">
		
			<div class="row">
				<div class="col-sm-6" align="center">
				
					<img
						src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289a21bfc39a73f3702f1000356f5d85b90b25cae3d483b159e8a5349d562fb69e"
						width="75%">
				</div>
				<div class="col-sm-6">
					<h2 class="text-primary">${movieBean.mname }</h2>
					<table width="100%">
						<tr>
							<th>영화 명</th>
							<td>${movieBean.mname } | ${movieBean.mruntime}</td>
						</tr>
						<tr>
							<th>개봉일</th>
							<td>
								<fmt:formatDate value="${movieBean.mrdate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<th>관람 연령</th>
							<td>
								<c:choose>
									<c:when test="${movieBean.mage == 0}"><font color="green">전체</font></c:when>
									<c:when test="${movieBean.mage == 1}"><font color="blue">12세</font></c:when>
									<c:when test="${movieBean.mage == 2}"><font color="orange">15세</font></c:when>
									<c:otherwise><font color="red">18세</font></c:otherwise>
								</c:choose>
							</td>
						</tr>
						</table>
						<hr>
						<table width="100%">
						<tr>
							<td colspan="2">
								<b>시놉시스</b>
								<br><br>
								${movieBean.msynop }
							</td>
						</tr>
					</table>
					<hr>
					<table width="100%">
						<tr>
							<th>감독</th>
							<td>${movieBean.mdir }</td>
						</tr>
						<tr>
							<th>연출</th>
							<td>${movieBean.mpro }</td>
						</tr>
						<tr>
							<th>주연</th>
							<td>${movieBean.mactor }</td>
						</tr>
						<tr>
							<th>조연</th>
							<td>${movieBean.msup }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<div class="row">
				<div class="col-sm-6">
					<h4 class="text-primary">운영 정보</h4>
					<table width="100%">
						<tr>
							<th>업로드</th>
							<td><fmt:formatDate value="${movieBean.midate}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<th>관람 회원 등급</th>
							<td>
								<c:choose>
									<c:when test="${movieBean.mwcon == 1}">
										무료 관람
									</c:when>
									<c:otherwise>
										스페셜
									</c:otherwise>
								</c:choose>	
							</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td>${movieBean.mrcount }</td>
						</tr>
						<tr>
							<th>URL</th>
							<td>${movieBean.murl}</td>
						</tr>
						<tr>
							<th>저장소</th>
							<td>${movieBean.mrepo }</td>						
						</tr>
						
						
					</table>
				</div>
				<!-- 세로 구분선 -->
				<div class="col-sm-1" style="border-left: 1px solid lightgrey;"></div>
				<div class="col-sm-5" >
					
					<input type="button" class="btn btn-info" value="상영 페이지">
					<input type="button" class="btn btn-primary" value="수정">
					<input type="button" class="btn btn-danger" value="삭제">
					
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</html>