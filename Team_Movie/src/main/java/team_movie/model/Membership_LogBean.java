package team_movie.model;

import java.sql.Date;

public class Membership_LogBean {
	private int mlnum; // 고유 번호
	private int mlunum; // 유저 번호
	private String mlmbsname; // 멤버십 이름
	private int mlmbsprice; // 멤버십 가격
	private int mlmbsperiod; // 멤버십 일자
	private Date mlupstart; // 멤버십 시작일
	private Date mlupend; // 멤버십 종료일

	public Membership_LogBean() {

	}

	public Membership_LogBean(int mlnum, int mlunum, String mlmbsname, int mlmbsprice, int mlmbsperiod, Date mlupstart,
			Date mlupend) {
		super();
		this.mlnum = mlnum;
		this.mlunum = mlunum;
		this.mlmbsname = mlmbsname;
		this.mlmbsprice = mlmbsprice;
		this.mlmbsperiod = mlmbsperiod;
		this.mlupstart = mlupstart;
		this.mlupend = mlupend;
	}

	public int getMlnum() {
		return mlnum;
	}

	public void setMlnum(int mlnum) {
		this.mlnum = mlnum;
	}

	public int getMlunum() {
		return mlunum;
	}

	public void setMlunum(int mlunum) {
		this.mlunum = mlunum;
	}

	public String getMlmbsname() {
		return mlmbsname;
	}

	public void setMlmbsname(String mlmbsname) {
		this.mlmbsname = mlmbsname;
	}

	public int getMlmbsprice() {
		return mlmbsprice;
	}

	public void setMlmbsprice(int mlmbsprice) {
		this.mlmbsprice = mlmbsprice;
	}

	public int getMlmbsperiod() {
		return mlmbsperiod;
	}

	public void setMlmbsperiod(int mlmbsperiod) {
		this.mlmbsperiod = mlmbsperiod;
	}

	public Date getMlupstart() {
		return mlupstart;
	}

	public void setMlupstart(Date mlupstart) {
		this.mlupstart = mlupstart;
	}

	public Date getMlupend() {
		return mlupend;
	}

	public void setMlupend(Date mlupend) {
		this.mlupend = mlupend;
	}
}
