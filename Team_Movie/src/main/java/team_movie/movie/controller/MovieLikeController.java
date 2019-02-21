package team_movie.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.MovieDao;

@Controller
public class MovieLikeController {
	private static final String gotoPage = "redirect:/movieContent.tm";
	private static final String command = "/movieLike.tm";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET) 
	public ModelAndView doActionGet(
				@RequestParam(value="mnum", required=true) int mnum
			) {
		System.out.println("like update controller");
		
		int cnt = movieDao.MovieLikeUpdate(mnum);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(gotoPage+"?mnum="+mnum);
		
		return mav;
	}
}
