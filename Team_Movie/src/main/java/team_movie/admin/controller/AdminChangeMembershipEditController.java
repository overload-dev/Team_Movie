package team_movie.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.MembershipBean;
import team_movie.model.MembershipDao;

@Controller
public class AdminChangeMembershipEditController {
	
	private static final String command = "changeMembershipEdit.tm";
	
	
	@Autowired
	@Qualifier("myMembership")
	MembershipDao membershipDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("mbsnum") int mbsnum,
			@RequestParam("c_mbsname") String c_mbsname,
			@RequestParam("c_mbsperiod") int c_mbsperiod,
			@RequestParam("c_mbsprice") int c_mbsprice
			){
		
		System.out.println("doActionGet Enter");
		System.out.println(mbsnum);
		System.out.println(c_mbsname);
		System.out.println(c_mbsperiod);
		System.out.println(c_mbsprice);
		int cnt = -1;
		MembershipBean membershipBean = new MembershipBean(mbsnum,c_mbsname,c_mbsperiod,c_mbsprice);
		
		cnt = membershipDao.UpdateMembership(membershipBean);
		
		
		
		return cnt;
	}
}
