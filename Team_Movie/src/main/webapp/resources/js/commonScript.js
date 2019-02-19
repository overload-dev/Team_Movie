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

function myFunction() {
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
