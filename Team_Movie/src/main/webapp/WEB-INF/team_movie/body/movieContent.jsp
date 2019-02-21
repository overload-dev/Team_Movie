<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
/*
 * 댓글 등록하기(Ajax)
 */
function fn_insertComment(){
	
	mnum = $('#mnum').val();
	unum = $('#unum').val();
	bcon = $('#bcon').val();
	bsubject = $('#bsubject').val();
	
	var allData = { 
			"mnum": mnum, 
			"unum": unum, 
			"bcon": bcon,
			"bsubject": bsubject 
			};
	
	if($("input[name=bsubject]").val() == ""){
		alert("제목을 입력하세요.");
		$("input[name=bsubject]").val().focus();
		return false;
	}
	else if($("input[name=bcon]").val() == ""){
		alert("내용을 입력하세요.");
		$("input[name=bcon]").val().focus();
		return false;
	} 
	else {
	    $.ajax({
	        url :"commentInsert.tm",
	        type:'GET',
	        data:allData,
	        success : function(result) {
	        	if (result > -1) {
		        	alert("댓글 작성 완료");
		        	location.reload();
	        	}
	        },
	        error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
	    })
	}
}

function fn_UpdateCommentForm(bnum) {
	alert(bnum);
	var allData = { 
			"bnum": bnum 
		}
	$.ajax({
        url : "commentUpdate.tm",
        type: 'GET',
        data: allData,
        success : function(result) {
        	if (result != null) {
	        	document.getElementById("sub" + bnum).style.display = "none";
	        	document.getElementById("upSub" + bnum).style.display = "";
	        	document.getElementById("con" + bnum).style.display = "none";
	        	document.getElementById("upCon" + bnum).style.display = "";
	        	document.getElementById("replyShowBtn" + bnum).style.display = "none";
	        	document.getElementById("deleteBtn" + bnum).style.display = "";
	        	document.getElementById("comfirmBtn" + bnum).style.display = "";
	        	document.getElementById("updateBtn" + bnum).style.display = "none";
        	}
        },
        error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
    })
}

function fn_UpdateComment(bnum) {
	upSubText = $('#upSubText' + bnum).val();
	upConText = $('#upConText' + bnum).val();
	
	var allData = { 
			"bnum": bnum,
			"upSubText": upSubText, 
			"upConText": upConText 
			};
	
	if($("#upSubText").val() == ""){
		alert("제목을 입력하세요.");
		$("#upSubText").val().focus();
		return false;
	}
	else if($("#upConText").val() == ""){
		alert("내용을 입력하세요.");
		$("#upConText").val().focus();
		return false;
	} 
	else {
	   $.ajax({
	        url :"commentUpdate.tm",
	        type:'POST',
	        data:allData,
	        success : function(result) {
	        	if (result > -1) {
		        	alert("댓글 수정 완료");
		        	location.reload();
	        	}
	        },
	        error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
	    })
	}
}

function fn_ReplyCommentFormShow(bnum) {
	alert("bnum : " + bnum);
	document.getElementById("replyForm" + bnum).style.display = "";
	document.getElementById("replyShowBtn" + bnum).style.display = "none";
	document.getElementById("replyHideBtn" + bnum).style.display = "";
}

function fn_ReplyCommentFormHide(bnum) {
	alert("bnum : " + bnum);
	document.getElementById("replyForm" + bnum).style.display = "none";
	document.getElementById("replyShowBtn" + bnum).style.display = "";
	document.getElementById("replyHideBtn" + bnum).style.display = "none";
}

