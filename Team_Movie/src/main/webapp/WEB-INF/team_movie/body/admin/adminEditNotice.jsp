<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-info">
	<div class="panel-heading">
		<div class="row">
			<div class="col-sm-6">
				Notice List
			</div>
			<div class="col-sm-6" align="right">
				<a class="btn btn-info" data-toggle="collapse" href="#newNotice" role="button" aria-expanded="false">새 공지사항 작성</a>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="collapse multi-collapse" id="newNotice">
			<div class="card card-body" align="left">
				<h4 class="text-primary">New Notice</h4>
				<table style="width:100%;">
					<tr>
						<td align="center">
							<font class="text-primary" style="font-weight: bold;">제목</font>
						</td>
						<td>
							<input type="text" class="form-control" name ="bsubject">
						</td>
					</tr>
					<tr>
						<td align="center">
							<font class="text-primary" style="font-weight: bold;">내용</font>
						</td>
						<td>
							<textarea class="form-control" rows="10" style="resize:none;" name="bcon"></textarea>
						</td>
					</tr>
				</table>
				<hr>
				<input type="button" class="btn btn-primary btn-block" value="작성" onclick="addNewNotice()">
			</div>
		</div>
		<hr style="height: 1px" color="#ACB6EA">
		<c:choose>
			<c:when test="${noticeList.size() == 0 }">
				<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
					<h1 class="display-3 text-primary">No Contents</h1>
					<p class="lead">해당 장르의 컨텐츠가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:set var ="count" value="${noticeList.size()}"/>

						<div class="row">
							<div class="col-sm-6" style="padding-left: 50px">
								<font class="text-secondary" style="font-weight: bold;">제목</font>
							</div>
							<div class="col-sm-6" align="right" style="padding-right: 50px">
								<font class="text-secondary" style="font-weight: bold;">등록일</font>
							</div>
						</div>

				<div class="panel-group" id="accordion">					
					<c:forEach var ="notice" items="${noticeList}">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="row">
									<div class="col-sm-2">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
											No. ${count}
										</a>
									</div>
									<div class="col-sm-6">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
											 ${notice.bsubject }
										</a>
									</div>
									<div class="col-sm-4" align="right">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
											<fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/>
										</a>
									</div>
								</div>
							</div>
							<div id="collapse${notice.bnum}" class="panel-collapse collapse">
								<div class="panel-body">
									${notice.bcon }
								</div>
			    			</div>
			  			</div>
			  			<c:set var="count" value="${count - 1 }"/>
		  			</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>