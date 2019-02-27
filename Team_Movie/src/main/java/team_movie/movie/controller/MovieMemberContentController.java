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
public class MovieMemberContentController {

	private final String command="memberContents.tm";
	private final String getPage="body/memberContentsView";
	
	
	@Autowired
	MovieDao movieDao;
	@Autowired
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(){
		System.out.println("MovieFreeContentController");
		
		ModelAndView mav =new ModelAndView();
		
		List<MovieBean> memberMovie=movieDao.GetMemberMovieList(2);
		
		System.out.println("memberMovie :" +memberMovie.size());
		
		List<GenreBean> genreList = null;
		int totalCount =movieDao.GetMemCount();
		
		mav.addObject("totalCount",totalCount);
		
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		mav.addObject("memberMovie",memberMovie);
		mav.setViewName(getPage);
		 
		return mav; 
	}
	
}