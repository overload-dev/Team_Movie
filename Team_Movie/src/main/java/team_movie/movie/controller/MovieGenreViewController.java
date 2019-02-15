package team_movie.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class MovieGenreViewController {
	
	private static final String command = "/genreView.tm";
	private static final String getPage ="body/genreView";
	
	// for get GenreData
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
			
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(String gname){
		System.out.println("genreView doAction Get enter");
		System.out.println("gname: " + gname);
		ModelAndView mav = new ModelAndView();
		
		//GenreData Get (top.jsp)
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		
		//지정 장르별 리스트
		List<MovieBean> movielist = movieDao.GetMovieListByGenre(gname);
		
		System.out.println("gname" + gname);
		System.out.println("movielist" + movielist.size());
		mav.addObject("movielist",movielist);
		mav.addObject("gname", gname);
		mav.addObject("gname", gname);
		mav.addObject("genreList", genreList);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
}
