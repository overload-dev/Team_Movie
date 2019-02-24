package team_movie.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserDetailController {
	private static final String command ="userDetail.tm";
	private static final String getPage ="body/user/userEdit";
	private static final String getPage2 ="body/admin/adminEdit";
	
	@Autowired
	UserDao userDao;
	
	//user �Ѹ��� ������ ��¸޼���
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			HttpSession session
			){
		
		System.out.println("UserDetailController");
		ModelAndView mav = new ModelAndView();
		
		String usid=(String)session.getAttribute("usid");
		UserBean userInfo=userDao.GetData(usid);
		
		mav.addObject("userInfo",userInfo);
		mav.addObject("page","userDetail");
		String ugrade =(String)session.getAttribute("ugrade");
		if(ugrade.equals("0")){
			mav.setViewName(getPage2);
		}else{
			mav.setViewName(getPage);
		}
		return mav; 
	}
}
