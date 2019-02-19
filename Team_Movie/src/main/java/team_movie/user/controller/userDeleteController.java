package team_movie.user.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class userDeleteController {
	
	private final String command="userDelete.tm";
	private final String getPage="body/user/userDeleteForm";
	private final String gotoPage="redirect:/userLogout.tm";
	
	@Autowired 
	UserDao userDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			HttpSession session
			){
		/*메뉴바 active변경되도록하는 세션*/
		session.setAttribute("number", 3);
		 
		System.out.println("userDeleteForm");
		 String usid = (String)session.getAttribute("usid");
		 ModelAndView mav =new ModelAndView();
		 UserBean userInfo=userDao.GetData(usid);
		 mav.addObject("userInfo",userInfo);
		 mav.setViewName(getPage);
		 
		 return mav;
	}
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam(value="unum" ,required=true) int unum
			){
		int cnt =userDao.DelUser(unum);
		
		return gotoPage;
	}
}
