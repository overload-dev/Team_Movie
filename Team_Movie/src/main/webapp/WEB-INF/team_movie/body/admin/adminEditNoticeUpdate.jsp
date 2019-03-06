<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../../top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<body>
	<div class="container wrap">
		<h2 class="text-primary">공지사항 수정</h2>
		<form action="updateNoticeEdit.tm" method="post" id="frm">
			<input type="hidden" name="bnum" value="${boardBean.bnum }">
			<input type="hidden" name="textFileName" value="${textFileName }">
		
			<div class="input-group">
		    	<span class="input-group-addon">공지사항 제목</span>
		    	<input type="text" class="form-control" name="bsubject" placeholder="Title" value="${boardBean.bsubject}">
		  	</div>
		  	<hr>
		    <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
		    	${boardBean.bcon }
		    </textarea>
		    <hr>
		    <div align="center">
		    	<input type="button" class="btn btn-primary" id="savebutton" value="수정" />
	    <input type="button" class="btn btn-secondary"  value="취소" onclick="location.href='adminNoticeEdit.tm'" />
		    </div>
		</form>
		
		
		<script type="text/javascript">
		$(function(){
		    //전역변수선언
		    var editor_object = [];
		     
		    nhn.husky.EZCreator.createInIFrame({
		        oAppRef: editor_object,
		        elPlaceHolder: "smarteditor",
		        sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",
		        htParams : {
		            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseToolbar : true,            
		            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseVerticalResizer : true,    
		            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseModeChanger : true,
		        }
		    });
		     
		    //전송버튼 클릭이벤트
		    $("#savebutton").click(function(){
		        //id가 smarteditor인 textarea에 에디터에서 대입
		        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		         
		        // 이부분에 에디터 validation 검증
		         
		        //폼 submit
		        $("#frm").submit();
		    })
		})
		</script>
	</div>
<%@include file="../../footer.jsp"%>
</body>
</html>