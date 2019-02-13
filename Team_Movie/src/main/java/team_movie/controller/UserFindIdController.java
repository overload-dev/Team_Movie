package team_movie.controller;



import java.sql.Timestamp;

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
	public String doActionPost(
						UserBean userBean,
						HttpServletResponse response){
		System.out.println("findId.jsp에서 아이디찾기 버튼을 클릭");
		
		//임의로 삽입 ubirth 삽입 회원가입에서 삽입하는 문제 해결되면 바뀔 부분
		String text = "2019-01-01";
		Timestamp ts = Timestamp.valueOf(text);
		System.out.println(ts); 
		userBean.setUbirth(ts);
		System.out.println("userBean.getUname() :"+userBean.getUname());
		System.out.println("userBean.getUbirth() :"+userBean.getUbirth());
		
		
		ModelAndView mav = new ModelAndView();
		UserBean findId = this.userDao.GetIdData(userBean);
		
		System.out.println("findId.getUname() :"+findId.getUname());
		System.out.println("findId.getUbirth() :"+findId.getUbirth());
		  
		
		return gotoPage;
	}
	
}