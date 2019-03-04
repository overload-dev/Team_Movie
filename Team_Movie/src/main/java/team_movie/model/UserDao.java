package team_movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component("myUserDao")
@Repository
public class UserDao {
	public static final String namespace="team_movie.model.UserBean";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//ȸ������
	public int userInsert(UserBean userBean) {
		
		int cnt = sqlSessionTemplate.insert(namespace+".userInsert",userBean);
		return cnt;
	}

	//�α������� �������� ����
	public UserBean GetData(String usid) {
		UserBean login = null;
		System.out.println("�α��� id����");
		login = sqlSessionTemplate.selectOne(namespace +".GetData",usid);
		return login;
	}
	
	//IDã��
	public UserBean GetIdData(UserBean userBean) {
		UserBean findId=null; 
		System.out.println("ID ã��");
		findId = sqlSessionTemplate.selectOne(namespace+".GetIdData",userBean);
		return findId;
	}
	
	public UserBean GetPwData(UserBean userBean) {
		UserBean findPw=null; 
		System.out.println("PW ã��");
		findPw = sqlSessionTemplate.selectOne(namespace+".GetPwData",userBean);
		
		return findPw;
	}
	
	public List<UserBean> GetAllUserList(){
		sqlSessionTemplate.getClass();
		System.out.println("GetAllUserList");
		List<UserBean> userList = new ArrayList<UserBean>();
		userList = sqlSessionTemplate.selectList(namespace + ".GetAllUserData");

		return userList;
	}
	
	public int DelUser(int unum){
		System.out.println("DelUser");
		int num = 0;
		num =  sqlSessionTemplate.delete(namespace + ".DelUser",unum);
		return num;
	}

	public int UserUpdate(UserBean userBean) {
		int cnt =-1;
		
		cnt = sqlSessionTemplate.update(namespace+".UserUpdate",userBean);
		return cnt;
	}

	public int UpdateMembership(UserBean userBean) {
		int cnt = -1;
		System.out.println("userBean.getUsid(): "+userBean.getUsid());
		System.out.println("userBean.getUsid(): "+userBean.getUupend());
		System.out.println("userBean.getUsid(): "+userBean.getUupstart());
		System.out.println("userBean.getUsid(): "+userBean.getUgrade());
		cnt =sqlSessionTemplate.update(namespace+".UpdateMembership",userBean);
		return cnt;
	}
	
	public UserBean GetUserById(String usid) {
		UserBean user = new UserBean();
		user = sqlSessionTemplate.selectOne(namespace + ".GetUserById", usid);
		return user;
	}

	//�ߺ�üũ
	public boolean SearchID(String usid) {
		boolean flag =false;
		int cnt = -1;
		List<UserBean> array  =new ArrayList<UserBean>();
		
		array= sqlSessionTemplate.selectList(namespace+".SearchID",usid);
		System.out.println("array.size():"+array.size());
		if(array.size()==0 && usid!=null){
			flag =true;//���̵��������
			System.out.println("flag="+flag);
		
		}else{
			
			flag=false;//���̵��ߺ�
			System.out.println("flag="+flag);
		}
		return flag;
	}
	
	//맴버십 자동 갱신(스캐쥴러에 의해 실행되는 기능으로 타 기능에서 사용을 제한함)
	public int RefreshMembershipForUser(UserBean userBean){
		int chk = -1;
		chk = sqlSessionTemplate.update(namespace + ".RefreshMembershipForUser", userBean);
		return chk;
	}
	
	public UserBean GetMyInfo(int unum){
		UserBean myInfo = null;
		myInfo = sqlSessionTemplate.selectOne(namespace + ".GetMyInfo", unum);
		return myInfo;
	}
	
	//이미 스페셜인 유저가 스페셜을 추가 구매했을 경우
	public int UpdateMembershipForAlreadySpecial(UserBean userBean){
		int chk = - 1;
		chk = sqlSessionTemplate.update(namespace+".UpdateMembershipForAlreadySpecial", userBean);
		
		return chk;
	}
	//처음 스페셜 구매인경우
	public int UpdateMembershipForFirst(UserBean userBean){
		int chk = -1;
		chk = sqlSessionTemplate.update(namespace +".UpdateMembershipForFirst", userBean);
		return chk;
	}
	
	
	
	
	
	
}
 