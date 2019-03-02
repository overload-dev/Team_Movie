package team_movie.admin.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.parsing.GenericTokenParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.BoardBean;
import team_movie.model.BoardDao;

@Controller
public class AdminNoticeWriteController {
	
	private static final String command = "writeNoticeEdit.tm";
	private static final String gotoPage = "body/admin/adminEditNoticeWrite";
	private static final String getPage ="redirect:/adminNoticeEdit.tm";
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(Model model) {
		return gotoPage;
	}
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(@RequestParam("smarteditor") String smarteditor,
			@RequestParam("bsubject") String bsubject, HttpSession session) {
		System.out.println(smarteditor);
		
		String root_path = session.getServletContext().getRealPath("/resources/upload");
		// 문장 구성 요소가 많으므로 별도의 파일을 만든다
		File file = new File(root_path + "/" + bsubject + ".txt");

		if (file.exists()) { // 중복 파일이 존재한다면
			int fnum = 1;
			//중복하지 않은 파일명이 나올때 까지 넘버링
			do {
				System.out.println(root_path + "/" + bsubject + fnum + ".txt");
				file = new File(root_path + "/" + bsubject + fnum + ".txt");
				
				fnum++;
			} while (file.exists());
		}
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(file, true));
			fw.write(smarteditor);
			fw.flush();
			fw.close();
			System.out.println("파일 작성");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//DB Insert
		BoardBean boardBean = new BoardBean();
		boardBean.setBsubject(bsubject);
		boardBean.setBcon(file.getName());
		
		boardDao.AddNotice(boardBean);
		
		return getPage;
	}
}
