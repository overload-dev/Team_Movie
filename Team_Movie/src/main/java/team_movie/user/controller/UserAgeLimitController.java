package team_movie.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserAgeLimitController {
	
	private final String command="userAgeLimit.tm";
	
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
		@RequestParam(value="mnum") int mnum,
		HttpSession session,
		HttpServletResponse response
			) throws IOException{
		System.out.println("mnum asdasdasdas: " + mnum);
		String usid =(String)session.getAttribute("usid");
		System.out.println("Limit unum : "+ usid);
			
		if(usid != null){
		//시청연령관련
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); 

			System.out.println("ubirth:"+ session.getAttribute("ubirth"));
		
			Date day =(Date)session.getAttribute("ubirth");

			//회원 년생
			String year=sdf.format(day); 

			System.out.println("year : "+year);
			int yearInt= Integer.parseInt(year);
			//현재 년도	
			String nowYear = sdf.format (System.currentTimeMillis());

			System.out.println("nowYear :"+nowYear);
			int nowYearInt= Integer.parseInt(nowYear);
 
			int ageLimit = nowYearInt - yearInt; 
		
			System.out.println("ageLimit : "+ ageLimit);
		
			return ageLimit;
		}else{
			
			
			return -1;
		}
	}
}
