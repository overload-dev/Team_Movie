<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FINDIDFORM</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
   <!--Bootstrap �� css �߰��� �κ� -->
   <!--Bootsrap4-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
   <!-- �� �κ��� ��Ʈ�ϰ� �̹�����ũ�Դϴ�.  -->
    <!--Fontawesome CDN-->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   
</head>
<body>
FindIdForm.jsp
<div class="container">
   <div class="d-flex justify-content-center h-100">
      <div class="card">
         <div class="card-header">
            ���̵� �����̳���?
         </div>
         <div class="card-body">
            <form method="POST" action="findId.tm"><!-- �̸��� ��������� ���� ���̵� �ִٸ� ���̵�ã��controller�� �̵�  -->
            <!-- �̸� �Է� �κ�  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text">
                        <i class="fas fa-user"></i>
                     </span>
                  </div>
                  <input type="text" name="uname" class="form-control" placeholder="�̸��� �Է��ϼ���.">
               </div>
               
            <!-- ������� �Էºκ�  -->
               <div class="input-group form-group">
                  <div class="input-group-prepend">
                     <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  <!-- name �߰� �� �� name="ubirth"  -->
                  <input type="text" class="form-control" placeholder="������� 8�ڸ� �Է��ϼ���.">
               </div>
            
            <!-- ���̵� �� ��й�ȣ ã���ư �κ�  -->
               <div class="form-group" align="right">
                  <input type="submit" value="���̵�ã��" class="btn login_btn">
               </div> 
            </form> 
         </div>
         <!-- ȸ������ ��  PW ã��  -->
         
         <div class="card-footer">
             
            <div class="d-flex">
               <a href="usertInsert.tm">���� ȸ�������� ���ϼ̳���??</a><!--ȸ������ ������ �̵�  -->
            </div>
            <div class="d-flex">
               <a href="#">PASSWORD�� �����̳���??</a><!--PASSWORDã�� ������ �̵�  -->
            </div>
         </div>
      </div> 
   </div>
</div>
</body>
</html>