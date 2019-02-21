package team_movie.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserFavoriteController {
	
	private final String command="userFavorite.tm";
	private final String getPage="body/user/userEdit.tm";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doActionGet(
		HttpSession session
		){
		 
		ModelAndView mav = new ModelAndView();
		
		session.getAttribute("usid");
		mav.addObject("page","userFavorite");
		mav.setViewName(getPage);
		return mav;
	}
}
