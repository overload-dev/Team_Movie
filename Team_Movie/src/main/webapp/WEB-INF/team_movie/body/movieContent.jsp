<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
/*
 * 댓글 등록하기(Ajax)
 */

function movie_description(io,mnum){	
	if(io == '0'){
		$("span." + mnum).show();		
	}else{
		$("span." + mnum).hide();		
	}
}
</script>
<style type="text/css">
	.movie-detail-desc{
			margin-bottom: 10px;
			}
</style>
			
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">

</head>
<body>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 40px;">${movie.mname }</font>
			</div>
			<div class="panel-body">
				<c:if test="${movie.mrepo == null }">
					<div style="position:relative;height:0;padding-bottom:56.25%">
						<iframe src="${movie.murl}" style="position:absolute; width:100%; height:100%;" frameborder="0" allowfullscreen></iframe>
					</div>
				</c:if>
				<c:if test="${movie.murl == null }">
					<!-- 동영상 처리 로직 -->
					<video poster="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" class="video-js vjs-default-skin" width="100%" height="100%" src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mrepo}"/>"  controls="controls">
               			<source src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mrepo}"/>" type="video/mp4" />
               			<p>지원하지 않는 브라우저입니다.</p>
            		</video>
				</c:if>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">${movie.mname }</font>
				<div class="pull-right">
					<c:if test="${sessionScope.usid eq null or sessionScope.usid ne 'admin' }">
						<a href="#comment">
	          				<span class="glyphicon glyphicon-pencil" style="font-size:18px;" title="댓글쓰기"></span>
	        			</a>
	        			&nbsp;&nbsp;
	        			<c:if test="${likeCount == 0 }">
	        			<a href="#" onclick="movieLike(${movie.mnum }, ${sessionScope.unum })">
	    	      			<span id="like" class="glyphicon glyphicon-heart-empty" style="font-size:18px;" title="좋아요"></span>
	    	      			<span style="display:none" id="unLike" class="glyphicon glyphicon-heart" style="font-size:18px;" title="좋아요 취소"></span>
		        		</a>
		        		</c:if>
		        		<c:if test="${likeCount >= 1 }">
	        			<a href="#" onclick="movieUnLike(${movie.mnum }, ${sessionScope.unum })">
	    	      			<span style="display:none" id="like" class="glyphicon glyphicon-heart-empty" style="font-size:18px;" title="좋아요"></span>
	    	      			<span id="unLike" class="glyphicon glyphicon-heart" style="font-size:18px;" title="좋아요 취소"></span>
		        		</a>
		        		</c:if>
		        		&nbsp;&nbsp;
		        		<c:if test="${bookmarkCount == 0 }">
	        			<a href="#" onclick="movieBookmark(${movie.mnum }, ${sessionScope.unum })">
	    	      			<span id="bookmark" class="glyphicon glyphicon-star-empty" style="font-size:18px;" title="즐겨찾기"></span>
	    	      			<span style="display:none" id="unBookmark" class="glyphicon glyphicon-star" style="font-size:18px;" title="즐겨찾기 취소"></span>
		        		</a>
		        		</c:if>
		        		<c:if test="${bookmarkCount >= 1 }">
	        			<a href="#" onclick="movieUnBookmark(${movie.mnum }, ${sessionScope.unum })">
	        				<span style="display:none" id="bookmark" class="glyphicon glyphicon-star-empty" style="font-size:18px;" title="즐겨찾기"></span>
	    	      			<span id="unBookmark" class="glyphicon glyphicon-star" style="font-size:18px;" title="즐겨찾기 취소"></span>
		        		</a>
		        		</c:if>
		        	</c:if>
		        	<c:if test="${sessionScope.usid eq 'admin' and sessionScope.usid ne null}">
		        		<a href="updateContentsEdit.tm?mnum=${movie.mnum }">
         					<span class="glyphicon glyphicon-wrench" style="font-size:18px;" title="컨텐츠 수정"></span>
        				</a>	
		        	</c:if>
				</div>
			</div>
			
			<div class="panel-body">
				<!-- desc -->
				<div class="row movie-detail-desc">
					<div class="col-sm-3">장르</div>
					<div class="col-sm-3">${movie.mgenre }</div>
					<div class="col-sm-3">개봉일</div>
					<div class="col-sm-3">${movie.mrdate }</div>
				</div>
				<div class="row movie-detail-desc">
					<div class="col-sm-3">관람 연령</div>					
					<div class="col-sm-9">
						<c:choose>
							<c:when test="${movie.mage == 0}">전체 관람가</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${movie.mage ==1}">12세 이상 관람가</c:when>
									<c:when test="${movie.mage ==2}">15세 이상 관람가</c:when>
									<c:when test="${movie.mage ==2}">18세 이상 관람가</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<img src="<c:url value="/resources/img/classification/${movie.mage}.png"/>" width="40px" height="40px"/>
					</div>
				</div>
				<div class="row movie-detail-desc">
					<div class="col-sm-3">감독</div>
					<div class="col-sm-3">${movie.mdir }</div>
					<div class="col-sm-3">연출</div>
					<div class="col-sm-3">${movie.mpro }</div>
				</div>
				<div class="row movie-detail-desc">
					<div class="col-sm-3">배우</div>
					<div class="col-sm-9">${movie.mactor }, ${movie.msup }</div>
				</div>
				<hr>
				<div class="row movie-detail-desc">
					<div class="col-sm-3">줄거리</div>
					<div class="col-sm-9">${movie.msynop }</div>
				</div>
				<!-- desc -->			
			</div>
		</div>  
  </div>
	
	<!-- 랜덤으로 나온 인기장르 for carousel1-->
	<c:forEach items="${map }" var="map" varStatus="status">
		<div class="container">
			<c:set var="pg" value="${pg + 1 }" />
			<div class="panel panel-info">
				<div class="panel-heading">
					<font style="font-size: 20px;">${map.key } 인기 영화</font>
				</div>
				<div class="panel-body">
					<c:if test="${fn:length(map.value) == 0 }">
						<div class="jumbotron jumbotron-fluid" style="background-color: #DCDDE2;">
	         				<h1 class="display-3 text-primary">No Contents</h1>
	        		    	<p class="lead">${map.key } 장르의 컨텐츠가 없습니다.</p>
	        			</div>
					</c:if>
					<div class="row" style="text-align: center;">
						<c:set var="col" value="0" />
						<div class="col-md-12">
							<div id="Carousel${pg }" class="carousel slide media-carousel">
								<div class="carousel-inner">
									<div class="item active">
										<div class="row">
										<c:forEach items="${map.value }" var="movie" varStatus="status">
										<c:set var="col" value="${col + 1 }" />
											<div class="col-md-3" align="center">
												<div style="position: relative; cursor:pointer;" onmouseover="movie_description(0,${movie.mnum})" onmouseout="movie_description(1,${movie.mnum})">
													<a class="contents-link" href="#" onclick=
														
													<c:if test="${sessionScope.ugrade!=null }">"special(${sessionScope.ugrade},${movie.mnum},${movie.mwcon })"</c:if>
													<c:if test="${sessionScope.ugrade==null }">	
														special(null,${movie.mnum},${movie.mwcon })
													</c:if>>
												
													<div class="contents-portrait" onmouseover="movie_description(0,'${pg}-${col}-${movie.mnum}')" onmouseout="movie_description(1,'${pg}-${col}-${movie.mnum}')">
														<img src="<c:url value="/resources/saveMovieDB/${movie.mnum }/${movie.mimg}"/>" width="100%" >
														<div class="contents-desc-frame ${pg}-${col}-${movie.mnum}" >
																<h3>${movie.mname }</h3><hr>
															<div class="contents-desc">
																${movie.msynop }
															</div>
														</div>
													</div>
													<h4 class="text-primary">
														<c:if test="${movie.mwcon==2 }">
															<img alt="멤버전용" src="resources/img/sub/mbs.png" class="memIcon">
														</c:if> ${movie.mname }
													</h4>
												</a>
												</div>
											</div>
										<c:if test="${col%4 == 0 }">
										</div>
									</div>
									<div class="item">
										<div class="row">
										</c:if>
										</c:forEach>
										</div>
									</div>
									<!--.carousel-inner-->
										<a data-slide="prev" href="#Carousel${pg }" class="left carousel-control"><i class="glyphicon glyphicon-chevron-left"></i></a> 
										<a data-slide="next" href="#Carousel${pg }" class="right carousel-control"><i class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
								<!--.Carousel-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</c:forEach>
	
	<div class="container" id="comment">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">댓글</font>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<div class="row">
						<c:if test="${sessionScope.usid == null }">
							<div class="col-md-12">
									<textarea name="bcon" rows="3" cols="100" style="resize:none;" class="form-control" placeholder="로그인 후 댓글 달기." readonly></textarea>
							</div>
						</c:if>
						<c:if test="${sessionScope.usid != null }">
							<label class="col-md-12" style="font-size: 18px;">
								${sessionScope.usid }
							</label>
							<form id="commentForm" name="commentForm" method="get">
								<input type="hidden" name="mnum" id="mnum" value="${movie.mnum }">
								<input type="hidden" name="unum" id="unum" value="${sessionScope.unum }">
								<label class="col-sm-1">제목</label>
								<div class="col-sm-11">
									<input type="text" name="bsubject" id="bsubject" class="form-control" placeholder="제목을 입력하세요." >
								</div>
								<label class="col-sm-1">내용</label>
								<div class="col-sm-11">
									<textarea name="bcon" id="bcon" rows="4" cols="100" style="resize:none;" class="form-control" placeholder="내용을 입력하세요."></textarea>
								</div>
								<div class="form-group" align="right">
									<input type="button" value="등록" class="btn login_btn" onclick="fn_insertComment()">
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">댓글 목록</font>
			</div>
			<div class="panel-body" id="commentReply">
				<c:forEach items="${commentList }" var="commentList">
					<div class="form-group">
						<form id="commentUpdateForm" name="commentUpdateForm" method="post">
							<c:if test="${commentList.brestep == 0 }">
								<div class="col-md-12" style="font-size: 18px;">
									${commentList.busid }(${commentList.buname })
									<c:if test="${sessionScope.usid eq 'admin'}">
										<div class="pull-right" style="font-size: 15px;">
											<a href="#" onclick="fn_DeleteComment(${commentList.bnum})">
         										<span class="glyphicon glyphicon-minus"></span>
        									</a>
										</div>
									</c:if>
								</div>
								<div class="col-md-12">
									<label class="col-sm-1">제목</label>
									<div class="col-sm-11">
										<span id="sub${commentList.bnum }">${commentList.bsubject }</span>
										<span style="display:none" id="upSub${commentList.bnum }">
											<input type="text" name="upSubText${commentList.bnum }" id="upSubText${commentList.bnum }" class="form-control" placeholder="제목을 입력하세요." value="${commentList.bsubject }">
										</span>
									</div>
								</div>
								<div class="col-md-12">
									<label class="col-sm-1">내용</label>
									<div class="col-sm-11">
										<span id="con${commentList.bnum }">${commentList.bcon }</span>
										<span style="display:none" id="upCon${commentList.bnum }">
											<textarea name="upConText${commentList.bnum }" id="upConText${commentList.bnum }" rows="4" cols="100" style="resize:none;" class="form-control" placeholder="내용을 입력하세요.">${commentList.bcon }</textarea>
										</span>
									</div>
								</div>
							</c:if>
							<c:if test="${commentList.brestep > 0 }">
								<div class="col-sm-12">
									<label class="col-sm-1" align="right">ㄴ</label>
									<div class="col-sm-11" style="font-size: 18px;">
										${commentList.busid }(${commentList.buname })
										<c:if test="${sessionScope.usid eq 'admin'}">
										<div class="pull-right" style="font-size: 15px;">
											<a href="#" onclick="fn_DeleteComment(${commentList.bnum})">
         										<span class="glyphicon glyphicon-minus"></span>
        									</a>
										</div>
									</c:if>
									</div>
								</div>
								<div class="col-sm-12">
									<label class="col-sm-1"></label>
									<label class="col-sm-1">제목</label>
									<div class="col-sm-10">
										<span id="sub${commentList.bnum }">${commentList.bsubject }</span>
										<span style="display:none" id="upSub${commentList.bnum }">
												<input type="text" name="upSubText${commentList.bnum }" id="upSubText${commentList.bnum }" class="form-control" placeholder="제목을 입력하세요." value="${commentList.bsubject }">
										</span>
									</div>
								</div>
		
								<div class="col-sm-12">
									<label class="col-sm-1"></label>
									<label class="col-sm-1">내용</label>
									<div class="col-sm-10">
										<span id="con${commentList.bnum }">${commentList.bcon }</span>
										<span style="display:none" id="upCon${commentList.bnum }">
											<textarea name="upConText${commentList.bnum }" id="upConText${commentList.bnum }" rows="4" cols="100" style="resize:none;" class="form-control" placeholder="내용을 입력하세요.">${commentList.bcon }</textarea>
										</span>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.usid != null }">
								<div class="col-sm-12" align="right">
									<span id="replyShowBtn${commentList.bnum }"
										<c:if test="${commentList.brelevel == 1 }">
											style="display:none"
										</c:if>
									>
										<input type="button" value="답글" class="btn login_btn" onclick="fn_ReplyCommentFormShow(${commentList.bnum})">
									</span>
									<span style="display:none" id="replyHideBtn${commentList.bnum }">
										<input type="button" value="답글" class="btn login_btn" onclick="fn_ReplyCommentFormHide(${commentList.bnum})">
									</span>
									<span style="display:none" id="deleteBtn${commentList.bnum }">
										<input type="button" value="삭제" class="btn login_btn" onclick="fn_DeleteComment(${commentList.bnum}, ${commentList.brelevel})">
									</span>
									<span style="display:none" id="comfirmBtn${commentList.bnum }">
										<input type="button" value="확인" class="btn login_btn" onclick="fn_UpdateComment(${commentList.bnum})">
									</span>
									<c:if test="${sessionScope.unum == commentList.bunum }">
										<span id="updateBtn${commentList.bnum }">
											<input type="button" value="수정" class="btn login_btn" onclick="fn_UpdateCommentForm(${commentList.bnum})">
										</span>
									</c:if>
								</div>
							</c:if>
						</form>
						<form id="commentReplyInsertForm" name="commentReplyInsertForm" method="get">
							<div class="col-md-12" style="display:none" id="replyForm${commentList.bnum }">
								<input type="hidden" name="replyMnum${commentList.bnum }" id="replyMnum${commentList.bnum }" value="${movie.mnum }">
								<input type="hidden" name="replyUnum${commentList.bnum }" id="replyUnum${commentList.bnum }" value="${sessionScope.unum }">
								<label class="col-sm-1" align="right">ㄴ</label>
								<label class="col-sm-1">제목</label>
								<div class="col-sm-10">
									<input type="text" name="replySub${commentList.bnum }" id="replySub${commentList.bnum }" class="form-control" placeholder="제목을 입력하세요." >
								</div>
								<label class="col-sm-1"></label>
								<label class="col-sm-1">내용</label>
								<div class="col-sm-10">
									<textarea name="replyCon${commentList.bnum }" id="replyCon${commentList.bnum }" rows="4" cols="100" style="resize:none;" class="form-control" placeholder="내용을 입력하세요."></textarea>
								</div>
								<div class="form-group" align="right">
									<input type="button" value="등록" class="btn login_btn" onclick="fn_insertReply(${commentList.bref })">
								</div>
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>