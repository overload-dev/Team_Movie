package team_movie.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
import team_movie.model.Membership_LogBean;
import team_movie.model.Membership_LogDao;
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
	
	@Autowired
	@Qualifier("myMembership_LogDao")
	Membership_LogDao membership_logDao;
	
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
		
		
		//멤버십에 해당하는 정보
		MembershipBean msBean= membershipDao.GetMemberShip(mbsnum);
		
		
		//현재 시간
		Timestamp nowTime = new Timestamp(System.currentTimeMillis()); 
		
		//추기 될 시간
		Calendar cal = Calendar.getInstance(); 
		cal.setTimeInMillis(nowTime.getTime()); 
		cal.add(Calendar.DATE, msBean.getMbsperiod()); 
		Timestamp afterTime = new Timestamp(cal.getTime().getTime());
		System.out.println("nowTime :" +nowTime);
		System.out.println("afterTime :"+afterTime);
		//---------------------------------
		
		//출력??
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();
		//---------------------------------
		
		
		
		UserBean userBean = new UserBean();
		int unum = (Integer) session.getAttribute("unum");
		
		UserBean myInfo = null;
		
		myInfo = userDao.GetMyInfo(unum);
		
		
		//로그 기록용
		Membership_LogBean mbslog = new Membership_LogBean();
		if(myInfo.getUgrade() >= 2){
			//이미 스페셜인경우
			userBean.setUnum(unum);
			
			Calendar addTime = Calendar.getInstance();
			
			addTime.setTimeInMillis(myInfo.getUupend().getTime());
			addTime.add(Calendar.DATE, msBean.getMbsperiod());
			
			Timestamp addTimeSet = new Timestamp(addTime.getTime().getTime());
			
			userBean.setUupend(addTimeSet); //끝나는 날만 연장한다.
			int chk = userDao.UpdateMembershipForAlreadySpecial(userBean);
			if(chk >-1){
				System.out.println("special reflash");
			}
			
			//로그 기록----------------------------------------------
			mbslog.setMlunum(unum); //유저 번호
			mbslog.setMlmbsname(msBean.getMbsname()); //멤버십 이름
			mbslog.setMlmbsprice(msBean.getMbsprice()); //가격
			mbslog.setMlmbsperiod(msBean.getMbsperiod()); //명시된 기간
			
			
			Date st = new Date(myInfo.getUupend().getTime() + (24 * 60 * 60 * 1000)); //시작
			mbslog.setMlupstart(st);
			Date et = new Date(addTimeSet.getTime() + (24 * 60 * 60 * 1000)); //끝
			mbslog.setMlupend(et);
			
			membership_logDao.InsertLog(mbslog);
			
		}else{
			//신규 스페셜 등록일 경우
			userBean.setUnum(unum);
			userBean.setUgrade(2); //승격
			userBean.setUupstart(nowTime); //시작일
			userBean.setUupend(afterTime); //끝나는 날
			int chk = userDao.UpdateMembershipForFirst(userBean);
			if(chk >-1){
				System.out.println("special reflash2");
			}
			
			//로그 기록----------------------------------------------
			mbslog.setMlunum(unum); //유저 번호
			mbslog.setMlmbsname(msBean.getMbsname()); //멤버십 이름
			mbslog.setMlmbsprice(msBean.getMbsprice()); //가격
			mbslog.setMlmbsperiod(msBean.getMbsperiod()); //명시된 기간
			
			Date nt = new Date(nowTime.getTime()); //시작
			mbslog.setMlupstart(nt);
			Date at = new Date(afterTime.getTime()); //끝
			mbslog.setMlupend(at);
			
			membership_logDao.InsertLog(mbslog);
			
		}
		
		writer.println("<script type='text/javascript'>");
		writer.println("alert('���� �Ϸ� �Ǿ����ϴ�.');");
		writer.println("history.back();");
		writer.println("</script>");
		writer.flush(); 
		
		session.setAttribute("ugrade", "2");
		mav.addObject("page","MShipBuyForm");
		mav.setViewName(getPage);
		
		return mav;
	}
}
