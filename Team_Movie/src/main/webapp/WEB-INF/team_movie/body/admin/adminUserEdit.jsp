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

<script type="text/javascript">
function myFunction() {
  var input, filter, table, tr, td, i, txtValue, searchAt;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  
  searchAt = document.getElementById("searchAt");
  
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[searchAt.value];
    
    if (td) {
      txtValue = td.textContent || td.innerText;

      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    
<body>

<div class="container">
	<h2 class="text-primary">회원 관리</h2>
	<div class="row">
		<div class="col-sm-3" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
					<div class="panel-body" align="center">
					<div class="list-group">
						<a href="adminUserEdit.tm" class="list-group-item list-group-item-action active">
							회원 관리
						</a>
						<a href="adminContentsEdit.tm" class="list-group-item list-group-item-action">
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
		</div>
		
		
	</div>

</div>
</body>
</html>