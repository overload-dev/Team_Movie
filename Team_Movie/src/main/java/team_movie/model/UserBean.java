package team_movie.model;

import java.sql.Timestamp;

public class UserBean { 

	private int unum; // 고유번호
	private String usid; // 회원 아이디
	private String uname; // 회원 닉네임
	private String upw; // 회원 비밀번호
	private Timestamp udate; // 가입일
	private Timestamp ubirth; // 생년 월일
	private String ugrade; // 회원 등급 0: 관리자 / 1: 일반 회원 /2:스페셜
	private Timestamp uupstart; // 스페셜이 아닌경우 null
	private Timestamp uupend; // 스페셜이 아닌경우 null
	private String ugenre;// 유저 선호 장르
	
	public UserBean() {

	}

	public UserBean(int unum, String usid, String uname, String upw, Timestamp udate, Timestamp ubirth, String ugrade,
			Timestamp uupstart, Timestamp uupend, String ugenre) {
		super();
		this.unum = unum;
		this.usid = usid;
		this.uname = uname;
		this.upw = upw;
		this.udate = udate;
		this.ubirth = ubirth;
		this.ugrade = ugrade;
		this.uupstart = uupstart;
		this.uupend = uupend;
		this.ugenre = ugenre;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public Timestamp getUdate() {
		return udate;
	}

	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}

	public Timestamp getUbirth() {
		return ubirth;
	}

	public void setUbirth(Timestamp ubirth) {
		this.ubirth = ubirth;
	}

	public String getUgrade() {
		return ugrade;
	}

	public void setUgrade(String ugrade) {
		this.ugrade = ugrade;
	}

	public Timestamp getUupstart() {
		return uupstart;
	}

	public void setUupstart(Timestamp uupstart) {
		this.uupstart = uupstart;
	}

	public Timestamp getUupend() {
		return uupend;
	}

	public void setUupend(Timestamp uupend) {
		this.uupend = uupend;
	}

	public String getUgenre() {
		return ugenre;
	}

	public void setUgenre(String ugenre) {
		this.ugenre = ugenre;
	}

}
