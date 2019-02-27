package team_movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		
		//Get All Genre
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		
		//Map------------------------
		Map <String, List<MovieBean>> map = null;
		map = new HashMap<String, List<MovieBean>>();
		//Map------------------------

		for(int i = 0 ; i < genreList.size() ; i++){
			
			//Look At this Genre
			String genreIs = genreList.get(i).getGname();
			
			//select List By Genre
			List<MovieBean> movieListByGenreforMember =  movieDao.GetMovieListByGenreForMember(genreIs,2);
			
			// input by Genre Key and Bean
			map.put(genreIs, movieListByGenreforMember);			
		}
		
		
		
		List<MovieBean> memberMovie=movieDao.GetMemberMovieList(2);
		
		System.out.println("memberMovie :" +memberMovie.size());
		
		//sending data
		model.addAttribute("genreList", genreList);
		model.addAttribute("map", map);
		 
		return getPage; 
	}
	
}