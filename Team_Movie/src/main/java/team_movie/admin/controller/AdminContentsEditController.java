package team_movie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminContentsEditController {
	
	private static final String command="adminContentsEdit.tm";
	private static final String gotoPage ="body/admin/adminContentsEdit";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		
		//MovieList Get
		List<MovieBean> movieList = movieDao.GetMovieList();
		model.addAttribute("movieList",movieList);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		return gotoPage;
	}
}
