package team_movie.user.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserFindIdController {
	
	private static final String command = "findId.tm";
	private static final String getPage = "body/user/findIdPw";
	private static final String gotoPage ="body/user/findIdCheck";
	
	@Autowired 
	UserDao userDao;
	@Autowired
	GenreDao genreDao; 
	
	//login에서 아이디찾기 버튼을 클릭 했을 때
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doActionGet(){
		ModelAndView mav = new ModelAndView();
		//genre데이터
				List<GenreBean> genreList = null;
				genreList = genreDao.getGenreList();
				mav.addObject("genreList", genreList);
				mav.setViewName(getPage);
		return mav;
	} 
	
	//findIdPw.jsp에서 아이디찾기 버튼을 클릭 했을 때
	@RequestMapping(value=command , method= RequestMethod.POST)
	public ModelAndView doActionPost(
						@RequestParam(value="uname") String uname,
						@RequestParam(value="ubirth" ,required =false) String ubirth,
						HttpServletResponse response,
						HttpServletRequest request) throws IOException{
		
		 
		System.out.println("ubirth :" +ubirth );
		System.out.println("findId.jsp에서 아이디찾기 버튼을 클릭");
		 	
		UserBean userBean = new UserBean();
		
		
		userBean.setUname(uname);
		Date ub = null;
		
		if(ubirth != ""){
			ub = Date.valueOf(ubirth);
			userBean.setUbirth(ub);
		}
		//userBean.setUbirth(ubirth);
		
		
		ModelAndView mav = new ModelAndView();
		
		
		
		UserBean findId = this.userDao.GetIdData(userBean);
		System.out.println("findId : "+ findId);
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( findId == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('이름이 잘못되었습니다.');");
			writer.println("history.back();"); 
			writer.println("</script>");
			writer.flush(); 
			return new ModelAndView( getPage ) ;

		}else{
			if(userBean.getUname().equals(findId.getUname())&& userBean.getUbirth().equals(findId.getUbirth()))
			{
				mav.addObject("findId",findId.getUsid());
				mav.setViewName(gotoPage);
				 
			}else{
				
				writer.println("<script type='text/javascript'>");
				writer.println("alert('생년월일이 잘못되었습니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();
				
				return new ModelAndView( getPage );//로그인 실패 userLogin.jsp
			}
		}
		return mav;
	}
	
}