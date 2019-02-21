<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
		 		<form action="userUpdate.tm" method="POST">
					<div class="panel panel-info">
						<div class="panel-heading">User List</div>
							<div class="panel-body">			
								<h4 class="text-primary">${sessionScope.uname} 님의 정보</h4>
							<input type="hidden" value="${userInfo.unum }" name="unum">
							
							아이디 : <input type="text" value="${userInfo.usid }" name="usid" ><br>
							
							이름 : ${userInfo.uname }<br>
							
							비밀번호 변경 : <input type="password" name="upw"> <br>
							
							비밀번호 변경 확인: <input type="password"><br>
							
							생년월일 : ${userInfo.ubirth } <br>
							
							선호장르 :<input type="checkBox" name="ugenre" value="코미디" <c:if test="${fn:contains(userInfo.ugenre,'코미디') }">checked</c:if>	>코미디 
									<input type="checkBox" name="ugenre" value="범죄" <c:if test="${fn:contains(userInfo.ugenre,'범죄') }">checked</c:if>		>범죄
									<input type="checkBox" name="ugenre" value="스릴러" <c:if test="${fn:contains(userInfo.ugenre,'스릴러') }">checked</c:if>	>스릴러
									<input type="checkBox" name="ugenre" value="공포" <c:if test="${fn:contains(userInfo.ugenre,'공포') }">checked</c:if>		>공포
									<input type="checkBox" name="ugenre" value="드라마" <c:if test="${fn:contains(userInfo.ugenre,'드라마') }">checked</c:if>	>드라마
									<input type="checkBox" name="ugenre" value="멜로" <c:if test="${fn:contains(userInfo.ugenre,'멜로') }">checked</c:if>		>멜로
									<br>
							멤버 등급 : ${userInfo.ugrade} <br>
				
							<c:if test="${userInfo.ugrade==1 }">
								<button type="button" onclick="location.href='mShipBuyForm.tm'">멤버쉽 등록 하러가기</button><br>
							</c:if>
							
							가입일자 : ${userInfo.udate}<br>
						</div> 
					</div> 
					<input type="submit" value="수정완료"/>
					</form>
			</div>
		</div>
	</div>
</body>
</html>