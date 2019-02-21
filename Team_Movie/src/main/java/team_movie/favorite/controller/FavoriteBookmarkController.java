package team_movie.favorite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.FavoriteBean;
import team_movie.model.FavoriteDao;
import team_movie.model.MovieDao;

@Controller
public class FavoriteBookmarkController {
	private final static String command = "/movieBookmark.tm";
	
	@Autowired
	FavoriteDao favoriteDao;
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
				@RequestParam(value="mnum", required=true) int mnum,
				@RequestParam(value="unum", required=true) int unum
			) {
		System.out.println("like Get controller");
		
		FavoriteBean favor = new FavoriteBean();
		
		favor.setFmnum(mnum);
		favor.setFunum(unum);
		
		int cnt = -1;
		cnt = favoriteDao.MovieBookmarkInsert(favor);
		return cnt;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	@ResponseBody
	public int doActionPost(
			@RequestParam(value="mnum", required=true) int mnum,
			@RequestParam(value="unum", required=true) int unum
			) {
		System.out.println("like Post controller");
		
		FavoriteBean favor = new FavoriteBean();
		
		favor.setFmnum(mnum);
		favor.setFunum(unum);
		
		int cnt = -1;
		cnt = favoriteDao.MovieBookmarkDelete(favor);
		return cnt;
	}
	
}
