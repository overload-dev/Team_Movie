<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../../top.jsp"%>
<%@include file="./../../../common/common.jsp"%>

adminContentsEdit.jsp
	<div class="container">
		<h2 class="text-primary">컨텐츠 관리</h2>
		<div class="row">
			<div class="col-sm-3" >
				<div class="panel panel-info">
					<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
						<div class="list-group">
							<a href="adminUserEdit.tm" class="list-group-item list-group-item-action">
								회원 관리
							</a>
							<a href="adminContentsEdit.tm" class="list-group-item list-group-item-action active">
								컨텐츠 관리
							</a>
							<a href="#" class="list-group-item list-group-item-action">
								이벤트
							</a>
							<a href="adminMembershipEdit.tm" class="list-group-item list-group-item-action">
								멤버십 관리
							</a>
						</div>
			      	</div>
			    </div>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-info">
					<div class="panel-heading">Contents List</div>
					<div class="panel-body" align="center">
						<table class="table">
							<thead class="thead">
								<tr>
									<th>고유번호</th>
									<th>컨텐츠 이름</th>
									<th>장르</th>
									<th>관람 연령</th>
									<th>영화 요소</th>
									<th>개봉일</th>
									<th>업로드일</th>
									<th>관람 회원 등급</th>
								</tr>
							</thead>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>