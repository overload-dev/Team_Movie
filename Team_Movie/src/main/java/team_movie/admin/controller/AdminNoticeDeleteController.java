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

import team_movie.model.BoardBean;
import team_movie.model.BoardDao;

@Controller
public class AdminNoticeDeleteController {
	
	private static final String command ="deleteNoticeEdit.tm";
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("bnum") int bnum,
			HttpSession session
			){
		
		BoardBean boardBean = null;
		boardBean = boardDao.GetNoticeByNum(bnum);
		
		String root_path = session.getServletContext().getRealPath("/resources/upload");
		File file = new File(root_path +"/" + boardBean.getBcon());
		
		//파일 삭제
		if(file.exists()){
			file.delete();			
		}
		
		int cnt = -1;
		cnt = boardDao.DeleteNotice(bnum);
		return cnt;
	}
}
