package team_movie.user.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserUpdateController {

	
	private final String command = "userUpdate.tm";
	private final String getPage = "body/user/userEdit";
	
	@Autowired
	GenreDao genreDao;
	
	@Autowired 
	UserDao userDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGetEdit(
			HttpSession session
			){
		System.out.println("UserUpdateController");
		String usid=(String)session.getAttribute("usid");
		
		ModelAndView mav = new ModelAndView();
		System.out.println("usid :" +usid);
		
		List<GenreBean> genreList = null;
		//유저한명의정보
		UserBean userInfo = userDao.GetData(usid);
		//장르정보
		genreList = genreDao.getGenreList();
		
		mav.addObject("genreList", genreList);	
		mav.addObject("page","userUpdateForm");
		mav.addObject("userInfo",userInfo);
		
		mav.setViewName(getPage);
		return mav;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
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
			
			
			return "redirect:/userDetail.tm";
	}
} 
