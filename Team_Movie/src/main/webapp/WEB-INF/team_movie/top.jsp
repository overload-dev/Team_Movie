<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<title>Palnet Ark</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="main.tm">Palnet Ark</a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
    <span class="navbar-toggler-icon"></span>
  </button>
    <form class="form-inline my-4 my-lg-0">
      <input class="form-control mr-lg-4" type="text" placeholder="Search">
      <button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
    </form>

  <div class="collapse navbar-collapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
  </div>
  <div>
  <c:choose>
  	<c:when test="${ugrade == null}"><!-- none acount -->
  		<input type="button" class="btn btn-info" name="login" value="Login">
  	</c:when>
  	<c:when test="${ugrade == '0'}"><!-- admin acount -->
  		<a href="">Welcome! ${usid} (${uname})</a>
  	</c:when>
  	<c:when test="${ugrade == '1'}"><!-- normal acount -->
  		<a href="">Welcome! ${usid} (${uname})</a>
  	</c:when>
  	<c:when test="${ugrade == '2'}"><!-- special acount -->
  		<a href="">Welcome! ${usid} (${uname})</a>
  	</c:when>
  </c:choose>  	
  </div>
</nav>




</body>
</html>