package team_movie.admin.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminContentsUpdateController {

	private static final String command = "updateContentsEdit.tm";
	private static final String gotoPage = "body/admin/adminContentsUpdate";
	private static final String getPage = "redirect:/adminContentsView.tm";

	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;

	@Autowired
	@Qualifier("myGenreDao")
	GenreDao genreDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam("mnum") int mnum, Model model) {

		MovieBean movieBean = new MovieBean();
		movieBean = movieDao.GetMovieByNum(mnum);
		model.addAttribute("movieBean", movieBean);

		// GenreData Get
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		model.addAttribute("genreList", genreList);
		return gotoPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(HttpServletRequest request, MovieBean movieBean,
			@RequestParam("mrepo") String mrepo,
			@RequestParam("mimg") String mimg,
			@RequestParam("thumbnail") MultipartFile thumbnail,
			@RequestParam(value = "f_mrepo", required = false) MultipartFile f_mrepo, HttpSession session) {

		System.out.println("##############################################");
		System.out.println("thumbnail" + thumbnail.getName());
		System.out.println("thumbnail" + thumbnail.getOriginalFilename());
		
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
				
		boolean newthum = false;
		boolean newrepo = false;
		// 업데이트 된 섬네일 정보 검사
		
		String del_fname = mrepo;
		
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		
		String del_imgname = mimg;
		System.out.println(thumbnail.getOriginalFilename());
		if (thumbnail.getOriginalFilename() != "") {
			newthum = true; // 새로운 이미지가 들어옴
			System.out.println("이미지 정보 갱신");
			movieBean.setMimg(thumbnail.getOriginalFilename()); // 새로 들어온 파일 이름을 저장
		}else{
			System.out.println("이미지 정보 갱신 안됨");
			System.out.println(movieBean.getMimg());
		}

		// 새로 올라온 파일이 있는지 검사(url이 아닌 파일이 들어옴)
		if (f_mrepo.getOriginalFilename() != "" && movieBean.getMrepo() != null) {
			newrepo = true;
			movieBean.setMrepo(f_mrepo.getOriginalFilename()); // 새로 들어온 파일의 이름을 저장
			movieBean.setMurl("");
		}

		// db update===================
		
		movieDao.UpdateContents(movieBean);
		
		// db update===================

		// 저장 위치
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB/" + movieBean.getMnum());

		// 섬네일이 갱신 되었다면
		if (newthum == true) {
			renewThumbnail(root_path, del_imgname, thumbnail);
		}
		// 파일이 갱신 되었다면
		if (newrepo == true) {
			renwFile(root_path, del_fname, f_mrepo);
		}
		return getPage +"?mnum=" + movieBean.getMnum();
	}

	
	
	
	private void renwFile(String root_path, String del_fname, MultipartFile f_mrepo) {
		OutputStream out = null;
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);

		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);
		// 기존 정보 삭제
		File del_thum_f = new File(root_path + "/" + del_fname);
		if (del_thum_f.exists()) {
			System.out.println(root_path + "/" + del_fname);
			System.out.println("위 경로에 파일 존재");
			if(del_thum_f.delete()){
				System.out.println("기존 파일 삭제");				
			}else{
				System.out.println("삭제 실패");
			}
			
			
		}

		// 파일 삽입
		File new_movie_f = new File(root_path + "/" + f_mrepo.getOriginalFilename());
		try {
			out = new FileOutputStream(new_movie_f);
			byte[] bytes = f_mrepo.getBytes(); // 바이트 정보
			out.write(bytes);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void renewThumbnail(String root_path, String del_imgname, MultipartFile thumbnail) {
		// TODO Auto-generated method stub

		OutputStream out = null;

		// 기존 정보 삭제
		File del_thum_f = new File(root_path + "/" + del_imgname);
		if (del_thum_f.exists()) {
			del_thum_f.delete();
			System.out.println("기존 섬네일 삭제");
		}

		// 섬네일 삽입
		File new_thum_f = new File(root_path + "/" + thumbnail.getOriginalFilename());
		try {
			out = new FileOutputStream(new_thum_f);
			byte[] bytes = thumbnail.getBytes(); // 바이트 정보
			out.write(bytes);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
