package team_movie.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.Membership_LogBean;
import team_movie.model.Membership_LogDao;

@Controller
public class UserMembershipLogController {

	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("myMembership_LogDao")
	Membership_LogDao membership_logDao;
	
	private static final String command ="mShipBuyLogForm.tm";
	private static final String gotoPage ="body/user/userEdit";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		//genre������
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		int unum = (Integer) session.getAttribute("unum");
		
		//log request
		List<Membership_LogBean> membershipLogList = null;
		membershipLogList = membership_logDao.GetLogByNum(unum);
		
		mav.addObject("membershipLogList",membershipLogList);
		mav.addObject("page","mShipBuyLogForm");		
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
}