function fn_insertReply(bref) {
	alert("bref : " + bref);
	replyUnum = $('#replyUnum' + bref).val();
	replyMnum = $('#replyMnum' + bref).val();
	replySub = $('#replySub' + bref).val();
	replyCon = $('#replyCon' + bref).val();
	alert("replyUnum : " + replyUnum);
	alert("replyMnum : " + replyMnum);
	alert("replySub : " + replySub);
	alert("replyCon : " + replyCon);
	
	var allData = { 
			"bref" : bref,
			"replyUnum" : replyUnum, 
			"replyMnum" : replyMnum, 
			"replySub" : replySub, 
			"replyCon" : replyCon 
			};
	
	if($("#replySub").val() == ""){
		alert("제목을 입력하세요.");
		$("#replySub").val().focus();
		return false;
	}
	else if($("#replyCon").val() == ""){
		alert("내용을 입력하세요.");
		$("#replyCon").val().focus();
		return false;
	} 
 	else {
	   $.ajax({
	        url :"commentInsert.tm",
	        type:'POST',
	        data:allData,
	        success : function(result) {
	        	if (result > -1) {
		        	alert("댓글의 답글 삽입 완료");
		        	location.reload();
	        	}
	        },
	        error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
	    })
	}
}
function fn_DeleteComment(bnum) {
	alert(bnum);
	var allData = { 
			"bnum": bnum 
		}
	$.ajax({
        url : "commentDelete.tm",
        type: 'GET',
        data: allData,
        success : function(result) {
        	if (result > -1) {
	        	alert("댓글 삭제 완료");
	        	location.reload();
        	}
        },
        error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
    })
}

