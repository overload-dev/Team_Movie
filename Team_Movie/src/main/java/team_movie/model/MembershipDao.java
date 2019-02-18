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
	
	//membership List
	public List<MembershipBean>GetMemberShipList(){
		System.out.println("GetMemberShipList");
		List<MembershipBean> membershipList = new ArrayList<MembershipBean>();
		membershipList = sqlSessionTemplate.selectList(namespace + ".GetMembershipList");
		return membershipList;
		
	}
	
	//membership Update
	public int UpdateMembership(MembershipBean membershipBean){
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateMembership",membershipBean);
		return cnt;
	}
	
	//membership Delete
	public int DeleteMembership(int mbsnum){
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteMembership", mbsnum);
		return cnt;
	}
	
	//membership Add
	public int AddMemebership(MembershipBean membershipBean){
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".AddMemebership", membershipBean);
		return cnt;
	}
}
