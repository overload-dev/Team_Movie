/**
 * 
 */
// 멤버십변경 스크립트
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

// 회원가입 달력
$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dateFormat: 'yy-mm-dd'
    });
});
var isCheck=false;
var isChange=false;
//중복체크
$(document).ready(function(){
	
	var use;
	var isBlank=false;
	
	$("input[name=usid]").keydown(function(){//키보드가 눌렸을 때 span영역 을 다시 안보이게끔
		isChange=true;
		use="";
		$("#idmessage").css("display","none");
	})
	$("input[name=id_check]").click(function(){
		isCheck=true;
		isChange =false;
		isBlank =false;
		
		if($('input[name=usid]').val()==""){
			alert("사용 할 아이디를 입력하세요.");
			isBlank=true;
			return false;
		}
		
		$.ajax({
			url:"idCheck.tm",
			data :({
				"usid":$("input[name=usid]").val()
			}),
			success:function(data){		
				if(jQuery.trim(data)=='YES'){
					 $('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
					$('#idmessage').show();//display:none인걸 보이게끔 바꾸어줌 
					//alert("아이디 사용가능합니다.");
					use="possible";
				}else{
					 $('#idmessage').html("<font color=red>이미 사용중인 아이디 입니다.</font>");
					$('#idmessage').show();
					//alert("아이디가 중복되었습니다.");
					use="impossible";
				} 
			}
		});//ajax()의 끝
	})
	
	
})

//회원가입 유효성검사 
function Validation(ugrade){
	
	
	var usid = $('input[name=usid]');
	var uname = $('input[name=uname]');
	var upw = $('input[name=upw]');
	var upwCheck = $('input[name=upwCheck]');	
	var ubirth = $('input[name=ubirth]');	
	var ugenre = $('input[name=ugenre]');	
	
	if(usid.val()=="") {
		alert("사용 할 아이디를 입력하세요.");
		usid.focus();	
		return false;
	} 
	
	if(isCheck==false|| isChange==true){
		alert("중복체크를 하세요.");
		return false;
	}
	
	else if(uname.val() == "") {
		alert("사용 할 닉네임을 입력하세요.");
		
		uname.focus();
		return false; 
	}
	else if(upw.val()=="") {
		alert("사용 할 비밀번호를 입력하세요.");
		
		upw.focus();
		return false;
	}
	
	else if (upwCheck.val()=="") {
		alert("사용 할 비밀번호를 한 번 더 입력하세요.");
		
		upwCheck.focus();
		return false;
	}
	
	else if(upw.val()!=upwCheck.val()){
		alert("입력한 비밀번호와 다릅니다.");
		upwCheck.focus();
		return false;
	}
	
	else if(ubirth.val()=="") {
		alert("생년월일을 입력하세요.");
		
		ubirth.focus();
		return false;
	}
	 
	else if(!ugenre.is(':checked')){
		 
		alert("선호 장르 한가지 이상 선택하세요.");	
		
		return false;
	}else{
		var ugenres = "";
		
		for(i=0;i<ugenre.length;i++) {
			
			if (ugenre[i].checked){
		    	ugenres += ugenre[i].value+"/";
		    } 
		}
		
		alert(ugenres);
		
		$.ajax({
        url :"userInsert.tm",
        type:'POST',
        data:
        	{
        	"ugrade" :ugrade,
        	"usid" : usid.val(),
        	"uname":uname.val(),
        	"upw":upw.val(),
        	"ubirth":ubirth.val(),
        	"ugenre":ugenres 
        	},
        success : function(result) {
        	if (result > -1) {
	        	alert("회원 가입되었습니다.");
	        	
	        	location.href="userLogin.tm";
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
function handleImgFileSelect(e){
	var files= e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert(f.type);
			alert("이미지 파일만 올려주세요.");

			if($.browser.msie){    //IE version
				$('input[name=thumbnail]').replaceWith($('input[name=thumbnail]').clone(true) );
			}else{    //other browser
				$('input[name=thumbnail]').val("");
			}
			
			return;
		}
		
		var reader = new FileReader();
		reader.onload = function(e){
			$('img[name=preview_img]').attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

//영화 업로드 형태 체크(URL, FILE)
function uploadChk(sel){
	//url
	if(sel == 0){
		$('span[id="url"]').show();
		$('input[name=f_murl]').prop('disabled', false);

		$('span[id="file"]').hide();
		$('input[name=f_mrepo]').prop('disabled', true);
	//file
	}else{
		$('span[id="file"]').show();
		$('input[name=f_mrepo]').prop('disabled', false);
		
		$('span[id="url"]').hide();
		$('input[name=f_murl]').prop('disabled', true);			
	}
}

function addMovieDataChk(){

	var mname = $('input[name=mname]').val();
	var mrdate= $('input[name=mrdate]').val();
	var mgenrelen = $('input[name=mgenre]:checked').length;
	var mdir = $('input[name=mdir]').val();
	var mpro = $('input[name=mpro]').val();
	var mactor = $('input[name=mactor]').val();
	var msup = $('input[name=msup]').val();
	var msynop = $('textarea[name=msynop]').val();
	var thumbnail = $('input[name=thumbnail]').val();
	var murl = $('input[name=mur]').val();
	var mrepo = $('input[name=f_mrepo]').val();
	
	if(mname ==''){
		alert("영화 이름 누락");
		return false;
	}
	if(mrdate ==''){
		alert("개봉일 누락");
		return false;
	}
	if(mgenrelen <=0){
		alert("1개 이상의 장르를 선택하세요.");
		return false;
	}
	if(mdir ==''){
		alert("영화의 감독을 입력하세요.");
		return false;
	}
	if(mactor ==''){
		alert("출연 배우를 입력하세요.");
		return false;
	}
	if(msup ==''){
		alert("조연 배우를 입력하세요.");
		return false;
	}
	if(msynop ==''){
		alert("시놉시스를 입력하세요.");
		return false;
	}
	
	if(thumbnail == ''){
		alert("섬네일 이미지를 삽입하세요.");
		return false;
	}

	if(murl == '' && mrepo ==''){
		alert("영상 URL 혹은 파일을 삽입하세요.");
		return false;
	}
	
	if(murl == ''){
		murl.val(null);
	}

}

function updateMovieDataChk(){

	var mname = $('input[name=mname]').val();
	var mrdate= $('input[name=mrdate]').val();
	var mgenrelen = $('input[name=mgenre]:checked').length;
	var mdir = $('input[name=mdir]').val();
	var mpro = $('input[name=mpro]').val();
	var mactor = $('input[name=mactor]').val();
	var msup = $('input[name=msup]').val();
	var msynop = $('textarea[name=msynop]').val();
	var thumbnail = $('input[name=thumbnail]').val();
	var murl = $('input[name=mur]').val();
	var mrepo = $('input[name=f_mrepo]').val();
	
	if(mname ==''){alert("영화 이름 누락"); return false;}
	if(mrdate ==''){alert("개봉일 누락"); return false;}
	if(mgenrelen <=0){alert("1개 이상의 장르를 선택하세요."); return false;}
	if(mdir ==''){alert("영화의 감독을 입력하세요.");return false;}
	if(mactor ==''){alert("출연 배우를 입력하세요."); return false;}
	if(msup ==''){ alert("조연 배우를 입력하세요."); return false;}
	if(msynop ==''){alert("시놉시스를 입력하세요."); return false; }
	
	if(murl == ''){
		murl.val(null);
	}
}
