package team_movie.board.controller;

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
public class BoardDeleteCommentController {
	private final static String command = "/commentDelete.tm";
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	@ResponseBody
	public int doAcitonGet(
				@RequestParam(value="bnum", required=true) int bnum
			) {
		
		int cnt = -1;
		cnt =  boardDao.DeleteComment(bnum);
		
		return cnt;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	@ResponseBody
	public int doAcitonPost(
			@RequestParam(value="bnum", required=true) int bnum
			) {
		
		int totalCommentByNum = boardDao.totalCommentByNum(bnum);
		
		int cnt = -1;
		
		if(totalCommentByNum == 1) {
			cnt =  boardDao.DeleteComment(bnum);
			
			
			
		}
		else {
			cnt =  boardDao.DeleteFirstComment(bnum);
		}
		
		return cnt;
	}
}
