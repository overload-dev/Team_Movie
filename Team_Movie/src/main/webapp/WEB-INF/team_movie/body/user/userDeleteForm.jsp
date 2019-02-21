<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function UserDelete(unum){
		var cf = confirm( '정말 회원 탈퇴 하시겠습니까?' );
	    
		if(cf==true){
			alert("회원 탈퇴되었습니다.");
			location.href="userDelete.tm?unum="+unum
		}else{
			alert("탈퇴 취소하였습니다.");
			location.href="userDetail.tm"
		}
	}
</script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-9">
					<div class="panel panel-info">
						<div class="panel-heading">회원탈퇴</div>
							<div class="panel-body">			
								<h4 class="text-primary">${sessionScope.uname} 님 회원 탈퇴 하시겠습니까?</h4>								
								<input type="button" value="탈퇴하기" onclick="UserDelete(${userInfo.unum })">	
							</div>
					</div> 
			</div>
		</div>
	</div>
</body>
</html>