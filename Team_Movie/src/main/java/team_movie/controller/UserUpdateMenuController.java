package team_movie.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserUpdateMenuController {

	private final String command = "userUpdateMenu.tm";
	private final String getPage = "body/user/userUpdateMenu";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(){
		
		System.out.println("body/user/userUpdateMenu");
		return getPage;
	}
}
