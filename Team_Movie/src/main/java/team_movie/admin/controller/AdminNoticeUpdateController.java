package team_movie.admin.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

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
public class AdminNoticeUpdateController {

	private static final String command = "updateNoticeEdit.tm";
	private static final String gotoPage = "body/admin/adminEditNoticeUpdate";
	private static final String getPage ="redirect:/adminNoticeEdit.tm";
	@Autowired
	@Qualifier("myBoard")
	BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(HttpSession session, @RequestParam("bnum") int bnum, Model model) {

		BoardBean boardBean = new BoardBean();
		boardBean = boardDao.GetNoticeByNum(bnum);
		
		System.out.println( boardBean.getBcon() );
		String root_path = session.getServletContext().getRealPath("/resources/upload");
		// 문장 구성 요소가 많으므로 별도의 파일을 만든다
		File file = new File(root_path + "/" + boardBean.getBcon());
		
		String textFileName = boardBean.getBcon();
		
		Scanner scan = null;
		if (file.exists()) {
			try {
				scan = new Scanner(file);
				String strBuffer = "";

				while (scan.hasNextLine()) {
					strBuffer += scan.nextLine();
					System.out.println("strBuffer" + strBuffer);
				}
				
				boardBean.setBcon(strBuffer);
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		model.addAttribute("textFileName",textFileName);
		model.addAttribute("boardBean", boardBean);

		return gotoPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(
			@RequestParam("bnum") int bnum,
			@RequestParam("bsubject") String bsubject,
			@RequestParam("textFileName") String textFileName,
			@RequestParam("smarteditor") String smarteditor,
			HttpSession session
			){
		System.out.println("포스트 요청");
		
		String root_path = session.getServletContext().getRealPath("/resources/upload");
		File oldFile = new File(root_path + "/" + textFileName);
		
		if(oldFile.exists()){
			
			File newFile = new File(root_path + "/" + bsubject + ".txt");
			
			if(newFile.exists()){
				int fnum = 1;
				//중복하지 않은 파일명이 나올때 까지 넘버링
				do {
					System.out.println(root_path + "/" + bsubject + fnum + ".txt");
					newFile = new File(root_path + "/" + bsubject + fnum + ".txt");
					fnum++;
				} while (newFile.exists());
			}
			
			oldFile.renameTo(newFile);
			
			try {
				BufferedWriter fw = new BufferedWriter(new FileWriter(newFile, true));
				fw.write(smarteditor);
				fw.flush();
				fw.close();
				System.out.println("파일 갱신 작성");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			BoardBean boardBean = new BoardBean();
			boardBean.setBnum(bnum);
			boardBean.setBsubject(bsubject);
			boardBean.setBcon(newFile.getName());
			boardDao.UpdateNotice(boardBean);
		}
		
		return getPage;
	}
}
