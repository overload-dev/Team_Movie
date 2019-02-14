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
		<div class="col-sm-4" class="layer_fixed" >
			<div class="panel panel-info">
				<div class="panel-heading">Menu</div>
				<div class="panel-body" align="center">
		      		회원 관리<br>
		      		작품 관리<br>
		      		이벤트<br>
		      	</div>
		    </div>
			
		</div>

		<div class="col-sm-8">
			<table class="table table-striped table-hover" width="100%" height="1000">
				<thead class="thead-dark">
					<tr>
						<th>고유번호</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>생년월일</th>
						<th>선호 장르</th>
						<th>회원 등급</th>
						<th>스페셜 등록 기간</th>
					</tr>
				</thead>
				<c:forEach var ="i" begin="0" end="500">
					<tr>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
						<td>sample</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		
	</div>
	
	
	
</div>
</body>
</html>