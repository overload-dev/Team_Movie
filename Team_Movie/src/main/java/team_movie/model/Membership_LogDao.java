package team_movie.model;

import java.util.List;

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
		chk = sqlSessionTemplate.insert(namespace +".InsertLog", membership_LogBean);
		return chk;
	}
	
	public List<Membership_LogBean> GetLogByNum(int unum){
		List<Membership_LogBean> membershipLogList = null;
		membershipLogList = sqlSessionTemplate.selectList(namespace + ".GetLogByNum", unum);
		return membershipLogList;
	}
	
}
