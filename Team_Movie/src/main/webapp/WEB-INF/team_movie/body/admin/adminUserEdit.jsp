<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@include file="../../top.jsp"%>
<%@include file="./../../../common/common.jsp"%>

</head>
<style type="text/css">
        .layer_fixed
        {
            height:35px;
            width:100%;
            color: #555;
            font-size:12px;
            position:fixed;
            z-index:999;
            top:0px;
            left:0px;
            -webkit-box-shadow: 0 1px 2px 0 #777;
            box-shadow: 0 1px 2px 0 #777;
            background-color:#ccc;
        }
    </style>
    
<body>

<div class="container">
	<h2 class="text-primary">회원 관리</h2>
	<div class="row">
		<div class="col-sm-3" class="layer_fixed" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">
							회원 관리
						</a>
						<a href="#" class="list-group-item list-group-item-action">
							이벤트
						</a>
						<a href="#" class="list-group-item list-group-item-action">
							멤버십 관리
						</a>
					</div>
		      	</div>
		    </div>
			
		</div>

		<div class="col-sm-9">
			<table class="table table-striped table-hover" width="100%" >
				<thead class="thead-dark">
					<tr>
						<th><input type="checkbox"></th>
						<th>고유번호</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>생년월일</th>
						<th>선호 장르</th>
						<th>멤버십</th>
						<th>스페셜 등록 기간</th>
						<th>강제 탈퇴</th>
					</tr>
				</thead>
				<c:forEach var ="user" items="${userList}">
					<tr>
						<td><input type="checkbox" value="${user.unum }"></td>
						<td>${user.unum }</td>
						<td>${user.usid }</td>
						<td>${user.uname }</td>
						<td>
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
						<td>
						
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
						<td>${user.uupstart } ~ ${user.uupend }</td>
						<td>
							<c:if test="${user.ugrade !='0'}">
								<input type="button" class="btn btn-danger" value="Del" onclick="location.href='adminUserDel.tm?unum=${user.unum }'">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		
	</div>
	
	
	
</div>
</body>
</html>