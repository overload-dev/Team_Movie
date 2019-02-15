package team_movie.user.controller;



import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserInsertController {
	
	private static final String command = "userInsert.tm";
	private static final String getPage = "body/user/userInsert";
	private static final String gotoPage ="redirect:/main.tm";
	
	@Autowired 
	UserDao userDao;
	
	//main���� login ��ư�� Ŭ�� ���� ��
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(){
		return getPage;
	}
	
	
	@RequestMapping(value=command , method= RequestMethod.POST)
	public String doActionPost(
			UserBean userBean,
			HttpServletRequest request
			){
			
			String insertubirth=request.getParameter("insertubirth");		
			Date ubirth = Date.valueOf(insertubirth);
			
			System.out.println(ubirth);
			
			userBean.setUbirth(ubirth);
		
		System.out.println("userBean.getUgrade()="+userBean.getUgrade());
		System.out.println("userBean.getUsid()=" +userBean.getUsid());
		System.out.println("userBean.getUname()="+userBean.getUname());
		System.out.println("userBean.getUpw()="+userBean.getUpw());
		System.out.println("userBean.getUbirth()="+userBean.getUbirth());
		System.out.println("userBean.getUgenre()="+userBean.getUgenre());
		
		
		int cnt =0;
		cnt = userDao.userInsert(userBean);
		return gotoPage;
	}
	
}