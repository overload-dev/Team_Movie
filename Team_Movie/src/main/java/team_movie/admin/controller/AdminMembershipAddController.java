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
public class AdminMembershipAddController {

	private static final String command = "addMembershipEdit.tm";

	@Autowired
	@Qualifier("myMembership")
	MembershipDao membershipDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("n_mbsname") String n_mbsname,
			@RequestParam("n_mbsperiod") int n_mbsperiod,
			@RequestParam("n_mbsprice") int n_mbsprice) {
		System.out.println(n_mbsname);
		System.out.println(n_mbsperiod);
		System.out.println(n_mbsprice);
		int cnt = -1;
		MembershipBean membershipBean = new MembershipBean(0, n_mbsname, n_mbsperiod, n_mbsprice);
		membershipDao.AddMemebership(membershipBean);
		return cnt;
	}

}
