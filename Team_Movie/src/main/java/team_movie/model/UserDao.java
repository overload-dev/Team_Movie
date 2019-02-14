package team_movie.model;

import java.util.List;
import java.security.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myUserDao")
public class UserDao {
	public static final String namespace="team_movie.model.UserBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	//회원가입
	public int userInsert(UserBean userBean) {
		
		int cnt = sqlSessionTemplate.insert(namespace+".userInsert",userBean);
		return cnt;
	}

	//로그인정보 가져오기 세션
	public UserBean GetData(String usid) {
		UserBean login = null;
		System.out.println("로그인 id정보");
		login = sqlSessionTemplate.selectOne(namespace +".GetData",usid);
		return login;
	}
	
	//ID찾기
	public UserBean GetIdData(UserBean userBean) {
		UserBean findId=null; 
		System.out.println("ID 찾기");
		findId = sqlSessionTemplate.selectOne(namespace+".GetIdData",userBean);
		return findId;
	}

	public UserBean GetPwData(UserBean userBean) {
		UserBean findPw=null; 
		System.out.println("PW 찾기");
		findPw = sqlSessionTemplate.selectOne(namespace+".GetPwData",userBean);
		
		return findPw;
	}
}
