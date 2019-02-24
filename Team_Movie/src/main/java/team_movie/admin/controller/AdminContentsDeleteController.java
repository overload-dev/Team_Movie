package team_movie.admin.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team_movie.model.MovieBean;
import team_movie.model.MovieDao;

@Controller
public class AdminContentsDeleteController {

	private static final String command="deleteContentsEdit.tm";
	private static final String gotoPage ="redirect:/adminContentsEdit.tm";
	
	@Autowired
	@Qualifier("MyMovieDao")
	MovieDao movieDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("mnum") int mnum,
			HttpSession session
			){
		
		//DB 파일 삭제 작업
		String root_path = session.getServletContext().getRealPath("/resources/saveMovieDB/" + mnum);
		
		File del_f = new File(root_path);
		File[] del_f_c = del_f.listFiles();
		
		if(del_f.exists()){
			if(del_f_c != null){
				for(int i = 0 ; i < del_f_c.length; i ++){
					del_f_c[i].delete();
				}
			}
			del_f.delete();
		}		
		movieDao.DeleteContents(mnum);
		
		return gotoPage;
	}
}
