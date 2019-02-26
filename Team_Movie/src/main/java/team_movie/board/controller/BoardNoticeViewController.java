package team_movie.board.controller;

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
public class BoardNoticeViewController {
	
	private static final String command ="noticeView.tm";
	private static final String gotoPage ="body/noticeView";
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		List<BoardBean> noticeList = null;
		noticeList = boardDao.GetAllNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		model.addAttribute("Selpage","adminEditContents");
		return gotoPage;
	}
}
