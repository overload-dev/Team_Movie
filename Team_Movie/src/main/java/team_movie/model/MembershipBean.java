package team_movie.model;

public class MembershipBean {
	private int mbsnum;
	private String mbsname;
	private int mbsperiod;
	private int mbsprice;
	
	public MembershipBean() {

	}

	public MembershipBean(int mbsnum, String mbsname, int mbsperiod, int mbsprice) {
		super();
		this.mbsnum = mbsnum;
		this.mbsname = mbsname;
		this.mbsperiod = mbsperiod;
		this.mbsprice = mbsprice;
	}

	public int getMbsnum() {
		return mbsnum;
	}

	public void setMbsnum(int mbsnum) {
		this.mbsnum = mbsnum;
	}

	public String getMbsname() {
		return mbsname;
	}

	public void setMbsname(String mbsname) {
		this.mbsname = mbsname;
	}

	public int getMbsperiod() {
		return mbsperiod;
	}

	public void setMbsperiod(int mbsperiod) {
		this.mbsperiod = mbsperiod;
	}

	public int getMbsprice() {
		return mbsprice;
	}

	public void setMbsprice(int mbsprice) {
		this.mbsprice = mbsprice;
	}

}
