package team_movie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserLoginContoller { 

	private static final String command = "userLogin.tm";
	private static final String getPage = "body/user/userLogin";
	private static final String gotoPage ="redirect:/main.tm";
	
	@Autowired
	UserDao userDao;
	
	//main에서 login 버튼을 클릭 했을 때
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		return getPage;
	}
	
	//userLogin.jsp 에서 로그인 버튼 클릭 했을 때
	@RequestMapping(value=command , method= RequestMethod.POST)
	public ModelAndView doActionPost(
			UserBean userBean,
			HttpSession session,
			HttpServletResponse response
			) throws IOException{
		ModelAndView mav = new ModelAndView();
		
		System.out.println("UserLogin.jsp에서 로그인버튼 클릭");
		System.out.println("userBean.getUsid():"+userBean.getUsid());
		UserBean login = this.userDao.GetData(userBean.getUsid());
		//userDao.userLoginSelect(userBean);
		System.out.println("아이디정보 : "+login);
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( login == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('입력하신 아이디는 존재하지 않습니다.');");
			writer.println("history.back();"); 
			writer.println("</script>");
			writer.flush(); 
			return new ModelAndView( getPage ) ;

		}else{
			if(userBean.getUsid().equals(login.getUsid())&& userBean.getUpw().equals(login.getUpw()))
			{
				session.setAttribute("loginfo", login.getUname());
				mav.setViewName(gotoPage);// 로그인 성공 메인페이지
				
			}else{
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('입력하신 비밀번호 잘못되었습니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();
				
				return new ModelAndView( getPage );//로그인 실패 userLogin.jsp
			}
		}
		return mav;
	}
}