function movieLike(mnum, unum) {
	alert("mnum : " + mnum);
	alert("unum : " + unum);
	
	var allData = {
			"mnum": mnum,
			"unum": unum
		};
	
	if (unum == null) {
		alert("로그인 후 이용 가능합니다.");
	}
 	else {
		$.ajax({
			url : "movieLike.tm",
			type: 'GET',
			data: allData,
			success : function(result) {
			if (result > -1) {
				alert("좋아요 성공");
				document.getElementById("like").style.display = "none";
				document.getElementById("unLike").style.display = "";
				location.reload();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
		})
 	}
}

function movieUnLike(mnum, unum) {
	alert("mnum : " + mnum);
	alert("unum : " + unum);
	
	var allData = {
			"mnum": mnum,
			"unum": unum
		};
	$.ajax({
		url : "movieLike.tm",
		type: 'POST',
		data: allData,
		success : function(result) {
		if (result > -1) {
			alert("좋아요 취소");
			document.getElementById("like").style.display = "";
			document.getElementById("unLike").style.display = "none";
			location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	})
}

function movieBookmark(mnum, unum) {
	alert("mnum : " + mnum);
	alert("unum : " + unum);
	
	var allData = {
			"mnum": mnum,
			"unum": unum
		};
	
	if (unum == null) {
		alert("로그인 후 이용 가능합니다.");
	}
 	else {
		$.ajax({
			url : "movieBookmark.tm",
			type: 'GET',
			data: allData,
			success : function(result) {
			if (result > -1) {
				alert("즐겨찾기 성공");
				document.getElementById("bookmark").style.display = "none";
				document.getElementById("unBookmark").style.display = "";
				location.reload();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
		})
 	}
}

function movieUnBookmark(mnum, unum) {
	alert("mnum : " + mnum);
	alert("unum : " + unum);
	
	var allData = {
			"mnum": mnum,
			"unum": unum
		};
	$.ajax({
		url : "movieBookmark.tm",
		type: 'POST',
		data: allData,
		success : function(result) {
		if (result > -1) {
			alert("즐겨찾기 취소");
			document.getElementById("bookmark").style.display = "";
			document.getElementById("unBookmark").style.display = "none";
			location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	})
}
</script>
<title>Insert title here</title>
<%@include file="../top.jsp"%>
<%@include file="./../../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/moviePageStyle.css' />">
</head>
<body>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 40px;">${movie.mname }</font>
			</div>
			<div class="panel-body">
				<iframe class="embed-responsive-item" src="//www.youtube.com/embed/80lNjkcp6gI" width="100%" height="400%" frameborder="0" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<font style="font-size: 20px;">${movie.mname }</font>
				<div class="pull-right">
					<a href="#comment">
          				<span class="glyphicon glyphicon-pencil" style="font-size:18px;" title="댓글쓰기"></span>
        			</a>
        			&nbsp;&nbsp;
        			
        			
        			<c:if test="${likeCount == 0 }">
        			<a href="#" onclick="movieLike(${movie.mnum }, ${user.unum })">
    	      			<span id="like" class="glyphicon glyphicon-heart-empty" style="font-size:18px;" title="좋아요"></span>
    	      			<span style="display:none" id="unLike" class="glyphicon glyphicon-heart" style="font-size:18px;" title="좋아요 취소"></span>
	        		</a>
	        		</c:if>
	        		<c:if test="${likeCount == 1 }">
        			<a href="#" onclick="movieUnLike(${movie.mnum }, ${user.unum })">
    	      			<span style="display:none" id="like" class="glyphicon glyphicon-heart-empty" style="font-size:18px;" title="좋아요"></span>
    	      			<span id="unLike" class="glyphicon glyphicon-heart" style="font-size:18px;" title="좋아요 취소"></span>
	        		</a>
	        		</c:if>
	        		&nbsp;&nbsp;
	        		
	        		
	        		<c:if test="${bookmarkCount == 0 }">
        			<a href="#" onclick="movieBookmark(${movie.mnum }, ${user.unum })">
    	      			<span id="bookmark" class="glyphicon glyphicon-star-empty" style="font-size:18px;" title="즐겨찾기"></span>
    	      			<span style="display:none" id="unBookmark" class="glyphicon glyphicon-star" style="font-size:18px;" title="즐겨찾기 취소"></span>
	        		</a>
	        		</c:if>
	        		<c:if test="${bookmarkCount == 1 }">
        			<a href="#" onclick="movieUnBookmark(${movie.mnum }, ${user.unum })">
        				<span style="display:none" id="bookmark" class="glyphicon glyphicon-star-empty" style="font-size:18px;" title="즐겨찾기"></span>
    	      			<span id="unBookmark" class="glyphicon glyphicon-star" style="font-size:18px;" title="즐겨찾기 취소"></span>
	        		</a>
	        		</c:if>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-3">
							${movie.mgenre }
						</div>
						<div class="col-md-3">
							분
						</div>
						<div class="col-md-3">
							${movie.mage }세 이상 관람가
						</div>
						<div class="col-md-3">
							<b>개봉일</b> ${movie.mrdate }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>감독</b>
						</div>
						<div class="col-md-5">
							${movie.mdir }
						</div>
						<div class="col-md-1">
							<b>연출</b>
						</div>
						<div class="col-md-5">
							${movie.mpro }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>배우</b>
						</div>
						<div class="col-md-11">
							${movie.mactor }, ${movie.msup }
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1">
							<b>줄거리</b>
						</div>
						<div class="col-md-11">
							${movie.msynop }
						</div>
					</div>
				</div>
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
											<div class="col-md-3">
												<a href="movieContent.tm?mnum=${movie.mnum }&usid=${usid }">
													<img src="//s3.namuwikiusercontent.com/s/5673b412996accb9ce935c3378c8d1493ea74f53cb6f692ee27ceed2c0b6ea2aed0b4cfcb49b387abab676557d156ef2f5a54dbf820089708d6cc6568690b8289a21bfc39a73f3702f1000356f5d85b90b25cae3d483b159e8a5349d562fb69e" width="80%"><br>
													${movie.mimg }<br>
													${movie.mname }<br>
													${movie.mgenre }<br>
												</a>
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
								<input type="hidden" name="unum" id="unum" value="${user.unum }">
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
									<span id="replyShowBtn${commentList.bnum }">
										<input type="button" value="답글" class="btn login_btn" onclick="fn_ReplyCommentFormShow(${commentList.bnum})">
									</span>
									<span style="display:none" id="replyHideBtn${commentList.bnum }">
										<input type="button" value="답글" class="btn login_btn" onclick="fn_ReplyCommentFormHide(${commentList.bnum})">
									</span>
									<span style="display:none" id="deleteBtn${commentList.bnum }">
										<input type="button" value="삭제" class="btn login_btn" onclick="fn_DeleteComment(${commentList.bnum})">
									</span>
									<span style="display:none" id="comfirmBtn${commentList.bnum }">
										<input type="button" value="확인" class="btn login_btn" onclick="fn_UpdateComment(${commentList.bnum})">
									</span>
									<c:if test="${user.unum == commentList.bunum }">
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
								<input type="hidden" name="replyUnum${commentList.bnum }" id="replyUnum${commentList.bnum }" value="${user.unum }">
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
</body>
</html>