package team_movie.admin.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import team_movie.model.EventBean;
import team_movie.model.EventDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminEventAddController {
	private static final String command ="addEventEdit.tm";
	private static final String gotoPage ="body/admin/adminEventAdd";
	private static final String getPage = "redirect:/adminEditEvent.tm";
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myEventDao")
	EventDao eventDao;
	
	@RequestMapping(value=command, method= RequestMethod.GET)
	public String doActionGet(Model model){
		System.out.println("get");
		
		//event List Get
		List<EventBean> eventList = eventDao.GetEventList();
		
		//MovieList Get
		List<MovieBean> movieList = movieDao.GetMovieList();
		
		//이미 이벤트 설정된 항목은 리스트에서 제외한다.
		for(int i = 0 ; i < movieList.size(); i++){
			for(int j = 0 ; j < eventList.size(); j++){
				if(movieList.get(i).getMnum() == eventList.get(j).getEmnum()){
					movieList.remove(i);
				}
			}
		}
		
		model.addAttribute("movieList",movieList);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam("emnum") int emnum,
			@RequestParam("thumbnail") MultipartFile thumbnail,
			HttpSession session
			){
		
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB");
		
		File root_folder = new File(root_path +"/" + emnum);
		
		if(root_folder.exists()){			
			try {
				File newFile = new File(root_folder + "/" + thumbnail.getOriginalFilename());
				OutputStream out = new FileOutputStream(newFile);
				
				byte[] bytes = thumbnail.getBytes(); //바이트 정보
				out.write(bytes);
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		EventBean eventBean = new EventBean();
		
		eventBean.setEmnum(emnum);
		eventBean.setEimg(thumbnail.getOriginalFilename());
		
		eventDao.AddEvent(eventBean);
		
		
		
		
		
		return getPage;
	}
}
