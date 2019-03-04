package team_movie.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMembership_LogDao")
public class Membership_LogDao {
	
	public static final String namespace="team_movie.model.Membership_LogBean";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int InsertLog(Membership_LogBean membership_LogBean){
		int chk = -1;
		
		System.out.println(membership_LogBean.getMlunum());
		System.out.println(membership_LogBean.getMlmbsname());
		System.out.println(membership_LogBean.getMlmbsperiod());
		System.out.println(membership_LogBean.getMlmbsprice());
		System.out.println(membership_LogBean.getMlupstart());
		System.out.println(membership_LogBean.getMlupend());
		chk = sqlSessionTemplate.insert(namespace +".InsertLog", membership_LogBean);
		return chk;
	}
	
}
