<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</script>

<body>
<div class="container wrap">
	<h2 class="text-primary">New Contents</h2>
	<form method="post" action="updateContentsEdit.tm" enctype="multipart/form-data" onsubmit="return updateMovieDataChk()">
		<input type="hidden" name="mnum" value="${movieBean.mnum }"> 
		<div class="panel panel-info">
			<div class="panel-heading">
				New Contents
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-5">
						<div align="center">
						
							<img name ="preview_img" width="50%" src ="<c:url value="/resources/saveMovieDB/${movieBean.mnum }/${movieBean.mimg}"/>"/>
						</div>
						<input class="form-control-file border" type="file" name="thumbnail">
						<input type="hidden" name="mimg" value=${movieBean.mimg }>
						
						<hr color="lightgrey" style="height: 1px">
						<h3 class="text-primary">Other Data</h3>
						
						<input type="hidden" name="old_murl" value=${movieBean.murl }>
						<input type="hidden" name="mrepo" value=${movieBean.mrepo }>
						
						
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="uploadOption" <c:if test="${movieBean.murl != null }">checked</c:if> onclick="uploadChk(0)">URL
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="radio" class="form-check-input" name="uploadOption" <c:if test="${movieBean.mrepo != null }">checked</c:if> onclick="uploadChk(1)">FILE <c:if test="${movieBean.mrepo != null }">(uploaded: ${movieBean.mrepo})</c:if>
						  </label>
						</div>
						<br>
						<span id="url" style=" <c:if test="${movieBean.murl == null }">display:none;</c:if> ">
							<input class ="form-control" type="text" name ="murl" placeholder="Enter URL..." 
							<c:choose>
								<c:when test="${movieBean.murl != null }">
									value="${movieBean.murl }"
								</c:when>
								<c:otherwise>
									disabled
								</c:otherwise>
							</c:choose>
							value="${movieBean.murl}"><br>
						</span>
						<span id="file" style="<c:if test="${movieBean.mrepo == null }">display:none;</c:if> ">
							
							<input class="form-control-file border" type="file" name="f_mrepo"
								<c:choose>
									<c:when test="${movieBean.mrepo != null}">
										style="display: block;"
									</c:when>
									<c:otherwise>
										disabled
									</c:otherwise>
								</c:choose>
							><br>
						</span>
						<table width="100%">
							<tr>
								<th>관람 자격</th>
								<td>
									<select name="mwcon" class="form-control">
										<option value="1"<c:if test="${movieBean.mwcon == 1}">selected="selected"</c:if>>모든 회원</option>
										<option value="2"<c:if test="${movieBean.mwcon == 2}">selected="selected"</c:if>>스페셜 한정</option>
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
									<input class ="form-control" type="text" name="mname" value="${movieBean.mname }">
								</td>
							</tr>
							<tr>
								<th>개봉일</th>
								<td><input class ="form-control" type="date" name="mrdate" value ="${movieBean.mrdate}"></td>
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
														<input type="checkbox" name ="mgenre" value="${genre.gname }" <c:if test="${fn:contains(movieBean.mgenre,genre.gname) }">checked</c:if>>${genre.gname }
														<c:out value="</td>" escapeXml="false"/>
													</c:when>
													<c:otherwise>
														
														<c:out value="</tr><tr><td>" escapeXml="false"/>
														<input type="checkbox" name ="mgenre" value="${genre.gname }" <c:if test="${fn:contains(movieBean.mgenre,genre.gname) }">checked</c:if>>${genre.gname }
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
									<input class="form-control" type="text" name="mdir" value=${movieBean.mdir }>
								</td>
							</tr>
							<tr>
								<th>연출</th>
								<td>
									<input class="form-control" type="text" name="mpro" value=${movieBean.mpro }>
								</td>
							</tr>
							<tr>
								<th>주연</th>
								<td>
									<input class="form-control" type="text" name="mactor" value=${movieBean.mactor }>
								</td>
							</tr>
							<tr>
								<th>조연</th>
								<td>
									<input class="form-control" type="text" name="msup" value=${movieBean.msup }>
								</td>
							</tr>
							<tr>
								<th>관람 연령</th>
								<td>
									<select class="form-control" name="mage">
										<option value="0" <c:if test="${movieBean.mage == 0}">selected</c:if>>전체 이용가</option>
										<option value="1" <c:if test="${movieBean.mage == 1}">selected</c:if>>12세 이용가</option>
										<option value="2" <c:if test="${movieBean.mage == 2}">selected</c:if>>15세 이용가</option>
										<option value="3" <c:if test="${movieBean.mage == 3}">selected</c:if>>18세 이용가</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>시놉시스</th>
								<td>
									<textarea class ="form-control" name ="msynop" cols="20" rows="10">${movieBean.msynop }</textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="panel-footer" align="center">
				<input type="submit" class="btn btn-primary btn-lg" value="수정하기">
				<input type="button" class="btn btn-secondary btn-lg" value="목록으로" onclick="history.back(-1)">
			</div>
		</div>
	</form>
</div>
<%@include file="../../footer.jsp"%>
</body>
</html>