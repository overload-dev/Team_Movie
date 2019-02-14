package team_movie.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserFindIdController {
	
	private static final String command = "findId.tm";
	private static final String getPage = "body/user/findId";
	private static final String gotoPage ="redirect:/main.tm";
	
	@Autowired 
	UserDao userDao;
	
	//main에서 lonin 버튼을 클릭 했을 때
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
		UserBean findId = this.userDao.GetIdData(userBean);
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( findId == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('입력하신 이름은 존재하지 않습니다.');");
			writer.println("history.back();"); 
			writer.println("</script>");
			writer.flush(); 
			return new ModelAndView( getPage ) ;

		}else{
			if(userBean.getUsid().equals(findId.getUsid())&& userBean.getUpw().equals(findId.getUpw()))
			{
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('찾으시는 아이디는"+findId.getUsid()+"입니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				mav.setViewName(gotoPage);// 로그인 성공 메인페이지
				 
			}else{
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('입력하신 생일이 잘못되었습니다.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();
				
				return new ModelAndView( getPage );//로그인 실패 userLogin.jsp
			}
		}
		
		return mav;
	}
	
}