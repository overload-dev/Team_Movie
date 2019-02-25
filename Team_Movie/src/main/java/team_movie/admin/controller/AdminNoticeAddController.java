package team_movie.admin.controller;

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
public class AdminNoticeAddController {
	
	private static final String command ="addNoticeEdit.tm";

	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public int doActionGet(
			@RequestParam("bsubject") String bsubject,
			@RequestParam("bcon") String bcon,
			HttpSession session
			){
		System.out.println(session.getAttribute("unum"));
		System.out.println(session.getAttribute("unum"));
		System.out.println(session.getAttribute("unum"));
		System.out.println(session.getAttribute("unum"));
		System.out.println(session.getAttribute("unum"));

		
		int unum = (Integer) session.getAttribute("unum");
		
		BoardBean boardBean = new BoardBean();
		
		boardBean.setBunum(unum);
		boardBean.setBsubject(bsubject);
		boardBean.setBcon(bcon);
		
		int chk = -1;
		chk = boardDao.AddNotice(boardBean);
		
		if (chk <= -1){
			System.out.println("notice add fail");
		}else{
			System.out.println("notice add done");
		}
		
		return chk;
		
	}
}
