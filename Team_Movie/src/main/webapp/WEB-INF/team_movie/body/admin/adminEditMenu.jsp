<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
/* $(document).ready(function(){
	var getPage = String(${Selpage});
	
	alert(getPage);
	alert($.type(getPage));
	alert(getPage.indexOf("adminEditContents"));
	
	if(getPage.indexOf("adminEditContents") != -1){
		alert("edit");
		$('a[id=adminEditContents]').removeClass('active');
		$('a[id=adminEditContents]').addClass('active');
	}
	
	
	if(getPage.indexOf("adminEditUser",getPage) != -1){
		alert("edit" + getPage);
		$('a[id=adminEditUser]').removeClass('active');
		$('a[id=adminEditUser]').addClass('active');
	}
	
}); */
</script>
<div class="panel panel-info">
	<div class="list-group">
		<a id="adminEditUser" href="adminUserEdit.tm" class="list-group-item list-group-item-action"> 회원 관리 </a>
		<a id="adminEditContents" href="adminContentsEdit.tm" class="list-group-item list-group-item-action"> 컨텐츠 관리 </a>
		<a href="#" class="list-group-item list-group-item-action"> 이벤트 </a>
		<a href="adminMembershipEdit.tm" class="list-group-item list-group-item-action"> 멤버십 관리 </a>
	</div>
</div>
