<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../top.jsp"%>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$('input[name=thumbnail]').on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files= e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert(f.type);
				alert("이미지 파일만 올려주세요.");
				return;
			}
			
			var reader = new FileReader();
			reader.onload = function(e){
				$('img[name=preview_img]').attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>

<body>
adminContentsAdd.jsp
<div class="container">
	<h2 class="text-primary">New Contents</h2>
	
	<div class="card">
		<div class="card-header bg-dark text-white">
			New Contents
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-5">
					<div align="center">
						<img name ="preview_img" width="75%" src ="<c:url value="/resources/img/sub/no-image.gif"/>"/>
					</div>
					<input type="file" name="thumbnail">
				</div>
				<!-- 세로 구분선 -->
				<div class="col-sm-1" style="border-left: 1px solid lightgrey;"></div>

				<div class="col-sm-6">
					<h3 class="text-primary">상세 정보</h3>
					<table width="100%">
						<tr>
							<th>
								영화 제목
							</th>
							<td>
								<input class ="form-control" type="text" name="mname">
							</td>
						</tr>
						<tr>
							<th>개봉일</th>
							<td><input class ="form-control" type="date"></td>
						</tr>
						
						<tr>
							<th>
								장르
							</th>
							<td>
								<table width="100%">
									<tr>
										<c:set var="count" value='0'/>
										<c:forEach var="genre" items="${genreList }">
											<%-- <input type="checkbox" name ="mgenre" value="${genre.gnum }">${genre.gname } --%>
											<c:choose>
												<c:when test="${count % 3 != 0 }">
													<td><input type="checkbox" name ="mgenre" value="${genre.gnum }">${genre.gname }</td>
												</c:when>
												<c:otherwise>
													</tr>
													<tr><td><input type="checkbox" name ="mgenre" value="${genre.gnum }">${genre.gname }</td>
												</c:otherwise>
											</c:choose>
											<c:set var="count" value="${count + 1 }"/>
										</c:forEach>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>감독</th>
							<td>
								<input class="form-control" type="text" name="mdir">
							</td>
						</tr>
						<tr>
							<th>연출</th>
							<td>
								<input class="form-control" type="text" name="mpro">
							</td>
						</tr>
						<tr>
							<th>주연</th>
							<td>
								<input class="form-control" type="text" name="mactor">
							</td>
						</tr>
						<tr>
							<th>조연</th>
							<td>
								<input class="form-control" type="text" name="msup">
							</td>
						</tr>
						<tr>
							<th>관람 연령</th>
							<td>
								<select class="form-control" name="mage">
									<option value="0">전체 이용가</option>
									<option value="1">12세 이용가</option>
									<option value="2">15세 이용가</option>
									<option value="3">18세 이용가</option>
								</select>
							</td>
						</tr>
					</table>
					
					
				</div>
			
			</div>
		
		</div>
		
		<div class="card-footer">
		</div>
	</div>
	
</div>
</body>
</html>