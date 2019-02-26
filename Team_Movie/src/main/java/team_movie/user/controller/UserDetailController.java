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
public class UserDetailController {
	private static final String command ="userDetail.tm";
	private static final String getPage ="body/user/userEdit";

	@Autowired
	UserDao userDao;
	@Autowired
	GenreDao genreDao;
 
	//user 한명의 정보를 담는메서드
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			HttpSession session
			){

		System.out.println("UserDetailController");
		ModelAndView mav = new ModelAndView();

		String usid=(String)session.getAttribute("usid");
		UserBean userInfo=userDao.GetData(usid);
		
		//genre데이터
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		mav.addObject("userInfo",userInfo);
		mav.addObject("page","userDetail");
		mav.setViewName(getPage);
		return mav; 
	}
}
