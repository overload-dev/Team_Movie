package team_movie.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MembershipBean;
import team_movie.model.MembershipDao;

@Controller
public class AdminMembershipEditController {
	
	private static final String command ="adminMembershipEdit.tm";
	private static final String gotoPage ="body/admin/adminEdit";
	
	@Autowired
	@Qualifier("myMembership")
	MembershipDao membershipDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		List<MembershipBean> membershipList = new ArrayList<MembershipBean>();
		membershipList = membershipDao.GetMemberShipList();
		model.addAttribute("membershipList",membershipList);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		model.addAttribute("Selpage", "adminEditMembership");
		
		return gotoPage;
	}
}
