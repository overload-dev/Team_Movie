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
public class BoardInsertCommentController {
	private final static String command = "/commentInsert.tm";
	
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	@ResponseBody
	public int doAcitonGet(
				@RequestParam(value="bsubject", required=true) String bsubject,
				@RequestParam(value="bcon", required=true) String bcon,
				@RequestParam(value="mnum", required=true) int bmnum,
				@RequestParam(value="unum", required=true) int bunum
			
			) {
		System.out.println("insertComment Get");
		System.out.println("bmnum : " + bmnum);
		System.out.println("bunum : " + bunum);
		System.out.println("bsubject : " + bsubject);
		System.out.println("bcon : " + bcon);
		
		BoardBean board = new BoardBean();
		
		board.setBmnum(bmnum);
		board.setBunum(bunum);
		board.setBsubject(bsubject);
		board.setBcon(bcon);
		
		int cnt = -1;
		
		cnt = boardDao.InsertComment(board);
		
		return cnt;
	}
}
