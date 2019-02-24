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
			
	<form action="userUpdate.tm" method="POST">
		<div class="panel panel-default">
			<div class="panel-heading"> <h4 >회원개인정보수정하기</h4></div>
				<div class="panel-body">
                    <div class="col-md-12 col-xs-12 col-sm-6 col-lg-10" >
						<div class="container" > 
							<h3><b>${sessionScope.uname}</b> 님의 정보</h3>  
							<input type="hidden" value="${userInfo.unum }" name="unum">
                    	</div>
                    <br>
                    <table class="table">
                    	<tr>
                    		<td width="30%">아이디</td>
                    		<td><input size="35"type="text" value="${userInfo.usid }" name="usid" ></td>
                    	</tr>
                    	<tr>
                    		<td>이름</td> 
                    		<td>${userInfo.uname }</td>
                    	</tr>
                    	<tr>
                    		<td>비빌번호 변경</td>
                    		<td><input size="35" type="password" name="upw"></td>
                    	</tr>
                    	<tr>
                    		<td>비밀번호 확인</td>
                    		<td><input size="35" type="password"></td>
                    	</tr>
                    	<tr>
                    		<td>생년월일</td> 
                    		<td>${userInfo.ubirth }</td>
                    	</tr>
                    	<tr>
                    		<td>선호장르</td>
                    		<td>
                    		<c:forEach var="genre" items="${genreList }">
								<input type="checkBox" name="ugenre" value="${genre.gname }" <c:if test="${fn:contains(userInfo.ugenre,genre.gname) }">checked</c:if> >${genre.gname} &nbsp;
							</c:forEach>
							</td>
                    	</tr>
                    	<tr>
                    		<td>등급</td>
                    		<td>${userInfo.ugrade}
                    			<c:if test="${userInfo.ugrade==1 }">
									<button class="btn" type="button" onclick="location.href='mShipBuyForm.tm'">멤버쉽 등록 하러가기</button><br>
								</c:if>
                    		</td>
                    	</tr>
                    </table>
                  
					<hr> 
						<div class="col-sm-5 col-xs-6 tital " ><p>Date Of Joining  : ${userInfo.udate}</p></div><br> 
				
						<center><input class="btn" type="submit" value="수정완료"/></center>
					</div>
                </div>
		</div>
             </form>
		</div>
	</div>
</body>
</html>





		
		
			
