package team_movie.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;	

@Controller
public class MovieAllContentViewController {

	private final String command="allMovieView.tm";
	private final String getPage="body/allMovieView";
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	GenreDao genreDao;
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(){
		System.out.println("allMovieView.tm");
		ModelAndView mav = new ModelAndView();
		
		List<MovieBean> allMovie=movieDao.GetMovieList();
		
		//genreµ•¿Ã≈Õ
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		mav.addObject("allMovie",allMovie);
		mav.setViewName(getPage);
		
		return mav;
	}
}
