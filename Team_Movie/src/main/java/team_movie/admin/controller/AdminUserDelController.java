package team_movie.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.UserDao;

@Controller
public class AdminUserDelController {

	private static final String command="adminUserDel.tm";
	
	@Autowired
	@Qualifier("myUserDao")
	UserDao userDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("unum") int unum
			){
		
		System.out.println(unum);
		userDao.DelUser(unum);
		return 1;
	}
	
}
