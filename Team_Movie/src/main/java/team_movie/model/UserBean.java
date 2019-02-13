package team_movie.model;

import java.sql.Timestamp;

public class UserBean { 

	private int unum; // ������ȣ
	private String usid; // ȸ�� ���̵�
	private String uname; // ȸ�� �г���
	private String upw; // ȸ�� ��й�ȣ
	private Timestamp udate; // ������
	private Timestamp ubirth; // ���� ����
	private String ugrade; // ȸ�� ��� 0: ������ / 1: �Ϲ� ȸ�� /2:�����
	private Timestamp uupstart; // ������� �ƴѰ�� null
	private Timestamp uupend; // ������� �ƴѰ�� null
	private String ugenre;// ���� ��ȣ �帣
	
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
