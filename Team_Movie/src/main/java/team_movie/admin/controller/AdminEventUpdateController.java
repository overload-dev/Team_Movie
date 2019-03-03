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
public class AdminEventUpdateController {
	
	private static final String command = "updateEventEdit.tm";
	private static final String gotoPage="body/admin/adminEventUpdate";
	private static final String getPage="redirect:/adminEditEvent.tm";
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myEventDao")
	EventDao eventDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("eenum") int eenum,
			Model model
			){
		//event List Get
		List<EventBean> eventList = eventDao.GetEventList();
		
		//MovieList Get
		List<MovieBean> movieList = movieDao.GetMovieList();
		
		MovieBean selMovieBean = new MovieBean();
		
		//이미 이벤트 설정된 항목은 리스트에서 제외한다.
		for(int i = 0 ; i < movieList.size(); i++){
			for(int j = 0 ; j < eventList.size(); j++){
				if(movieList.get(i).getMnum() == eventList.get(j).getEmnum()){
					if(eventList.get(j).getEenum() != eenum){
						System.out.println(movieList.get(i).getMnum()+" 제거");
						movieList.remove(i);
					}else{
						selMovieBean.setMnum(eventList.get(j).getEmnum());
						System.out.println(eventList.get(j).getEmnum());
						selMovieBean.setMimg(movieList.get(i).getMimg());
						selMovieBean.setMwcon(movieList.get(i).getMwcon());
						selMovieBean.setMage(movieList.get(i).getMage());
						
						model.addAttribute("selMovieBean",selMovieBean);
						model.addAttribute("eventimg",eventList.get(j).getEimg());
					}
				}
			}
		}
		model.addAttribute("movieList",movieList);
		model.addAttribute("eenum",eenum);
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam("thumbnail") MultipartFile thumbnail,
			@RequestParam("eenum") int eenum,
			@RequestParam("emnum") int emnum,
			HttpSession session
			){
		
		EventBean eventBean = null;
		eventBean = eventDao.GetEventByNum(eenum);
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB");
		
		//기존 파일 삭제
		File old_root_folder = new File(root_path +"/" + eventBean.getEmnum());
		File oldFile = new File(old_root_folder + "/" + eventBean.getEimg());
		if(oldFile.exists()){
			oldFile.delete();
		}
		//신규 추가 
		
		File new_root_folder = new File(root_path +"/" + emnum);
		
		if(new_root_folder.exists()){
			OutputStream out = null;
			try {
				File newFile = new File(new_root_folder + "/" + thumbnail.getOriginalFilename());
				
				out = new FileOutputStream(newFile);
				byte[] bytes = thumbnail.getBytes(); //바이트 정보
				out.write(bytes);
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(out != null){
					try {
						out.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		eventBean.setEenum(eenum);
		eventBean.setEmnum(emnum);
		eventBean.setEimg(thumbnail.getOriginalFilename());
		
		eventDao.UpdateEvent(eventBean);
		
		
		return getPage;
	}
	
}
