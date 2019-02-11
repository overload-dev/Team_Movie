package team_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserInsertController {
	
	private static final String command = "userInsert.tm";
	private static final String getPage = "body/userInsert";
	private static final String gotoPage ="redirect:/main.tm";
	
	//userInsert.jsp page switching
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		return getPage;
	}
	
	
	
}
