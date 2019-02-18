<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<%@include file="./../../../common/common.jsp"%>

<script src="<c:url value='/resources/js/commonScript.js'/>"></script>

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
										<a class="btn btn-info" 
										   data-toggle="collapse"
										   href="#editMembership${membership.mbsnum }"
										   role="button" aria-expanded="false">변경</a>
										<input type="button" class="btn btn-danger" value="삭제" onclick="deleteMembershipEdit(${membership.mbsnum},'${membership.mbsname}')">
									</td>									
								</tr>
								<tr>
									<td colspan="5">
										<div class="collapse multi-collapse" id="editMembership${membership.mbsnum }">
									      <div class="card card-body">
									      <h2 class="text-primary">Change Membership</h2>
									        <table>
									        	<tr>
									        		<th>멤버십 명</th>
									        		<td>
									        			<input class="form-control" type="text" placeholder="멤버십 명" name="c_mbsname${membership.mbsnum}" value="${membership.mbsname}">
									        		</td>
									        	</tr>
									        	<tr>
									        		<th>적용 기간</th>
									        		<td>
									        			<input class="form-control" type="text" placeholder="적용 기간(일 단위)" name="c_mbsperiod${membership.mbsnum}" value="${membership.mbsperiod}">
									        		</td>
									        	</tr>
									        	<tr>
									        		<th>가격</th>
									        		<td>
									        			<input class="form-control" type="text" placeholder="가격" name="c_mbsprice${membership.mbsnum}" value="${membership.mbsprice}">
									        		</td>
									        	</tr>
									        	<tr>
									        		<td colspan="2" align="center">
									        			<input class="btn btn-primary" type="button" value="변경사항 적용" onclick="changeMembershipEdit(${membership.mbsnum})">
									        		</td>
									        	</tr>
									        </table>
									      </div>
									    </div>
									
									</td>
								</tr>
							</c:forEach>
						</table>  
					</div>
					<div class="panel-footer" align="center">
						
						<a class="btn btn-info" 
							data-toggle="collapse"
							href="#newMembership"
							role="button" aria-expanded="false">신규 멤버십 추가</a>
						<hr>
						
						<div class="collapse multi-collapse" id="newMembership">
							<div class="card card-body" align="left">
								<h2 class="text-primary">New Membership</h2>
								<table class="table" cellspacing="0" width="100%">
									<tr>
										<th>멤버십 명</th>
										<td>
											<input class="form-control" type="text" placeholder="멤버십 명" name="n_mbsname">
										</td>
									</tr>
									<tr>
										<th>적용 기간</th>
										<td>
											<input class="form-control" type="text" placeholder="적용 기간(일 단위)" name="n_mbsperiod">
										</td>
									</tr>
									<tr>
										<th>가격</th>
										<td>
											<input class="form-control" type="text" placeholder="가격" name="n_mbsprice">
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<input class="btn btn-primary" type="button" value="추가" onclick="addMembershipEdit()">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>