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
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class MovieContentViewController {
	
	private final static String getPage ="body/movieContent";
	private final static String command = "/movieContent.tm";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value=command)
	public String doAcitionGet(	
				@RequestParam(value="mnum", required=true) int mnum,
				@RequestParam(value="usid", required=false) String usid,
				Model model
			) {
		
		MovieBean movie = movieDao.GetMovieByNum(mnum);
		model.addAttribute("movie", movie);
		
		System.out.println("bynumGenre : " + movie.getMgenre());
			
		String[] genre = movie.getMgenre().split(",");
		
		List<String> contentGenreList = new ArrayList<String>();
		
		Map<String, List<MovieBean>> map = new HashMap<String, List<MovieBean>>();
		
		for (int i=0; i<genre.length; i++) {
			System.out.println("gerne[" + i + "] : " + genre[i]);
			contentGenreList.add(genre[i]);
			List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genre[i]);
			map.put(genre[i], movieByGenre);
		}
		
		model.addAttribute("map", map);
		model.addAttribute("contentGenreList", contentGenreList);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		UserBean user = userDao.GetUserById(usid);
		
		model.addAttribute("user", user);
		return getPage;
	}
}
