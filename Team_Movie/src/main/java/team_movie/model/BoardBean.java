package team_movie.model;

import java.sql.Timestamp;

public class BoardBean {
	
	private int bnum; //���� ��ȣ
	private int btype; // �Խñ� Ÿ�� 0: ����, 1: ���
	private int bmnum; // �� ��ȭ ���� ��ȣ
	private int bunum; // �ۼ��� ���� ��ȣ
	private String bsubject; // ���� ���� (btype�� 0�϶��� ���)
	private String bcon; // ���(����) ���� (������ null�� ���, '�Խñ� ����~' ���
	private int bref;
	private int brestep;
	private int brelevel;
	private Timestamp bdate;
	
	public BoardBean(){
		
	}
	
	public BoardBean(int bnum, int btype, int bmnum, int bunum, String bsubject, String bcon, int bref, int brestep,
			int brelevel, Timestamp bdate) {
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
	public Timestamp getBdate() {
		return bdate;
	}
	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	
	
	
	
	
	
	
}
