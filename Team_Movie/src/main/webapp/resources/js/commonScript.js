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
