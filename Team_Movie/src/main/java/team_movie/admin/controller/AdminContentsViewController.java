package team_movie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminContentsViewController {

	private static final String command ="adminContentsView.tm";
	private static final String gotoPage ="body/admin/adminContentsView";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("mnum") int mnum,
			Model model){
		
		System.out.println("a");
		MovieBean movieBean = movieDao.GetMovieByNum(mnum);

		model.addAttribute("movieBean", movieBean);
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		return gotoPage;
	}
}

