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
				<input type="button" class="btn btn-info" value="새 공지사항 작성" onclick="location.href='writeNoticeEdit.tm'">
			</div>
		</div>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${noticeList.size() == 0 }">
				<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
					<h1 class="display-3 text-primary">No Contents</h1>
					<p class="lead">공지사항이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:set var ="count" value="${noticeList.size()}"/>

						<div class="row">
							<div class="col-sm-2">
								<font class="text-secondary" style="font-weight: bold;">No.</font>			
							</div>
							<div class="col-sm-4" style="padding-left: 50px">
								<font class="text-secondary" style="font-weight: bold;">제목</font>
							</div>
							<div class="col-sm-3" align="right">
								<font class="text-secondary" style="font-weight: bold;">등록일</font>
							</div>
							<div class="col-sm-3" align="center">
								<font class="text-secondary" style="font-weight: bold;">Edit</font>
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
									<div class="col-sm-4">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
											 ${notice.bsubject }
										</a>
									</div>
									<div class="col-sm-3" align="right">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse${notice.bnum}">
											<fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/>
										</a>
									</div>
									<div class="col-sm-3" align="right">
										<input type="button" class="btn btn-info" value="수정" onclick="location.href='updateNoticeEdit.tm?bnum=${notice.bnum}'">
										<input type="button" class="btn btn-danger" value="삭제" onclick="deleteNotice(${notice.bnum})">
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