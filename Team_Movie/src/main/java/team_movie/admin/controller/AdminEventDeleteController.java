package team_movie.admin.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team_movie.model.EventBean;
import team_movie.model.EventDao;

@Controller
public class AdminEventDeleteController {
	private static final String command ="deleteEvent.tm";
	
	@Autowired
	@Qualifier("myEventDao")
	EventDao eventDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("eenum") int eenum,
			HttpSession session
			){
		EventBean eventBean = null;
		eventBean = eventDao.GetEventByNum(eenum);
		
		//파일 삭제
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB");
		File file = new File(root_path + "/" + eventBean.getEmnum() +"/" + eventBean.getEimg());
		if(file.exists()){
			file.delete();
		}
		
		//DB delete
		int chk= -1;
		chk = eventDao.DeleteEvent(eenum);
		return chk;
	}
}
