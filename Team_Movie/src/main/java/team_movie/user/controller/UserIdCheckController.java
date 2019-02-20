package team_movie.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.UserDao;

@Controller
public class UserIdCheckController {
	
	private final String command="idCheck.tm";
	private final String getPage="";
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET )
	public void doActionGet(
			
			@RequestParam(value="usid") String usid,
			HttpServletResponse response
			) throws IOException{
		
		String str;
		
		System.out.println("usid="+usid);
		
		
		boolean isCheck	= userDao.SearchID(usid);
		System.out.println("isCheck="+isCheck);
		
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");
		writer=response.getWriter();
		//false면 아이디중복 true면 아이디생성가능
		//false NO 면 true YES 
		if(isCheck){
			str="YES";
			writer.print(str);
		}else{
			str="NO";
			writer.print(str);
		}
		
	}
}
