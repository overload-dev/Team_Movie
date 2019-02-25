package team_movie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team_movie.model.BoardBean;
import team_movie.model.BoardDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;

@Controller
public class AdminNoticeEditController {

	private static final String command ="adminNoticeEdit.tm";
	private static final String gotoPage ="body/admin/adminEdit";

	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		List<BoardBean> noticeList = null;
		noticeList = boardDao.GetAllNoticeList();
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("Selpage","adminEditNotice");
		return gotoPage;
	}

}
