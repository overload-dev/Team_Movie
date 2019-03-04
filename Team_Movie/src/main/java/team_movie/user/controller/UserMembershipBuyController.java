package team_movie.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team_movie.model.GenreBean;
import team_movie.model.GenreDao;
import team_movie.model.MembershipBean;
import team_movie.model.MembershipDao;
import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Controller
public class UserMembershipBuyController {
	private final String command="mShipBuyForm.tm";
	private final String command2="mShipBuy.tm";
	private final String getPage="body/user/userEdit";
	@Autowired
	@Qualifier("myMembership")
	MembershipDao membershipDao;

	@Autowired
	GenreDao genreDao;
	@Autowired
	UserDao userDao;

	@RequestMapping(value=command ,method=RequestMethod.GET)
	public ModelAndView doActionGet(HttpSession session){
		ModelAndView mav = new ModelAndView();
		//genre������
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);

		System.out.println("�������");
		List<MembershipBean> membershipList = new ArrayList<MembershipBean>();
		membershipList = membershipDao.GetMemberShipList();

		mav.addObject("membershipList",membershipList);
		mav.addObject("page","MShipBuyForm");
		mav.setViewName(getPage);
		return mav;
	} 

	@RequestMapping(value=command2 ,method=RequestMethod.GET)
	public ModelAndView doActionGet(
			@RequestParam(value="mbsnum",required=true) int mbsnum,
			HttpSession session,
			HttpServletResponse response
			) throws IOException{
		ModelAndView mav =new ModelAndView();
		//genre������
		List<GenreBean> genreList = null;
		genreList = genreDao.getGenreList();
		mav.addObject("genreList", genreList);
		String usid =(String)session.getAttribute("usid");

		MembershipBean msBean= membershipDao.GetMemberShip(mbsnum);

		UserBean userBean = new UserBean();
		Timestamp nowTime = new Timestamp(System.currentTimeMillis()); 
		Calendar cal = Calendar.getInstance(); 
		cal.setTimeInMillis(nowTime.getTime()); 
		cal.add(Calendar.DATE, msBean.getMbsperiod()); 
		Timestamp afterTime = new Timestamp(cal.getTime().getTime());

		System.out.println("nowTime :" +nowTime);
		System.out.println("afterTime :"+afterTime);
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if(msBean.getMbsnum()!=0){
			System.out.println("msBean.getMbsnum()!=0");
			System.out.println("usid 123 :"+ usid);

			userBean.setUsid(usid);
			userBean.setUgrade(2);
			userBean.setUupend(afterTime);
			userBean.setUupstart(nowTime);

			int cnt =0;
			cnt =userDao.UpdateMembership(userBean);

			writer.println("<script type='text/javascript'>");
			writer.println("alert('���� �Ϸ� �Ǿ����ϴ�.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.flush(); 

			session.setAttribute("ugrade", "2");
			mav.addObject("page","MShipBuyForm");
			mav.setViewName(getPage);
		}
		return mav;
	}
}
