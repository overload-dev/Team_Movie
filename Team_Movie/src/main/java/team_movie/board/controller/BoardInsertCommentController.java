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
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	@ResponseBody
	public int doAcitonPost(
			@RequestParam(value="bref", required=true) int bref,
			@RequestParam(value="replySub", required=true) String replySub,
			@RequestParam(value="replyCon", required=true) String replyCon,
			@RequestParam(value="replyUnum", required=true) int replyUnum,
			@RequestParam(value="replyMnum", required=true) int replyMnum
			
			) {
		System.out.println("insertComment Get");
		System.out.println("bref : " + bref);
		System.out.println("replyMnum : " + replyMnum);
		System.out.println("replyUnum : " + replyUnum);
		System.out.println("replySub : " + replySub);
		System.out.println("replyCon : " + replyCon);
		
		BoardBean board = new BoardBean();
		
		board.setBref(bref);
		board.setBmnum(replyMnum);
		board.setBunum(replyUnum);
		board.setBsubject(replySub);
		board.setBcon(replyCon);
		
		int cnt = -1;
		cnt = boardDao.UpdateReplyComment(board);
		cnt = boardDao.InsertReplyComment(board);
		
		return cnt;
	}
}
