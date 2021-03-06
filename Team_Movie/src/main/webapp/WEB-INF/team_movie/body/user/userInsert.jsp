<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="../../top.jsp"%>
<script type="text/javascript">
var isCheck = false;
var isChange = false;
// 중복체크
$(document).ready(function() {
	var use;
	var isBlank = false;
	$("input[name=usid]").keydown(function() {
		isChange = true;
		use = "";
		$("#idmessage").css("display", "none");
	})
	$("input[name=id_check]").click(function() {
		isCheck = true;
		isChange = false;
		isBlank = false;

		if ($('input[name=usid]').val() == "") {
			alert("사용 할 아이디를 입력하세요.");
			isBlank = true;
			return false;
			}
		$.ajax({url : "idCheck.tm",
				data : ({"usid" : $("input[name=usid]").val()}),
				success : function(data) {
					if (jQuery.trim(data) == 'YES') {
						$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
						$('#idmessage').show();
						use = "possible";} 
					else {$('#idmessage').html("<font color=red>이미 사용중인 아이디 입니다.</font>");
						$('#idmessage').show();
						use = "impossible";
										}
					}
		});// ajax()의 끝
	})
})
</script>
</head> 
<body>
	<div class="container wrap">
		<div class="d-flex justify-content-center h-100">
      		<div class="card">
      			<div class="card-header">
					<h2>회원 가입</h2> 
         		</div>
         		<div class="card-body">
						<form method="POST" name="userInsert" id="userInsert" >
						<!-- 가입일자와 회원등급을 controller로 보내줌  -->
						<input type="hidden" name="ugrade" value="1">
						<!-- 아이디 입력  --> 
						<div class="form-group">
							<label class="col-sm-12">아이디</label>
							<div class="col-sm-12">    
								<input type="text" name="usid" placeholder="사용 할 ID를 입력하세요." class="form-control" >
								<input type="button" value="중복확인 " class="btn login_btn" name="id_check" >
								<span id="idmessage" style="display:none;">idmessage</span>
		 					</div>
						</div>
						<!-- 닉네임 입력  --> 
						<div class="form-group"> 
							<label class="col-sm-12">닉네임</label>
							<div class="col-sm-12">
								<input type="text" name="uname" placeholder="사용 할 닉네임을 입력하세요." class="form-control" >
			 				</div>
						</div>
						<!-- 비밀번호 입력  -->
						<div class="form-group">
							<label class="col-sm-12">비밀 번호</label>
							<div class="col-sm-12">
								<input type="password" name="upw" placeholder="비밀번호를 입력하세요." class="form-control" >
							</div>
						</div>
						<!-- 비밀번호 확인  -->
						<div class="form-group">
							<label for="password"  class="col-sm-12">비밀 번호 확인</label>
							<div class="col-sm-12">
								<input type="password" name="upwCheck" placeholder="비밀번호를 확인해주세요." class="form-control">
							</div>
						</div>  
			      		<!-- 생년 월일   --> 
						<div class="form-group">
							<label class="col-sm-12 control-label">생년월일</label>   
							<div class="col-sm-12">
								<input type="date" id="testDatepicker" name="ubirth" class="form-control"> 
							</div>
						</div>  
						<!-- 선호 장르 선택  -->     
						<div class="form-group">
							<label class="control-label col-sm-12">선호 장르</label>
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
								 		<label>
								 			<c:forEach var="genre" items="${genreList}">
								 				<input type="checkbox" name="ugenre" value="${genre.gname }">${genre.gname}&nbsp;&nbsp;
								 			</c:forEach>
										 </label>
									</div>
								</div>
							</div>
						</div>
						<center>
						<c:set var="ugrade" value="1"/>
							<input type="button" value="가입하기 " id="check" class="btn login_btn" onclick="Validation(${ugrade})">
						</center>
					
					</form>
					<!-- /form -->
				</div> 
			</div>
		</div>
	</div>
	<!-- ./container -->
<%@include file="../../footer.jsp"%>
</body>
</html>
