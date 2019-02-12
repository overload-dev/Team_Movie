package team_movie.movie.controller;

import java.util.List;


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
		
		for (int i=0; i<genre.length; i++) {
			System.out.println("genre["+i+"]" + genre[i]);
		}

		ModelAndView mav = new ModelAndView();

		List<MovieBean> movie = movieDao.GetMovieList();	
		List<MovieBean> movieByGenre1 = movieDao.GetMovieListByGenre(genre[0]);	
		List<MovieBean> movieByGenre2 = movieDao.GetMovieListByGenre(genre[1]);	
		List<MovieBean> movieByGenre3 = movieDao.GetMovieListByGenre(genre[2]);	
		
		mav.addObject("movie", movie);
		mav.addObject("movieByGenre1", movieByGenre1);
		mav.addObject("movieByGenre2", movieByGenre2);
		mav.addObject("movieByGenre3", movieByGenre3);
		mav.addObject("genre1", genre[0]);
		mav.addObject("genre2", genre[1]);
		mav.addObject("genre3", genre[2]);
		mav.setViewName(getPage);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		return mav;
	}
}
