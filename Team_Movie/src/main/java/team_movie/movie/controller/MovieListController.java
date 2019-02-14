package team_movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class MovieListController {
	
	private static final String getPage ="body/main";
	private static final String command ="/main.tm";
	
	@Autowired
	MovieDao movieDao;
	
	
	// for get GenreData
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(){
		
		System.out.println("MainController doGet");
		
		
		int[] num = new int[3]; 
		for(int i = 0; i < num.length ; i++){
			num[i] = (int)(Math.random() * 7) + 1;
		    for(int j = 0; j < i; j ++){
		        if(num[i] == num[j]){
		            i--;
		            break;
		        }
		    }
		}
		String genres = "";
		
		for (int i=0; i<3; i++) {
			switch (num[i]) {
			case 1 : genres = genres + "코미디/";
				break;
			case 2 : genres = genres + "액션/";
				break;
			case 3 : genres = genres + "범죄/";
				break;
			case 4 : genres = genres + "스릴러/";
				break;
			case 5 : genres = genres + "공포/";
				break;
			case 6 : genres = genres + "드라마/";
				break;
			case 7 : genres = genres + "멜로/";
				break;
			}
		}
		
		System.out.println("genres : " + genres);
		
		String[] genre = genres.split("/");
		
		Map<String, List<MovieBean>> map = new HashMap<String, List<MovieBean>>();

		
		for (int i=0; i<genre.length; i++) {
			System.out.println("genre["+i+"]" + genre[i]);
			List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genre[i]);
			map.put(genre[i], movieByGenre);
		}
		
		ModelAndView mav = new ModelAndView();

		
		List<MovieBean> movie = movieDao.GetMovieList();	

		int totalCount = movieDao.GetTotalCount();
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("movie", movie);
		mav.addObject("map", map);
		mav.setViewName(getPage);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		return mav;
	}

}
