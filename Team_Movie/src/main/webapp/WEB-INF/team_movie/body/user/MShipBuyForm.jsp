<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function membershipBuy(mbsnum){
		
		location.href="mShipBuy.tm?mbsnum="+mbsnum
	}
</script>
</head>
<body>
	MShipBuyForm.jsp
	<div class="container">
		<h2 class="text-primary">회원 정보 관리</h2>
		<div class="row">
			<div class="col-sm-3">
				<div class="panel panel-info">
					<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
						<div class="list-group">
							<a href="userUpdate.tm" class="list-group-item list-group-item-action"> 개인 정보 관리 </a> 
							<a href="#" class="list-group-item list-group-item-action active"> 멤버십 </a>
							<a href="userDelete.tm" class="list-group-item list-group-item-action"> 회원 탈퇴 </a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-9">
				<div class="panel panel-info">
					<div class="panel-heading">Membership List</div>
					<div class="panel-body" align="center">
						<table class="table" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>고유번호</th>
									<th>멤버십명</th>
									<th>적용 기간</th>
									<th>가격</th>
									<th>구매</th>
								</tr>
							</thead>
							<c:forEach var="membership" items="${membershipList }">
								<tr>
									<td align="center"><h4>${membership.mbsnum }</h4></td>
									<td align="center"><h4>${membership.mbsname}</h4></td>
									<td align="center"><h4>${membership.mbsperiod}일</h4></td>
									<td> <h4><fmt:formatNumber value="${membership.mbsprice }" pattern="###,###" /></h4></td>
									<td align="center">
										<input type="button" class="btn btn-danger" value="구매하기" onclick="membershipBuy(${membership.mbsnum})">
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>