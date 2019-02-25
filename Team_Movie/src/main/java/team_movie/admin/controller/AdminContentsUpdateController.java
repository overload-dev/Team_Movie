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
	public String doActionPost(HttpServletRequest request, MovieBean movieBean, @RequestParam("mrepo") String mrepo,
			@RequestParam("mimg") String mimg, @RequestParam("thumbnail") MultipartFile thumbnail,
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
		// �뾽�뜲�씠�듃 �맂 �꽟�꽕�씪 �젙蹂� 寃��궗

		String del_fname = mrepo;

		String del_imgname = mimg;
		System.out.println(thumbnail.getOriginalFilename());
		if (thumbnail.getOriginalFilename() != "") {
			newthum = true; // �깉濡쒖슫 �씠誘몄�媛� �뱾�뼱�샂
			System.out.println("�씠誘몄� �젙蹂� 媛깆떊");
			movieBean.setMimg(thumbnail.getOriginalFilename()); // �깉濡� �뱾�뼱�삩
																// �뙆�씪 �씠由꾩쓣
																// ���옣
		} else {
			System.out.println("�씠誘몄� �젙蹂� 媛깆떊 �븞�맖");
			System.out.println(movieBean.getMimg());
		}

		// �깉濡� �삱�씪�삩 �뙆�씪�씠 �엳�뒗吏� 寃��궗(url�씠 �븘�땶 �뙆�씪�씠 �뱾�뼱�샂)
		if (f_mrepo != null && movieBean.getMrepo() != null) {
			newrepo = true;
			movieBean.setMrepo(f_mrepo.getOriginalFilename()); // �깉濡� �뱾�뼱�삩
																// �뙆�씪�쓽 �씠由꾩쓣
																// ���옣
			movieBean.setMurl("");
		}

		if (f_mrepo == null) {
			movieBean.setMrepo("");
		}
		// db update===================

		movieDao.UpdateContents(movieBean);

		// db update===================

		// ���옣 �쐞移�
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB/" + movieBean.getMnum());

		// delete file case by new uri
		if (f_mrepo == null) {
			deloldfile(root_path, del_fname);
		}

		// �꽟�꽕�씪�씠 媛깆떊 �릺�뿀�떎硫�
		if (newthum == true) {
			renewThumbnail(root_path, del_imgname, thumbnail);
		}
		// �뙆�씪�씠 媛깆떊 �릺�뿀�떎硫�
		if (newrepo == true) {
			renwFile(root_path, del_fname, f_mrepo);
		}
		return getPage + "?mnum=" + movieBean.getMnum();
	}

	private void deloldfile(String root_path, String del_fname) {
		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);

		
		File del_old_f = new File(root_path + "/" + del_fname);
		if (del_old_f.exists()) {
			if (del_old_f.delete()) {
				System.out.println("old file deleted");
			} else {
				System.out.println("old file deleted faile");
			}
		} else {
			System.out.println("no file");
		}
	}

	private void renwFile(String root_path, String del_fname, MultipartFile f_mrepo) {
		OutputStream out = null;
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);
		System.out.println(del_fname);

		System.out.println(root_path + "/" + del_fname);
		System.out.println(root_path + "/" + del_fname);
		// 湲곗〈 �젙蹂� �궘�젣
		File del_thum_f = new File(root_path + "/" + del_fname);
		if (del_thum_f.exists()) {
			System.out.println(root_path + "/" + del_fname);
			System.out.println("�쐞 寃쎈줈�뿉 �뙆�씪 議댁옱");
			if (del_thum_f.delete()) {
				System.out.println("湲곗〈 �뙆�씪 �궘�젣");
			} else {
				System.out.println("�궘�젣 �떎�뙣");
			}

		}

		// �뙆�씪 �궫�엯
		File new_movie_f = new File(root_path + "/" + f_mrepo.getOriginalFilename());
		try {
			out = new FileOutputStream(new_movie_f);
			byte[] bytes = f_mrepo.getBytes(); // 諛붿씠�듃 �젙蹂�
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

		// 湲곗〈 �젙蹂� �궘�젣
		File del_thum_f = new File(root_path + "/" + del_imgname);
		if (del_thum_f.exists()) {
			del_thum_f.delete();
			System.out.println("湲곗〈 �꽟�꽕�씪 �궘�젣");
		}

		// �꽟�꽕�씪 �궫�엯
		File new_thum_f = new File(root_path + "/" + thumbnail.getOriginalFilename());
		try {
			out = new FileOutputStream(new_thum_f);
			byte[] bytes = thumbnail.getBytes(); // 諛붿씠�듃 �젙蹂�
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
