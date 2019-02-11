package team_movie.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	private static final String command = "main.tm";
	private static final String getPage = "body/main";
	
	@RequestMapping(value=command)
	public String doActionGet() {
		System.out.println("MainController doActionGet");
		
		
		return getPage;
	}
	
	
}
