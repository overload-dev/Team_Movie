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
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserFindIdController {
	
	private static final String command = "findId.tm";
	private static final String getPage = "body/user/findId";
	private static final String gotoPage ="body/user/findIdCheck";
	
	@Autowired 
	UserDao userDao;
	@Autowired
	GenreDao genreDao;
	
	//login에서 아이디찾기 버튼을 클릭 했을 때
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		return getPage;
	} 
	
	//findId.jsp에서 아이디찾기 버튼을 클릭 했을 때
	@RequestMapping(value=command , method= RequestMethod.POST)
	public ModelAndView doActionPost(
						UserBean userBean,
						HttpServletResponse response,
						HttpServletRequest request) throws IOException{
		
		
		System.out.println("findId.jsp에서 아이디찾기 버튼을 클릭");
		 
		String yy= request.getParameter("yy");
		String mm=request.getParameter("mm");
		String dd=request.getParameter("dd");
		String date = yy+"-"+mm+"-"+dd;
		Date ubirth = Date.valueOf(date);
		userBean.setUbirth(ubirth);
		
		System.out.println("userBean.getUname() :"+userBean.getUname());
		System.out.println("userBean.getUbirth() :"+userBean.getUbirth());
		
		ModelAndView mav = new ModelAndView();
		
		//genre데이터
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		
		UserBean findId = this.userDao.GetIdData(userBean);
		System.out.println("findId : "+ findId);
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( findId == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('입력하신 이름의 회원정보가 존재하지 않습니다.');");
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
				writer.println("alert('입력하신 생년월일이 잘못되었습니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();
				
				return new ModelAndView( getPage );//로그인 실패 userLogin.jsp
			}
		}
		return mav;
	}
	
}