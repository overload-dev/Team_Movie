package team_movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		
		Map<String, List<MovieBean>> map = null;
		map =new HashMap<String, List<MovieBean>>();
		
	      for(int i = 0 ; i < genreList.size();i++){
	          
	         String genreIs= genreList.get(i).getGname(); 
	         
	          List<MovieBean> movieListByGenreforFree = movieDao.GetMovieListByGenreForMember(genreIs,1);
	          
	          map.put(genreIs,movieListByGenreforFree);
	       }
	       
		 
		mav.addObject("genreList", genreList);
		mav.addObject("map", map);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
