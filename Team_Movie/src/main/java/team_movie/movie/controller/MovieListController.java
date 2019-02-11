package team_movie.movie.controller;

import java.util.ArrayList;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;

@Controller
public class MovieListController {
	
	private static final String command ="/main.tm";
	private static final String gotoPage ="main";
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(){
		
		System.out.println("컨트롤러 진입");
		
		getGenreList();
		
		return "/body/" + gotoPage;
	}
	
	
	//장르 정보를 획득
	public void getGenreList(){
		List<GenreBean> genreList = new ArrayList<GenreBean>();
		genreList = genreDao.getGenreList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("genreList", genreList);
	}
	
}
