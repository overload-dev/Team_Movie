<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<%@include file="./../../../common/common.jsp"%>

<body>
	<div class="container">
		<h2 class="text-primary">멤버십 관리</h2>
		<div class="row">
			<div class="col-sm-3" >
				<div class="panel panel-info">
					<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
						<div class="list-group">
							<a href="adminUserEdit.tm" class="list-group-item list-group-item-action">
								회원 관리
							</a>
							<a href="#" class="list-group-item list-group-item-action">
								이벤트
							</a>
							<a href="adminMembershipEdit.tm" class="list-group-item list-group-item-action active">
								멤버십 관리
							</a>
						</div>
			      	</div>
			    </div>
				
			</div>
			
			<div class="col-sm-9">
				<div class="panel panel-info">
					<div class="panel-heading">Membership Sell List</div>
					<div class="panel-body" align="center">
						<table class="table" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>고유번호</th>
									<th>멤버십명</th>
									<th>적용 기간</th>
									<th>가격</th>
									<th>Edit</th>
								</tr>
							</thead>
							<c:forEach var="membership" items="${membershipList }">
								<tr>
									<td align="center">${membership.mbsnum }</td>
									<td align="center">${membership.mbsname}</td>
									<td align="center">${membership.mbsperiod}일</td>
									<td>&#8361; <fmt:formatNumber value="${membership.mbsprice }" pattern="###,###"/></td>
									<td align="center">
										<input type="button" class="btn btn-info" data-toggle="collapse" data-parent="#accordion" value="변경" onclick="location.href='#collapse'3">
										<input type="button" class="btn btn-danger" value="삭제">
									</td>
									<td>
									
									</td>
								</tr>
							</c:forEach>
						</table>
						
						<div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
						        Collapsible Group 3</a>
						      </h4>
						    </div>
						    <div id="collapse3" class="panel-collapse collapse">
						      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
						      commodo consequat.</div>
						    </div>
						  </div>
  
					</div>
					<div class="panel-footer" align="right">
						<input type="button" class="btn btn-primary" value="신규 멤버십 추가">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>