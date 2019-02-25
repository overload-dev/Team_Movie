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
public class MovieFreeContentController {

	private final String command="freeContents.tm";
	private final String getPage="body/freeContentsView";
	
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(){
		System.out.println("MovieFreeContentController");
		
		ModelAndView mav =new ModelAndView();
		
		List<MovieBean> freeMovie=movieDao.GetFreeMovie();
		System.out.println("freeMovie :" +freeMovie.size());
		
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		mav.addObject("freeMovie",freeMovie);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
