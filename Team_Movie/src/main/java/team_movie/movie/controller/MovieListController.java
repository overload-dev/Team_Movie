package team_movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;
import team_movie.model.UserDao;

@Controller
public class MovieListController {
	
	private static final String getPage ="body/main";
	private static final String command ="/main.tm";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@Autowired
	UserDao userDao;
	
	// for get GenreData
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
				@RequestParam(value="usid", required=false) String usid
			){
		System.out.println("MainController doGet 연결");
		
		System.out.println("usid : " + usid);
		
		Map<String, List<MovieBean>> map = new HashMap<String, List<MovieBean>>();
	
		if (usid == null) {
			int[] num = new int[3]; 
			for(int i=0; i<num.length; i++){
				num[i] = (int)(Math.random() * 7) + 1;
				for(int j=0; j<i; j++){
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
				List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genre[i]);
				map.put(genre[i], movieByGenre);
			}

		}
		
		if (usid != null) {
			
			String userGenre = userDao.GetUserGenre(usid);
			
			System.out.println("userGenre : " + userGenre);
			
			String[] genre = userGenre.split(",");
			
			if (genre.length == 3) {
				for (int i=0; i<genre.length; i++) {
					System.out.println("lastGenre["+i+"]" + genre[i]);
					List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genre[i]);
					map.put(genre[i], movieByGenre);
				}
			}
			
			if (genre.length < 3) {
				List<GenreBean> genreList = genreDao.getGenreList();
				
				String[] genreShort = new String[3];
				
				String allGenres = "";
				for (int i=0; i<genreList.size(); i++) {
					allGenres += genreList.get(i).getGname() + "/";
				}
				System.out.println("allGenres : " + allGenres);
				
				String[] allGenre = allGenres.split("/");
				
				HashSet<String> allGenreHs = new HashSet<String>();
				HashSet<String> userGenreHs = new HashSet<String>();
				
				for (int i=0; i<allGenre.length; i++) {
					allGenreHs.add(allGenre[i]);
				}
				System.out.println("insertGenre.length : " + allGenre.length);
				System.out.println("allGenreHs : " + allGenreHs);
				
				for (int i=0; i<genre.length; i++) {
					userGenreHs.add(genre[i]);
				}
				System.out.println("genre.length : " + genre.length);
				System.out.println("userGenre : " + userGenre);
				
				allGenreHs.removeAll(userGenreHs);
				
				System.out.println("allGenreHs.toString() : " + allGenreHs.toString());
				System.out.println("allGenreHs.size() : " + allGenreHs.size());
				
				Iterator<String> iteator = allGenreHs.iterator(); 
				
				String exAllGenres = "";
				
				while(iteator.hasNext()){                            
					exAllGenres += iteator.next() + "/";
				}
				
				System.out.println("exAllGenres : " + exAllGenres);
				String[] exAllGenre = exAllGenres.split("/");
				
				int[] num = new int[3-genre.length];
				for(int i=0; i<3-genre.length; i++){
					num[i] = (int)(Math.random() * allGenreHs.size()) + 1;
					for(int j=0; j<i; j++){
						if(num[i] == num[j]){
							i--;
							break;
						}
					}
				}
				for(int i=0; i<3-genre.length; i++){
					System.out.println("num["+i+"] : " + num[i]);
					System.out.println("exAllGenre[num[" + i +"]] : " + exAllGenre[num[i]-1]);
				}
				for (int i=0; i<genreShort.length; i++) {
					if(i < genre.length) {
						System.out.println("myGenre[" + i + "] " + genre[i]);
						genreShort[i] = genre[i];
					}
					
					if (i >= genre.length){
						System.out.println("exAllGenre[" + i + "] " + exAllGenre[num[i-genre.length]-1]);
						genreShort[i] =  exAllGenre[num[i-genre.length]-1];
					}
					
					System.out.println("lastGenre["+i+"]" + genreShort[i]);
					List<MovieBean> movieByGenre = movieDao.GetMovieListByGenre(genreShort[i]);
					map.put(genreShort[i], movieByGenre);
				}
			}
			
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
