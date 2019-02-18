package team_movie.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.MembershipDao;

@Controller
public class AdminMembershipDelController {

	private static final String command = "deleteMembershipEdit.tm";
	
	@Autowired
	@Qualifier("myMembership")
	MembershipDao membershipDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("mbsnum") int mbsnum
			){
		System.out.println("a");
		int cnt = -1;
		cnt = membershipDao.DeleteMembership(mbsnum);
		return cnt;
	}
	
}
