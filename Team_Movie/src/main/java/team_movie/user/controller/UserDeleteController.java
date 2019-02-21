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
public class UserDeleteController {
	
	private final String command="userDeleteForm.tm";
	private final String command2="userDelete.tm";
	
	private final String getPage="body/user/userEdit";
	private final String gotoPage="redirect:/userLogout.tm";
	
	@Autowired 
	UserDao userDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			HttpSession session
			){
		ModelAndView mav =new ModelAndView();
		 
		 System.out.println("userDeleteForm");
		 String usid = (String)session.getAttribute("usid");
		 UserBean userInfo=userDao.GetData(usid);
		 mav.addObject("userInfo",userInfo);
		 mav.addObject("page","userDeleteForm");
		 mav.setViewName(getPage);
		 
		 return mav;
	}
	@RequestMapping(value=command2, method=RequestMethod.GET)
	public String doActionPost(
			@RequestParam(value="unum" ,required=true) int unum
			){
		int cnt =userDao.DelUser(unum);
		 
		return gotoPage;
	}
}
