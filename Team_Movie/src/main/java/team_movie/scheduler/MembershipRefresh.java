package team_movie.scheduler;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import team_movie.model.UserBean;
import team_movie.model.UserDao;

@Service
public class MembershipRefresh {

	@Autowired
	UserDao userDao;

	@Scheduled(fixedDelay = 1000 * 60) // 60초마다 갱신
	public void membershipGradeRefresh() {

		List<UserBean> userList = userDao.GetAllUserList();

		Calendar cal = Calendar.getInstance();

		Date todayInSec = cal.getTime();
		Date userEndInSec;

		System.out.println("[멤버십 갱신] 현재 시각 : " + cal.getTime());

		for (int i = 0; i < userList.size(); i++) {

			// 스페셜 회원 일 경우
			if (userList.get(i).getUgrade() > 1) {
				userEndInSec = userList.get(i).getUupend();
				// 만료일이 초과 했으면
				if (todayInSec.getTime() > userEndInSec.getTime()) {

					userList.get(i).setUgrade(1); // 일반회원으로 강등
					userList.get(i).setUupstart(null); // 스페셜 시작 일자를 초기화
					userList.get(i).setUupend(null); // 스페셜 종료 일자를 초기화
					int chk = -1;
					// DB 갱신
					chk = userDao.RefreshMembershipForUser(userList.get(i));
					if (chk > -1) {
						System.out.println(userList.get(i).getUsid() + "갱신 성공");
					} else {
						System.out.println("갱신 실패");
					} //end of if
				}//end of if
			}//end of if
		}//end of for
		
	}
}
