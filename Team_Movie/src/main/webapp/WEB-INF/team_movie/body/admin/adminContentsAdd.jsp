<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../top.jsp"%>
</head>
<script src="<c:url value='/resources/js/commonScript.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('input[name=thumbnail]').on("change",handleImgFileSelect);
	});
</script>

<body>
<div class="container">
	<h2 class="text-primary">New Contents</h2>
	<input type="button" class="btn btn-secondary" value="목록으로">
	<form method="post" action="addContentsEdit.tm" enctype="multipart/form-data" onsubmit="return addMovieDataChk()">
		<div class="card">
			<div class="card-header bg-dark text-white">
				New Contents
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-5">
						<div align="center">
							<img name ="preview_img" width="50%" src ="<c:url value="/resources/img/sub/no-image.gif"/>"/>
						</div>
						<input class="form-control-file border" type="file" name="thumbnail">
						
						<hr color="lightgrey" style="height: 1px">
						<h3 class="text-primary">Other Data</h3>
						
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="uploadOption" checked="checked" onclick="uploadChk(0)">URL
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="uploadOption" onclick="uploadChk(1)">FILE
						  </label>
						</div>
						<br>
						<span id="url">
							<input class ="form-control" type="text" name ="murl" placeholder="Enter URL..."><br>
						</span>
						<span id="file" style="display: none;">
							<input class="form-control-file border" type="file" name="f_mrepo" disabled="disabled"><br>
						</span>
						<table width="100%">
							<tr>
								<th>관람 자격</th>
								<td>
									<select name="mwcon" class="form-control">
										<option value="1">모든 회원</option>
										<option value="2">스페셜 한정</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
					<!-- 세로 구분선 -->
					<div class="col-sm-1" style="border-left: 1px solid lightgrey;"></div>
	
					<div class="col-sm-6">
						<table width="100%" style="border-collapse: separate; border-spacing: 0 10px;">
							<tr>
								<th>영화 제목</th>
								<td>
									<input class ="form-control" type="text" name="mname">
								</td>
							</tr>
							<tr>
								<th>개봉일</th>
								<td><input class ="form-control" type="date" name="mrdate"></td>
							</tr>
							<tr>
								<th>
									장르
								</th>
								<td>
									<table width="100%">
										<c:out value="<tr>" escapeXml="false"/>
	
											<c:set var="count" value='0'/>
											<c:forEach var="genre" items="${genreList }">
												<%-- <input type="checkbox" name ="mgenre" value="${genre.gnum }">${genre.gname } --%>
												<c:choose>
													<c:when test="${count % 3 != 0 }">
														<c:out value="<td>" escapeXml="false"/>
														<input type="checkbox" name ="mgenre" value="${genre.gname }">${genre.gname }
														<c:out value="</td>" escapeXml="false"/>
													</c:when>
													<c:otherwise>
														
														<c:out value="</tr><tr><td>" escapeXml="false"/>
														<input type="checkbox" name ="mgenre" value="${genre.gname }">${genre.gname }
														<c:out value="</td>" escapeXml="false"/>
													</c:otherwise>
												</c:choose>
												<c:set var="count" value="${count + 1 }"/>
											</c:forEach>
										<c:out value="</tr>" escapeXml="false"/>
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
							<tr>
								<th>시놉시스</th>
								<td>
									<textarea class ="form-control" name ="msynop" cols="20" rows="10"></textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<input type="submit" class="btn btn-primary btn-lg btn-block" value="등록하기">
			</div>
		</div>
	</form>
</div>

</body>
</html>