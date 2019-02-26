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
public class UserFindPwController {

	private final String command = "findPw.tm";
	private final String getPage = "body/user/findIdPw";
	private final String gotoPage = "body/user/findPwCheck";


	@Autowired 
	UserDao userDao;
	@Autowired
	GenreDao genreDao;
	//login에서 비밀번호 찾기 클릭했을때
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		return getPage;
	}

	//findPw.jsp에서 비밀 번호 찾기 버튼을 클릭 했을 때
	@RequestMapping(value=command , method= RequestMethod.POST)
	public ModelAndView doActionPost(
			@RequestParam(value="usid") String usid,
			@RequestParam(value="uname") String uname,
			@RequestParam(value="ubirth" ,required =false) String ubirth,
			HttpServletResponse response,
			HttpServletRequest request) throws IOException{
		System.out.println("findPw.jsp에서 비밀 번호 찾기 버튼을 클릭");

		UserBean userBean = new UserBean();
		
		
		userBean.setUname(uname);
		userBean.setUsid(usid);
		
		Date ub = null;
		
		if(ubirth != ""){
			ub = Date.valueOf(ubirth);
			userBean.setUbirth(ub);
		}

	

		ModelAndView mav = new ModelAndView();
		//genre데이터
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		UserBean findPw = this.userDao.GetPwData(userBean);
		System.out.println("findPw : "+ findPw);
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( findPw == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('ID가 잘못되었습니다.');");
			writer.println("history.back();"); 
			writer.println("</script>");
			writer.flush(); 
			return new ModelAndView( getPage ) ;

		}else{
			if(userBean.getUsid().equals(findPw.getUsid())
					&& userBean.getUbirth().equals(findPw.getUbirth())
					&& userBean.getUname().equals(findPw.getUname()))
			{
				System.out.println("pw찾기 성공");
				mav.addObject("findPw",findPw.getUpw());
				mav.setViewName(gotoPage);

			}else if(!userBean.getUname().equals(findPw.getUname())){

				writer.println("<script type='text/javascript'>");
				writer.println("alert('이름이 잘못되었습니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();

				return new ModelAndView( getPage );//로그인 실패 userLogin.jsp
			}else if(!userBean.getUbirth().equals(findPw.getUbirth())){

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
