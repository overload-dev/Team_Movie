package team_movie.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MovieListController {
	
	private static final String command ="/main.tm";
	private static final String gotoPage ="main";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(){
		
		System.out.println("컨트롤러 진입");
		return "/body/" + gotoPage;
	}
	
	
}
