/**
 * 
 */
//멤버십변경 스크립트
function changeMembershipEdit(mbsnum) {

	// 변경할 이름
	c_mbsname = $('input[name = c_mbsname' + mbsnum + ']').val();

	if (c_mbsname == '') {
		alert("멤버십 이름을 입력하세요.");
		return false;
	}

	// 변경할 적용 기간
	c_mbsperiod = $('input[name = c_mbsperiod' + mbsnum + ']').val();

	if (c_mbsperiod == '') {
		alert("적용 기간을 입력하세요.");
		return false;
	}
	if (isNaN(c_mbsperiod)) {
		alert("적용 기간은 숫자로만 입력하세요.");
		return false;
	}

	// 변경할 가격
	c_mbsprice = $('input[name = c_mbsprice' + mbsnum + ']').val();

	if (c_mbsprice == '') {
		alert("가격을 입력하세요.");
		return false;
	}
	if (isNaN(c_mbsprice)) {
		alert("가격은 숫자로만 입력하세요.");
		return false;
	}

	var allData = {
			"mbsnum" : mbsnum,
			"c_mbsname" : c_mbsname,
			"c_mbsperiod" : c_mbsperiod,
			"c_mbsprice" : c_mbsprice
	}

	$.ajax({
		url : "changeMembershipEdit.tm",
		type : "GET",
		data : allData,
		success : function(result) {
			if (result > -1) {
				alert('변경');
				location.reload();
			}

		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

function deleteMembershipEdit(mbsnum, mbsname) {

	var answer = confirm("[선택 항목]\n멤버십 명 : " + mbsname);

	if (answer) {
		$.ajax({
			url : "deleteMembershipEdit.tm",
			type : "GET",
			data : {
				"mbsnum" : mbsnum
			},
			success : function(result) {
				alert(mbsname + " : 삭제 성공");
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
		});
	}
}

function addMembershipEdit() {
	var n_mbsname, n_mbsperiod, n_mbsprice;
	n_mbsname = $('input[name = n_mbsname]').val();
	n_mbsperiod = $('input[name = n_mbsperiod]').val();
	n_mbsprice = $('input[name = n_mbsprice]').val();

	if (n_mbsname == '') {
		alert("멤버십명을 입력하세요.");
		return false;
	}

	if (n_mbsperiod == '') {
		alert("적용 기간을 입력하세요.");
		return false;
	}
	if (isNaN(n_mbsperiod)) {
		alert("적용 기간은 숫자로만 입력하세요.");
		return false;
	}

	if (n_mbsprice == '') {
		alert("가격을 입력하세요.");
		return false;
	}
	if (isNaN(n_mbsprice)) {
		alert("가격은 숫자로만 입력하세요.");
		return false;
	}

	$.ajax({
		url : "addMembershipEdit.tm",
		type : "GET",
		data : {
			"n_mbsname" : n_mbsname,
			"n_mbsperiod" : n_mbsperiod,
			"n_mbsprice" : n_mbsprice
		},
		success : function(result) {
			alert("등록 성공");
			location.reload();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}

	});

}

function searchUserData() {
	var input, filter, table, tr, td, i, txtValue, searchAt;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();

	searchAt = document.getElementById("searchAt");

	table = document.getElementById("myTable");
	tr = table.getElementsByTagName("tr");

	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[searchAt.value];

		if (td) {
			txtValue = td.textContent || td.innerText;

			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}


//회원가입 유효성검사
function Validation(ugrade) {

	var usid = $('input[name=usid]');
	var uname = $('input[name=uname]');
	var upw = $('input[name=upw]');
	var upwCheck = $('input[name=upwCheck]');
	var ubirth = $('input[name=ubirth]');
	var ugenre = $('input[name=ugenre]');

	if (usid.val() == "") {
		alert("사용 할 아이디를 입력하세요.");
		usid.focus();
		return false;
	}

	if (isCheck == false || isChange == true) {
		alert("중복체크를 하세요.");
		return false;
	}

	else if (uname.val() == "") {
		alert("사용 할 닉네임을 입력하세요.");

		uname.focus();
		return false;
	} else if (upw.val() == "") {
		alert("사용 할 비밀번호를 입력하세요.");

		upw.focus();
		return false;
	}

	else if (upwCheck.val() == "") {
		alert("사용 할 비밀번호를 한 번 더 입력하세요.");

		upwCheck.focus();
		return false;
	}

	else if (upw.val() != upwCheck.val()) {
		alert("입력한 비밀번호와 다릅니다.");
		upwCheck.focus();
		return false;
	}

	else if (ubirth.val() == "") {
		alert("생년월일을 입력하세요.");

		ubirth.focus();
		return false;
	}

	else if (!ugenre.is(':checked')) {

		alert("선호 장르 한가지 이상 선택하세요.");

		return false;
	} else {
		var ugenres = "";

		for (i = 0; i < ugenre.length; i++) {

			if (ugenre[i].checked) {
				ugenres += ugenre[i].value + "/";
			}
		}

		$.ajax({
			url : "userInsert.tm",
			type : 'POST',
			data : {
				"ugrade" : ugrade,
				"usid" : usid.val(),
				"uname" : uname.val(),
				"upw" : upw.val(),
				"ubirth" : ubirth.val(),
				"ugenre" : ugenres
			},
			success : function(result) {
				if (result > -1) {
					alert("회원 가입되었습니다.");

					location.href = "userLogin.tm";
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
		})
	}
}
//영화 추가 시, 이미지 미리보기
function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 파일만 올려주세요.");

			if ($.browser.msie) { // IE version
				$('input[name=thumbnail]').replaceWith(
						$('input[name=thumbnail]').clone(true));
			} else { // other browser
				$('input[name=thumbnail]').val("");
			}

			return;
		}

		var reader = new FileReader();
		reader.onload = function(e) {
			$('img[name=preview_img]').attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
//이벤트 설정 시 이미지 변경
function changeEventMovie(){
	var movieNum = $('select[name=emnum]').val();
	var movieImgName = $('input[name=movieNum'+ movieNum +']').val();
	var movieAge = $('input[name = movieAge'+ movieNum +']').val();
	var movieMwcon = $('input[name = movieMwcon'+ movieNum +']').val();


	if(movieNum =="" || movieImgName ==""){
		$('img[name=movieThumb]').attr("src","resources/img/sub/no-image.gif");
		$('.mwcon h4').text('');
		$('.mage h4').text('');
		$('.movieTitles h2').text('');


	}else{
		$('.movieTitles h2').text($('input[name=movieName' + movieNum+ ']').val());
		$('img[name=movieThumb]').attr("src","resources/saveMovieDB/" + movieNum + "/" + movieImgName);

		switch(movieAge){
		case '0':
			$('.mage h4').text('전체 이용가');
			break;
		case '1':
			$('.mage h4').text('12세 이용가');
			break;
		case '2':
			$('.mage h4').text('15세 이용가');
			break;
		case '3':
			$('.mage h4').text('18세 이용가');
			break;
		}

		switch(movieMwcon){
		case '1':
			$('.mwcon h4').text('모든 회원');
			break;
		case '2':
			$('.mwcon h4').text('스페셜 한정');
			break;
		}
	}
}


function addEventDataChk(){
	var emnum = $('select[name=emnum]').val();
	var thumbnail = $('input[name=thumbnail]').val();

	if(emnum == ''){
		alert('이벤트로 설정할 영화를 선택하세요.');
		return false;
	}
	if(thumbnail ==''){
		alert('이벤트용 사진을 선택하세요.');
		return false;
	}

	if($('input[name="eenum"').val() != ""){
		var answer = confirm("기존의 이미지는 삭제됩니다. 수정 하시겠습니까?");

		if(!answer){
			return false;
		}
	}
}


//영화 업로드 형태 체크(URL, FILE)
function uploadChk(sel) {
	// url
	if (sel == 0) {
		$('span[id="url"]').show();
		$('input[name=murl]').prop('disabled', false);

		$('span[id="file"]').hide();
		$('input[name=f_mrepo]').prop('disabled', true);
		// file
	} else {
		$('span[id="file"]').show();
		$('input[name=f_mrepo]').prop('disabled', false);

		$('span[id="url"]').hide();
		$('input[name=murl]').prop('disabled', true);
	}
}

function addMovieDataChk() {

	var mname = $('input[name=mname]').val();
	var mrdate = $('input[name=mrdate]').val();
	var mgenrelen = $('input[name=mgenre]:checked').length;
	var mdir = $('input[name=mdir]').val();
	var mpro = $('input[name=mpro]').val();
	var mactor = $('input[name=mactor]').val();
	var msup = $('input[name=msup]').val();
	var msynop = $('textarea[name=msynop]').val();
	var thumbnail = $('input[name=thumbnail]').val();
	var murl = $('input[name=mur]').val();
	var mrepo = $('input[name=f_mrepo]').val();

	if (mname == '') {
		alert("영화 이름 누락");
		return false;
	}
	if (mrdate == '') {
		alert("개봉일 누락");
		return false;
	}
	if (mgenrelen <= 0) {
		alert("1개 이상의 장르를 선택하세요.");
		return false;
	}
	if (mdir == '') {
		alert("영화의 감독을 입력하세요.");
		return false;
	}
	if (mactor == '') {
		alert("출연 배우를 입력하세요.");
		return false;
	}
	if (msup == '') {
		alert("조연 배우를 입력하세요.");
		return false;
	}
	if (msynop == '') {
		alert("시놉시스를 입력하세요.");
		return false;
	}

	if (thumbnail == '') {
		alert("섬네일 이미지를 삽입하세요.");
		return false;
	}

	if (murl == '' && mrepo == '') {
		alert("영상 URL 혹은 파일을 삽입하세요.");
		return false;
	}

	if (murl == '') {
		murl.val(null);
	}

}

function updateMovieDataChk() {

	var mname = $('input[name=mname]').val();
	var mrdate = $('input[name=mrdate]').val();
	var mgenrelen = $('input[name=mgenre]:checked').length;
	var mdir = $('input[name=mdir]').val();
	var mpro = $('input[name=mpro]').val();
	var mactor = $('input[name=mactor]').val();
	var msup = $('input[name=msup]').val();
	var msynop = $('textarea[name=msynop]').val();
	var thumbnail = $('input[name=thumbnail]').val();
	var murl = $('input[name=mur]').val();
	var mrepo = $('input[name=f_mrepo]').val();

	if (mname == '') {
		alert("영화 이름 누락");
		return false;
	}
	if (mrdate == '') {
		alert("개봉일 누락");
		return false;
	}
	if (mgenrelen <= 0) {
		alert("1개 이상의 장르를 선택하세요.");
		return false;
	}
	if (mdir == '') {
		alert("영화의 감독을 입력하세요.");
		return false;
	}
	if (mactor == '') {
		alert("출연 배우를 입력하세요.");
		return false;
	}
	if (msup == '') {
		alert("조연 배우를 입력하세요.");
		return false;
	}
	if (msynop == '') {
		alert("시놉시스를 입력하세요.");
		return false;
	}

	if (murl == '') {
		murl.val(null);
	}
}

function deleteUser(unum) {
	$.ajax({
		url : 'adminUserDel.tm',
		type : "GET",
		data : {
			"unum" : unum
		},
		success : function(result) {
			if (result) {
				alert("해당 유저가 탈퇴 되었습니다.");
				location.reload();
			}
		},

		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

//공지사항 삭제
function deleteNotice(bnum) {

	$.ajax({
		url : 'deleteNoticeEdit.tm',
		type : 'GET',
		data : {
			"bnum" : bnum
		},
		success : function(result) {
			if (result) {
				alert("공지글이 삭제 되었습니다.");
				location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

//각 컨텐츠 댓글
//-------------------------------------------------------------
function fn_insertComment() {

	mnum = $('#mnum').val();
	unum = $('#unum').val();
	bcon = $('#bcon').val();
	bsubject = $('#bsubject').val();

	var allData = {
			"mnum" : mnum,
			"unum" : unum,
			"bcon" : bcon,
			"bsubject" : bsubject
	};

	if ($("input[name=bsubject]").val() == "") {
		alert("제목을 입력하세요.");
		$("input[name=bsubject]").val().focus();
		return false;
	} else if ($("input[name=bcon]").val() == "") {
		alert("내용을 입력하세요.");
		$("input[name=bcon]").val().focus();
		return false;
	} else {
		$.ajax({
			url : "commentInsert.tm",
			type : 'GET',
			data : allData,
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

function fn_UpdateCommentForm(bnum, brelevel) {
	var allData = {
			"bnum" : bnum,
			"brelevel" : brelevel
	}
	$
	.ajax({
		url : "commentUpdate.tm",
		type : 'GET',
		data : allData,
		success : function(result) {
			if (result != null) {
				document.getElementById("sub" + bnum).style.display = "none";
				document.getElementById("upSub" + bnum).style.display = "";
				document.getElementById("con" + bnum).style.display = "none";
				document.getElementById("upCon" + bnum).style.display = "";
				document.getElementById("deleteBtn" + bnum).style.display = "";
				document.getElementById("comfirmBtn" + bnum).style.display = "";
				document.getElementById("updateBtn" + bnum).style.display = "none";
				if (brelevel == 0) {
					document.getElementById("replyShowBtn" + bnum).style.display = "none";
				}
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
			"bnum" : bnum,
			"upSubText" : upSubText,
			"upConText" : upConText
	};

	if ($("#upSubText").val() == "") {
		alert("제목을 입력하세요.");
		$("#upSubText").val().focus();
		return false;
	} else if ($("#upConText").val() == "") {
		alert("내용을 입력하세요.");
		$("#upConText").val().focus();
		return false;
	} else {
		$.ajax({
			url : "commentUpdate.tm",
			type : 'POST',
			data : allData,
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
	document.getElementById("replyForm" + bnum).style.display = "";
	document.getElementById("replyShowBtn" + bnum).style.display = "none";
	document.getElementById("replyHideBtn" + bnum).style.display = "";
}

function fn_ReplyCommentFormHide(bnum) {
	document.getElementById("replyForm" + bnum).style.display = "none";
	document.getElementById("replyShowBtn" + bnum).style.display = "";
	document.getElementById("replyHideBtn" + bnum).style.display = "none";
}

function fn_insertReply(bref) {
	replyUnum = $('#replyUnum' + bref).val();
	replyMnum = $('#replyMnum' + bref).val();
	replySub = $('#replySub' + bref).val();
	replyCon = $('#replyCon' + bref).val();

	var allData = {
			"bref" : bref,
			"replyUnum" : replyUnum,
			"replyMnum" : replyMnum,
			"replySub" : replySub,
			"replyCon" : replyCon
	};

	if ($("#replySub").val() == "") {
		alert("제목을 입력하세요.");
		$("#replySub").val().focus();
		return false;
	} else if ($("#replyCon").val() == "") {
		alert("내용을 입력하세요.");
		$("#replyCon").val().focus();
		return false;
	} else {
		$.ajax({
			url : "commentInsert.tm",
			type : 'POST',
			data : allData,
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
function fn_DeleteComment(bnum, brelevel) {

	if (brelevel == 1) {
		var allData = {
				"bnum" : bnum
		}
		$.ajax({
			url : "commentDelete.tm",
			type : 'GET',
			data : allData,
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
	if (brelevel == 0) {
		var allData = {
				"bnum" : bnum
		}
		$.ajax({
			url : "commentDelete.tm",
			type : 'POST',
			data : allData,
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
}

function movieLike(mnum, unum) {

	var allData = {
			"mnum" : mnum,
			"unum" : unum
	};

	if (unum == null) {
		alert("로그인 후 이용 가능합니다.");
	} else {
		$.ajax({
			url : "movieLike.tm",
			type : 'GET',
			data : allData,
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

	var allData = {
			"mnum" : mnum,
			"unum" : unum
	};
	$.ajax({
		url : "movieLike.tm",
		type : 'POST',
		data : allData,
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

	var allData = {
			"mnum" : mnum,
			"unum" : unum
	};

	if (unum == null) {
		alert("로그인 후 이용 가능합니다.");
	} else {

		$.ajax({
			url : "movieBookmark.tm",
			type : 'GET',
			data : allData,
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

	var allData = {
			"mnum" : mnum,
			"unum" : unum
	};
	$.ajax({
		url : "movieBookmark.tm",
		type : 'POST',
		data : allData,
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

function memberUnBookmark(mnum, unum){


	var allData = {
			"mnum" : mnum,
			"unum" : unum
	}; 
	$.ajax({
		url : "movieBookmark.tm",
		type : 'POST',
		data : allData,
		success : function(result) {
			if (result > -1) {
				alert("즐겨찾기 취소");

				location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	})

}
//-------------------------------------------------------------
function movie_description(io,mnum){	
	if(io == '0'){
		$("div." + mnum).show();		
	}else{
		$("div." + mnum).hide();		
	}
}
//스페셜회원 일반회원 로그인하지않은 회원 구분
function special(ugrade,mnum,mwcon,mage){


	if(mage==3){
		
		$.ajax({
			url : "userAgeLimit.tm",
			type : 'GET',
			data : {"mnum" : mnum},
			success : function(result) { 
				if(result>0 && result <18){
					alert(result)
					alert("청소년 관람 불가 영화입니다.");
					location.reload();
				}
				
				if(result>18){
					if(ugrade==1 && mwcon==2 ){
						var con=confirm("멤버등록한 회원만 시청가능합니다. 멤버 등록하시겠습니까?");

						if(con==false){

							return false;
						}else{
							location.href="mShipBuyForm.tm";
						}

					} 
					if(ugrade == 2 || ugrade == 0 || mwcon==1){  
						location.href="movieContent.tm?mnum="+mnum;
					}

					if(ugrade==null && mwcon==2){
						alert("로그인 후 이용하세요.");
						location.href="userLogin.tm";

					}
					
				}
				
				if(result == -1){
					
					alert("로그인 후 이용 가능합니다.");
					location.href="userLogin.tm"
					}
				
				},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Error \n" + textStatus + " : " + errorThrown);
				self.close();
			}
		});
		
		
	}else{
		if(ugrade==1 && mwcon==2 ){
			var con=confirm("멤버등록한 회원만 시청가능합니다. 멤버 등록하시겠습니까?");

			if(con==false){

				return false;
			}else{
				location.href="mShipBuyForm.tm";
			}

		} 
		if(ugrade == 2 || ugrade == 0 || mwcon==1){  
			location.href="movieContent.tm?mnum="+mnum;
		}

		if(ugrade==null && mwcon==2){
			alert("로그인 후 이용하세요.");
			location.href="userLogin.tm";

		}
	}
}

//User membership 결재
function membershipBuy(mbsnum){
	var cf = confirm( '정말 구매 하시겠습니까?' );

	if(cf==true){
		location.href="mShipBuy.tm?mbsnum="+mbsnum
	}else{
		alert("구매취소되었습니다.");
		location.href="mShipBuyForm.tm"
	}
}

//회원 탈퇴
function UserDelete(unum){
	var cf = confirm( '정말 회원 탈퇴 하시겠습니까?' );

	if(cf==true){
		alert("회원 탈퇴되었습니다.");
		location.href="userDelete.tm?unum="+unum
	}else{
		alert("탈퇴 취소하였습니다.");
		location.href="userDetail.tm"
	}
}

//deleteEvent
function deleteEvent(eenum){
	alert(eenum);
	$.ajax({
		url : "deleteEvent.tm",
		type : 'GET',
		data : {"eenum" : eenum},
		success : function(result) {
			alert("이벤트가 삭제되었습니다.")
			location.reload();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Error \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});

}





