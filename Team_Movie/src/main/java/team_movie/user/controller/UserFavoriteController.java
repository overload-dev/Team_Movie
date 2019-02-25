package team_movie.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.FavoriteBean;
import team_movie.model.FavoriteDao;
import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;
import team_movie.model.UserDao;

@Controller
public class UserFavoriteController {
	
	private final String command="userFavorite.tm";
	private final String getPage="body/user/userEdit";
	
	
	@Autowired
	FavoriteDao favoriteDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	GenreDao genreDao;
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doActionGet(
		HttpSession session
		){
		
		
		System.out.println("Áñ°ÜÃ£±â Æû"); 
		 
		ModelAndView mav = new ModelAndView();
		
		Integer unum = (Integer)session.getAttribute("unum");
		List<FavoriteBean> fLists= new ArrayList<FavoriteBean>();
		MovieBean mBean = new MovieBean();
		List<MovieBean> mLists=new ArrayList<MovieBean>();
		fLists =favoriteDao.GetFavofiteAllData(unum);
		
		FavoriteBean fBean = new FavoriteBean();
		
		for(int i = 0 ;i <fLists.size();i++){
			fBean = fLists.get(i);
			int fmnum=fBean.getFmnum();
			System.out.println("fmnum :"+fmnum);
			
			mBean=movieDao.GetFavoriteCon(fmnum);
			System.out.println("mBean.getMnum():"+ mBean.getMnum());
			
			mLists.add(mBean);
		}
		System.out.println("mLists.size():"+mLists.size());
		//genreµ¥ÀÌÅÍ
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		mav.addObject("mLists",mLists);
		mav.addObject("page","userFavorite");
		mav.setViewName(getPage);
		return mav;
	}
}
