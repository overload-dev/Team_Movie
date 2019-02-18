package team_movie.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class AdminUserEditController {
	
	private static final String command ="adminUserEdit.tm";
	private static final String getPage = "body/admin/adminUserEdit";
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("myUserDao")
	UserDao userDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(){
		System.out.println("admin controller");
		ModelAndView mav = new ModelAndView();
		List<UserBean> userList = new ArrayList<UserBean>();
		userList = userDao.GetAllUserList();
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
				
		mav.addObject("userList", userList);
		mav.setViewName(getPage);
		
		
		return mav;
	}
	
}
