package team_movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.BoardBean;
import team_movie.model.BoardDao;
import team_movie.model.FavoriteBean;
import team_movie.model.FavoriteDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class MovieContentViewController {
	
	private final static String getPage ="body/movieContent";
	private final static String command = "/movieContent.tm";
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	@Qualifier("MyFavorite")
	FavoriteDao favoriteDao;
	
	@RequestMapping(value=command)
	public String doAcitionGet(	
				@RequestParam(value="mnum", required=true) int mnum,
				Model model,
				HttpSession session
			) {
		
		String usid = (String)session.getAttribute("usid");
		
		System.out.println("·Î±×ÀÎ usid : " + usid);
		
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
		
		List<BoardBean> commentList = boardDao.getCommentListByMnum(mnum);
		
		model.addAttribute("commentList", commentList);
		
		FavoriteBean favor = new FavoriteBean();
		
		int likeCount = 0;
		int bookmarkCount = 0;
		
		if (usid == null) {
			System.out.println("·Î±×ÀÎ ÇÊ¿ä");
			model.addAttribute("likeCount", likeCount);
			model.addAttribute("bookmarkCount", bookmarkCount);
		}
		else if (usid != null) {
			int unum = (Integer)session.getAttribute("unum");
			favor.setFmnum(mnum);
			favor.setFunum(unum);
			likeCount = favoriteDao.GetLikeCount(favor);
			bookmarkCount = favoriteDao.GetBookmarkCount(favor);
			System.out.println("likeCount : " + likeCount);
			System.out.println("bookmarkCount : " + bookmarkCount);
			model.addAttribute("likeCount", likeCount);
			model.addAttribute("bookmarkCount", bookmarkCount);
		}
		String extension = "";
		
		if (movie.getMurl() == null) {
			int i = movie.getMrepo().lastIndexOf('.');
			System.out.println("i : " + i);
			if (i > 0) {
				extension = movie.getMrepo().substring(i+1);
			    System.out.println("extension : " + extension);
			    model.addAttribute("extension", extension);
			}
		}
		return getPage;
	}
}
