/**
 * 
 */
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
