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
	public String doActionPost(
			HttpServletRequest request,
			MovieBean movieBean,
			@RequestParam("mrepo") String mrepo,
			@RequestParam("mimg") String mimg,
			@RequestParam("old_murl") String old_murl,
			@RequestParam("thumbnail") MultipartFile thumbnail,
			@RequestParam(value = "f_mrepo", required = false) MultipartFile f_mrepo,
			HttpSession session) {

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

		if(movieBean.getMurl() == null){
			movieBean.setMurl("");
		}
		
		boolean newthum = false;
		boolean newrepo = false;
		// 占쎈씜占쎈쑓占쎌뵠占쎈뱜 占쎈쭆 占쎄퐶占쎄퐬占쎌뵬 占쎌젟癰귨옙 野껓옙占쎄텢

		String del_fname = mrepo;

		String del_imgname = mimg;
		System.out.println(thumbnail.getOriginalFilename());
		if (thumbnail.getOriginalFilename() != "") {
			newthum = true; // 占쎄퉱嚥≪뮇�뒲 占쎌뵠沃섎챷占썲첎占� 占쎈굶占쎈선占쎌긾
			System.out.println("占쎌뵠沃섎챷占� 占쎌젟癰귨옙 揶쏄퉮�뻿");
			movieBean.setMimg(thumbnail.getOriginalFilename()); // 占쎄퉱嚥∽옙 占쎈굶占쎈선占쎌궔
																// 占쎈솁占쎌뵬 占쎌뵠�뵳袁⑹뱽// 占쏙옙占쎌삢
		} else {
			System.out.println("占쎌뵠沃섎챷占� 占쎌젟癰귨옙 揶쏄퉮�뻿 占쎈툧占쎈쭡");
			System.out.println(movieBean.getMimg());
		}
		
		// 占쎄퉱嚥∽옙 占쎌궞占쎌뵬占쎌궔 占쎈솁占쎌뵬占쎌뵠 占쎌뿳占쎈뮉筌욑옙 野껓옙占쎄텢(url占쎌뵠 占쎈툡占쎈빒 占쎈솁占쎌뵬占쎌뵠 占쎈굶占쎈선占쎌긾)
		if (f_mrepo !=null && movieBean.getMrepo() != null) {
			newrepo = true;
			movieBean.setMrepo(f_mrepo.getOriginalFilename()); // 占쎄퉱嚥∽옙 占쎈굶占쎈선占쎌궔
		}

		if (f_mrepo == null) {
			movieBean.setMrepo("");
			newrepo= false;
		}
		
		if(movieBean.getMurl() == null){
			movieBean.setMurl(old_murl);
		}
		// db update===================

		movieDao.UpdateContents(movieBean);

		// db update===================

		// 占쏙옙占쎌삢 占쎌맄燁삼옙
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB/" + movieBean.getMnum());
		
		File root_file = new File(root_path);
		if(!root_file.exists()){
			root_file.mkdir();
		}
		
		// delete file case by new uri
		if (newrepo == false) {
			deloldfile(root_path, del_fname);
		}

		// 占쎄퐶占쎄퐬占쎌뵬占쎌뵠 揶쏄퉮�뻿 占쎈┷占쎈�占쎈뼄筌롳옙
		if (newthum == true) {
			renewThumbnail(root_path, del_imgname, thumbnail);
		}
		// 占쎈솁占쎌뵬占쎌뵠 揶쏄퉮�뻿 占쎈┷占쎈�占쎈뼄筌롳옙
		if (newrepo == true) {
			renwFile(root_path, del_fname, f_mrepo);
		}
		return getPage + "?mnum=" + movieBean.getMnum();
	}

	private void deloldfile(String root_path, String del_fname) {
		System.out.println(root_path + "/" + del_fname);
		
		File del_old_f = new File(root_path + "/" + del_fname);
		if (del_old_f.exists() && !del_old_f.isDirectory()) {
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
		
		File cf = new File(root_path);
		if(!cf.exists()){
			cf.mkdir();
		}
		// 疫꿸퀣�� 占쎌젟癰귨옙 占쎄텣占쎌젫
		File del_thum_f = new File(root_path + "/" + del_fname);
		if (del_thum_f.exists()) {
			System.out.println(root_path + "/" + del_fname);
			System.out.println("占쎌맄 野껋럥以덌옙肉� 占쎈솁占쎌뵬 鈺곕똻�삺");
			if (del_thum_f.delete()) {
				System.out.println("疫꿸퀣�� 占쎈솁占쎌뵬 占쎄텣占쎌젫");
			} else {
				System.out.println("占쎄텣占쎌젫 占쎈뼄占쎈솭");
			}

		}

		// 占쎈솁占쎌뵬 占쎄땜占쎌뿯
		File new_movie_f = new File(root_path + "/" + f_mrepo.getOriginalFilename());
		try {
			out = new FileOutputStream(new_movie_f);
			byte[] bytes = f_mrepo.getBytes(); // 獄쏅뗄�뵠占쎈뱜 占쎌젟癰귨옙
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

		// 疫꿸퀣�� 占쎌젟癰귨옙 占쎄텣占쎌젫
		File del_thum_f = new File(root_path + "/" + del_imgname);
		if (del_thum_f.exists()) {
			del_thum_f.delete();
			System.out.println("疫꿸퀣�� 占쎄퐶占쎄퐬占쎌뵬 占쎄텣占쎌젫");
		}

		// 占쎄퐶占쎄퐬占쎌뵬 占쎄땜占쎌뿯
		File new_thum_f = new File(root_path + "/" + thumbnail.getOriginalFilename());
		try {
			out = new FileOutputStream(new_thum_f);
			byte[] bytes = thumbnail.getBytes(); // 獄쏅뗄�뵠占쎈뱜 占쎌젟癰귨옙
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
