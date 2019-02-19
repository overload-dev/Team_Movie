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
public class BoardUpdateCommentController {
private final static String command = "/commentUpdateList.tm";
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	@ResponseBody
	public BoardBean doAcitonGet(
				@RequestParam(value="bnum", required=true) int bnum
			) {
		
		BoardBean board =  boardDao.getCommentBynum(bnum);
		
		return board;
	}
}
