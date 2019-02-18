package team_movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMembership")
public class MembershipDao {
	
	public static final String namespace="team_movie.model.MembershipBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MembershipBean>GetMemberShipList(){
		System.out.println("GetMemberShipList");
		List<MembershipBean> membershipList = new ArrayList<MembershipBean>();
		membershipList = sqlSessionTemplate.selectList(namespace + ".GetMembershipList");
		return membershipList;
		
	}
	
}
