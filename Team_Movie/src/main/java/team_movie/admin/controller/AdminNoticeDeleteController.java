package team_movie.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			@RequestParam("bnum") int bnum
			){
		int cnt = -1;
		cnt = boardDao.DeleteNotice(bnum);
		return cnt;
	}
}
