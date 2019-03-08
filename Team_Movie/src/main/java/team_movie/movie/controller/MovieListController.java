package team_movie.movie.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.BoardBean;
import team_movie.model.BoardDao;
import team_movie.model.EventBean;
import team_movie.model.EventDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.LatestviewBean;
import team_movie.model.LatestviewDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class MovieListController {
	
	private static final String getPage ="body/main";
	private static final String command ="/main.tm";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@Autowired
	UserDao userDao;
	
	// for get GenreData
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	
	//latestview  
	@Autowired
	@Qualifier("myLatestviewDao")
	LatestviewDao latestviewDao;
	
	//for Event img
	@Autowired
	@Qualifier("myEventDao")
	EventDao eventDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("MainController doGet");
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
				
		String usid=(String)session.getAttribute("usid");
		
		if (usid != null) {
			UserBean user = userDao.GetUserById(usid);
			System.out.println("userGenre : " + user.getUgenre());
			String[] userGenre = user.getUgenre().split("/");
			for(int i=0; i<userGenre.length; i++) {
				System.out.println("userGenre[i] : " + userGenre[i]);
			}
			
			int[] num = new int[3-userGenre.length]; 
			
			for(int i = 0; i < num.length ; i++){
				num[i] = (int)(Math.random() * (genreList.size()-1)) + 1; 
				
			    for(int j = 0; j < i; j ++){
			        if(num[i] == num[j]){
			            i--; 
			            break;
			        }
			    }
			}

			String genres = user.getUgenre();
			for(int i = 0 ; i < num.length ; i ++){
				String rdGenre = genreList.get(num[i]).getGname();
				System.out.println(num[i]);
				System.out.println(genreList.get(num[i]).getGname());
				System.out.println("genreList.size() : " + genreList.size());
				System.out.println("genres : " + genres);
				if(genres.contains(rdGenre)) {
					System.out.println("장르 겹침");
					num[i] = (int)(Math.random() * (genreList.size()-1)) + 1;
					i--;
				}
				else {
					genres += genreList.get(num[i]).getGname() + "/";
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
			
			mav.addObject("map", map);
		}
		
		
		if (usid == null) {
			int[] num = new int[3]; 
			
			for(int i = 0; i < num.length ; i++){
				num[i] = (int)(Math.random() * (genreList.size()-1)) + 1; 
				
				for(int j = 0; j < i; j ++){
					if(num[i] == num[j]){
						i--; 
						break;
					}
				}
			}
			
			String genres = "";
			for(int i = 0 ; i < num.length ; i ++){
				System.out.println(num[i]);
				System.out.println(genreList.get(num[i]).getGname());
				
				genres += genreList.get(num[i]).getGname() + "/";
			}
			
			System.out.println("genres : " + genres);
			
			String[] genre = genres.split("/");
			
			Map<String, List<MovieBean>> map = new HashMap<String, List<MovieBean>>();
			
			
			for (int i=0; i<genre.length; i++) {
				System.out.println("genre["+i+"]" + genre[i]);
				List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genre[i]);
				
				map.put(genre[i], movieByGenre);
			}
			
			mav.addObject("map", map);
		}
		
		List<MovieBean> movie = movieDao.GetMovieList();	
		int mwcon =2;
		List<MovieBean> memMovie = movieDao.GetMemberMovieList(mwcon);	
		
		int totalCount = movieDao.GetTotalCount();
		 
		int memTotal = movieDao.GetMemCount();
		mav.addObject("memMovie",memMovie);
		mav.addObject("totalCount", totalCount);
		mav.addObject("memTotal", memTotal);
		
		mav.addObject("movie", movie);
		
		
		//eventList Get
		List<EventBean> eventList = null;
		eventList = eventDao.GetEventList();
		mav.addObject("eventList",eventList);
		
		
		//NoticeData Get
		List<BoardBean> noticeMainList = null;
		noticeMainList = boardDao.GetNoticeForMain();
		
		String root_path = session.getServletContext().getRealPath("/resources/upload");	
		
		for(int i = 0 ; i < noticeMainList.size(); i++){
			File file = new File(root_path + "/" + noticeMainList.get(i).getBcon());
			
			noticeMainList.get(i).getBcon();
			
			Scanner scan = null;
			if (file.exists()) {
				try {
					scan = new Scanner(file);
					String strBuffer = "";

					while (scan.hasNextLine()) {
						strBuffer += scan.nextLine();
						System.out.println("strBuffer" + strBuffer);
					}
										
					noticeMainList.get(i).setBcon(strBuffer);
				
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		mav.addObject("noticeMainList", noticeMainList);
		
		//占쏙옙청占쏙옙構占쏙옙占�
		
		System.out.println("usid: "+ usid);
		
		int unum = 0;
		//占쏙옙慣占쏙옙館占� 
		if(usid==null){
			unum=0;	
		//占싸깍옙占싸쏙옙
		}else{
			unum = (Integer)session.getAttribute("unum");	
		}
		
		
		List<MovieBean> viewList = movieDao.GetViewList(unum);
		
		mav.addObject("viewList",viewList);
		mav.setViewName(getPage);
		 
		 
		return mav;
	}

}
