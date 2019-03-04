package team_movie.user.controller;



import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.LatestviewDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserInsertController {
	
	private static final String command = "userInsert.tm";
	private static final String getPage = "body/user/userInsert";
	private static final String gotoPage ="redirect:/main.tm";
	
	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;
	
	@Autowired 
	@Qualifier("myUserDao")
	UserDao userDao;
	
	@Autowired
	@Qualifier("myLatestviewDao")
	LatestviewDao latestviewDao;
	//main���� login ��ư�� Ŭ�� ���� ��
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(Model model){
		
		//GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);	
		return getPage;
	}
	
	
	@RequestMapping(value=command , method= RequestMethod.POST)
	@ResponseBody
	public int doActionPost(
			@RequestParam(value="ugrade", required=true) int ugrade,
			@RequestParam(value="usid", required=true) String usid,
			@RequestParam(value="uname", required=true) String uname,
			@RequestParam(value="upw", required=true) String upw,
			@RequestParam(value="ugenre", required=true) String ugenre,
			@RequestParam(value="ubirth", required=true) String insertubirth
			){ 
			System.out.println("�����μ�Ʈ");
			UserBean userBean= new UserBean();	
			Date ubirth = Date.valueOf(insertubirth);
			
			System.out.println(ugrade);
			System.out.println(ubirth);
			System.out.println(usid);
			System.out.println(uname);
			System.out.println(upw);
			System.out.println(ugenre);
			
			userBean.setUgrade(ugrade);
			userBean.setUsid(usid);
			userBean.setUname(uname);
			userBean.setUpw(upw);
			userBean.setUbirth(ubirth);
			userBean.setUgenre(ugenre);
		
		
		int cnt =-1;
		cnt = userDao.userInsert(userBean);
		 
	
		
		return cnt;
	}
	
}