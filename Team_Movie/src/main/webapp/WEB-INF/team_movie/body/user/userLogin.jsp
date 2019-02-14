<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>LOGINFORM</title>
   <!--Bootsrap4-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <!-- 이 부분은 폰트하고 이미지링크입니다.  -->
    <!--Fontawesome CDN-->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body>
LoginForm.jsp
<div class="container" >
   <div class="d-flex justify-content-center h-100">
      <div class="card">
         <div class="card-header">
            LOGIN
         </div>
         <div class="card-body">
            <form method="POST" action="userLogin.tm"><!-- 아이디 비밀번호가 일치한다면 로그인controller로 이동  -->
            <!-- ID 입력 부분  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text">
                        <i class="fas fa-user"></i>
                     </span>
                  </div>
                  <input type="text" name="usid" class="form-control" placeholder="ID" value="${usid }">
               </div>
               
            <!-- PW 입력부분  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  <input type="password" name="upw" class="form-control" placeholder="PASSWORD">
               </div>
               
            <!-- login 버튼 부분  -->
               <div class="form-group" align="right">  
                  <input type="submit" value="로그인" class="btn login_btn">
               </div> 
            </form> 
         </div>
         <!-- 회원가입 및 ID , PW 찾기  -->
         
         <div class="card-footer">
             
            <div class="d-flex">
               <a href="userInsert.tm">회원가입을 아직 안하셨나요?</a><!--ID찾기 폼으로 이동  -->
            </div>
            <div class="d-flex">
               <a href="findId.tm">ID를 잊으셨나요?</a><!--ID찾기 폼으로 이동  -->
            </div>
            <div class="d-flex">
               <a href="findPw.tm">PASSWORD를 잊으셨나요?</a><!--PASSWORD찾기 폼으로 이동  -->
            </div>
         </div>
      </div> 
   </div>
</div>
</body>
</html>