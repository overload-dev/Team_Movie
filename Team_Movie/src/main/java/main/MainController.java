package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private static final String getPage = "main.jsp";
	private static final String command = "/main.tm";
	
	@RequestMapping(value=command)
	public String doActionGet() {
		return getPage;
	}
	
}
