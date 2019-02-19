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
public class UserUpdateController {

	private final String commandD = "userDetail.tm";
	private final String commandE = "userEdit.tm";
	private final String getPage = "body/user/userDetail";
	private final String gotoPage = "body/user/userEdit";

	@Autowired 
	UserDao userDao;

	@RequestMapping(value=commandD, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			HttpSession session
	
			){
		ModelAndView mav = new ModelAndView();
		String usid=(String)session.getAttribute("usid");

		UserBean userInfo = userDao.GetData(usid);
		session.setAttribute("mnum", 1);
		mav.addObject("userInfo",userInfo);
		mav.setViewName(getPage);
		return mav;
	}
	 
	
	@RequestMapping(value=commandE, method=RequestMethod.GET)
	public ModelAndView doActionGetEdit(
			@RequestParam(value="usid",required=true ) String usid,
			HttpSession session
			){
		ModelAndView mav = new ModelAndView();
		System.out.println("usid :" +usid);

		UserBean userInfo = userDao.GetData(usid);
		session.setAttribute("mnum", 4);
		mav.addObject("userInfo",userInfo);
		mav.setViewName(gotoPage);
		return mav;
	}

	@RequestMapping(value=commandE, method=RequestMethod.POST)
	public String doActionPost(
			UserBean userBean
			){ 
			int cnt =-1;
			System.out.println("unum :"+userBean.getUnum());
			
			System.out.println("usid:"+userBean.getUsid());
			System.out.println("upw:"+userBean.getUpw());
			System.out.println("upw:"+userBean.getUgenre());
			 
			cnt = userDao.UserUpdate(userBean);
		
			System.out.println("cnt : "+ cnt);
			
			
			return "redirect:/userDetail.tm?usid="+userBean.getUsid();
	}
} 
