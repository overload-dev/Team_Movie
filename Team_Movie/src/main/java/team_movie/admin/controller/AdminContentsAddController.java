package team_movie.admin.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminContentsAddController{

	private static final String command = "addContentsEdit.tm";
	private static final String gotoPage = "body/admin/adminContentsAdd";
	private static final String getPage = "redirect:/adminContentsEdit.tm";

	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;

	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;

	// new movieContents Add
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(Model model) {

		// GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);

		return gotoPage;
	}

	@SuppressWarnings("resource")
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(HttpServletRequest request, MovieBean movieBean,
			@RequestParam("thumbnail") MultipartFile thumbnail,
			@RequestParam(value = "f_mrepo", required = false) MultipartFile f_mrepo,
			HttpSession session
			) {
		System.out.println("##############################################");
		System.out.println("name :" + movieBean.getMname());
		System.out.println("genre :" + movieBean.getMgenre());
		System.out.println("dir :" + movieBean.getMdir());
		System.out.println("pro :" + movieBean.getMpro());
		System.out.println("actor :" + movieBean.getMactor());
		System.out.println("sup :" + movieBean.getMsup());
		System.out.println("age :" + movieBean.getMage());
		System.out.println("rdate :" + movieBean.getMrdate());
		System.out.println("wcon :" + movieBean.getMwcon());
		
		System.out.println("##########################################");
		System.out.println("mimg :" + thumbnail.getName());
		
		
		if(f_mrepo != null){
			System.out.println("url :" + f_mrepo.getName());
		}else{
			movieBean.setMrepo("");
			System.out.println("url :" +movieBean.getMurl());
		}
		
		
		System.out.println("##############################################");

		// ������
		movieBean.setMimg(thumbnail.getOriginalFilename());
		// ���� �̸�
		if(f_mrepo != null){
			movieBean.setMrepo(f_mrepo.getOriginalFilename());
		}

		// DB �Է� ���� ������ �� ���
		int getIndex = movieDao.AddMovie(movieBean);

		System.out.println("getIndex : " + getIndex);

		// C����̺꿡 1�� ���� ����
		;
		
		
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB");
		System.out.println(root_path);
		File file_f = new File(root_path);
		File file_s = new File(root_path + "/" + getIndex);
		
		// 1차 경로
		if (!file_f.exists()) {// 기존 폴더가 없을 경우
			file_f.mkdir(); //새로 만든다
			//deleteFile(file_s);
		}else{
			file_s.mkdir(); //기존 경로가 있다면 2차 경로를 생성
		}
		
		File thumbnail_f = new File(file_s.getPath()+ "/" + thumbnail.getOriginalFilename());
		
		File f_mrepo_f = null;
		if(f_mrepo != null){
			f_mrepo_f = new File(file_s.getPath()+ "/" + f_mrepo.getOriginalFilename());
		}
		
		try {
			OutputStream out = new FileOutputStream(thumbnail_f);
			byte[] bytes = thumbnail.getBytes(); //바이트 정보
			out.write(bytes);
			if(f_mrepo != null){
				out = new FileOutputStream(f_mrepo_f);
				bytes = f_mrepo.getBytes(); //바이트 정보
				out.write(bytes);
			}
			out.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return getPage;
	}
	
	public void deleteFile(File file_s){
		// 폴더 내부를 순회하며 모든 파일을 지운다.
		File[] del_f = file_s.listFiles();
		if(del_f != null){
			for (int i = 0; i < del_f.length; i++) {
				del_f[i].delete();
			}
		}
	}


	
	
}
