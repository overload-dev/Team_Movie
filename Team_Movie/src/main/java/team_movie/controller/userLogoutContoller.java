package team_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class userLogoutContoller {
	private static final String command = "userLogout.tm";
	private static final String getPage ="body/user/logout";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		System.out.println("logout");
		return getPage;
	}
}
