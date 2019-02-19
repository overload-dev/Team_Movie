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
		var cf = confirm( '정말 구매 하시겠습니까?' );
	    
		if(cf==true){
			location.href="mShipBuy.tm?mbsnum="+mbsnum
		}else{
			alert("구매취소되었습니다.");
			location.href="mShipBuyForm.tm"
		}
	}
</script>
</head>
<body>
	MShipBuyForm.jsp
	<div class="container">
		<h2 class="text-primary">회원 정보 관리</h2>
		<div class="row">
			<%@ include file="userMenu.jsp" %>
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