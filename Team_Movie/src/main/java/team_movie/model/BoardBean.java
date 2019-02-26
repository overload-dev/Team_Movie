package team_movie.model;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardBean {
	
	private String busid; // user ¿Í joinÀ» ÇÏ±âÀ§ÇÑ user id
	private String buname; // user ¿Í joinÀ» ÇÏ±âÀ§ÇÑ user name
	private int bnum; //ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£
	private int btype; // ï¿½Ô½Ã±ï¿½ Å¸ï¿½ï¿½ 0: ï¿½ï¿½ï¿½ï¿½, 1: ï¿½ï¿½ï¿?
	private int bmnum; // ï¿½ï¿½ ï¿½ï¿½È­ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£
	private int bunum; // ï¿½Û¼ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£
	private String bsubject; // ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ (btypeï¿½ï¿½ 0ï¿½Ï¶ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿?)
	private String bcon; // ï¿½ï¿½ï¿?(ï¿½ï¿½ï¿½ï¿½) ï¿½ï¿½ï¿½ï¿½ (ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ nullï¿½ï¿½ ï¿½ï¿½ï¿?, 'ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ï¿½ï¿½~' ï¿½ï¿½ï¿?
	private int bref;
	private int brestep;
	private int brelevel;
	private Date bdate;
	
	public BoardBean(){
		
	}
	
	public String getBusid() {
		return busid;
	}

	public void setBusid(String busid) {
		this.busid = busid;
	}

	public String getBuname() {
		return buname;
	}

	public void setBuname(String buname) {
		this.buname = buname;
	}

	public BoardBean(int bnum, int btype, int bmnum, int bunum, String bsubject, String bcon, int bref, int brestep,
			int brelevel, Date bdate) {
		super();
		this.bnum = bnum;
		this.btype = btype;
		this.bmnum = bmnum;
		this.bunum = bunum;
		this.bsubject = bsubject;
		this.bcon = bcon;
		this.bref = bref;
		this.brestep = brestep;
		this.brelevel = brelevel;
		this.bdate = bdate;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getBmnum() {
		return bmnum;
	}
	public void setBmnum(int bmnum) {
		this.bmnum = bmnum;
	}
	public int getBunum() {
		return bunum;
	}
	public void setBunum(int bunum) {
		this.bunum = bunum;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcon() {
		return bcon;
	}
	public void setBcon(String bcon) {
		this.bcon = bcon;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBrestep() {
		return brestep;
	}
	public void setBrestep(int brestep) {
		this.brestep = brestep;
	}
	public int getBrelevel() {
		return brelevel;
	}
	public void setBrelevel(int brelevel) {
		this.brelevel = brelevel;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	
	
	
	
	
	
	
}
