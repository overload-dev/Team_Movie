<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp" %>
<html>
<head>
<meta charset="UTF-8">
   <!--Bootsrap4-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
   <!-- 이 부분은 폰트하고 이미지링크입니다.  -->
    <!--Fontawesome CDN-->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   
</head>
<body>
FindIdForm.jsp
<div class="container">
   <div class="d-flex justify-content-center h-100">
      <div class="card">
         <div class="card-header">
            아이디를 잊으셨나요?
         </div>
         <div class="card-body">
            <form method="POST" action="findId.tm"><!-- 이름과 생년월일이 같은 아이디가 있다면 아이디찾기controller로 이동  -->
            <!-- 이름 입력 부분  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text">
                        <i class="fas fa-user"></i>
                     </span>
                  </div>
                  <input type="text" name="uname" class="form-control" placeholder="이름을 입력하세요.">
               </div>
               
            <!-- 생년월일 입력부분  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  
                  <select name="yy">
                  		<c:forEach var="y" begin="1950" end="2019">
                  			<option>
                  				${y}
                  			</option>
                  		</c:forEach>
                  </select> -
                  <select name="mm">
                  		<c:forEach var="m" begin="1" end="12">
                  			<option>
                  				${m}
                  			</option>
                  		</c:forEach>
                  </select> -
                  <select name="dd">
                  		<c:forEach var="d" begin="1" end="31">
                  			<option>
                  				${d}
                  			</option>
                  		</c:forEach>
                  </select> 
               </div>
            
            <!-- 아이디 및 비밀번호 찾기버튼 부분  -->
               <div class="form-group" align="right">
                  <input type="submit" value="아이디찾기" class="btn login_btn">
               </div> 
            </form> 
         </div>
         <!-- 회원가입 및  PW 찾기  -->
         
         <div class="card-footer">
             
            <div class="d-flex">
               <a href="userInsert.tm">아직 회원가입을 안하셨나요??</a><!--회원가입 폼으로 이동  -->
            </div>
            <div class="d-flex">
               <a href="findPw.tm">PASSWORD를 잊으셨나요??</a><!--PASSWORD찾기 폼으로 이동  -->
            </div>
         </div>
      </div> 
   </div>
</div>
</body>
</html>