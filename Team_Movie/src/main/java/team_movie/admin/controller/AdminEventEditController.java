package team_movie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team_movie.model.EventBean;
import team_movie.model.EventDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminEventEditController {

	private static final String command = "adminEditEvent.tm";
	private static final String gotoPage ="body/admin/adminEdit";
	
	@Autowired
	@Qualifier("myEventDao")
	EventDao eventDao;
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model){
		
		//EventListGet
		List<EventBean> eventList = null;
		eventList = eventDao.GetEventList();
		model.addAttribute("eventList",eventList);
		
		
		for(int i = 0 ; i < eventList.size(); i++){
			MovieBean moviebean = movieDao.GetMovieByNum(eventList.get(i).getEmnum());
			eventList.get(i).setEmname(moviebean.getMname());			
		}
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		model.addAttribute("Selpage","adminEditEvent");
		return gotoPage;
	}
	
}
