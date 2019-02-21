package team_movie.model;

import java.sql.Date;

public class MovieBean {
	private int mnum; // 고유 번호, 게시글테이블의 그룹 넘버로 활용
	private String mname; // 영화 이름
	private String mgenre; // 영화 장르
	private String mdir; // 감독
	private String mpro; // 연출
	private String mactor; // 주연
	private String msup; // 조연
	private int mage; // 관람 연령 , 0: 전체 이용 / 1: 12세 이용가 / 2: 15세 이용가 / 3: 18세 이용가
	private String mele; // 영화 요소 0: 없음 / 1: 폭력성 / 2: 선정성 / 3: 약물 / 4: 공포 / 5:
							// 범죄 / 6: 사행성 / 7: 언어의 부적절성

	private Date mrdate; // 영화 개봉일
	private Date midate; // 업로드 일
	private int mrcount; // 조회수
	private String murl; // 영상 링크
	private String mrepo; // 영상 저장소 링크
	private int mwcon; // 관람 회원 등급
	private String mimg; // 섬네일 이미지
	private String msynop; // 시놉시스
	private String mruntime; //러닝타임
	
	public MovieBean() {

	}

	

	public MovieBean(int mnum, String mname, String mgenre, String mdir, String mpro, String mactor, String msup,
			int mage, String mele, Date mrdate, Date midate, int mrcount, String murl, String mrepo,
			int mwcon, String mimg, String msynop, String mruntime) {
		super();
		this.mnum = mnum;
		this.mname = mname;
		this.mgenre = mgenre;
		this.mdir = mdir;
		this.mpro = mpro;
		this.mactor = mactor;
		this.msup = msup;
		this.mage = mage;
		this.mele = mele;
		this.mrdate = mrdate;
		this.midate = midate;
		this.mrcount = mrcount;
		this.murl = murl;
		this.mrepo = mrepo;
		this.mwcon = mwcon;
		this.mimg = mimg;
		this.msynop = msynop;
		this.mruntime = mruntime;
	}



	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMgenre() {
		return mgenre;
	}

	public void setMgenre(String mgenre) {
		this.mgenre = mgenre;
	}

	public String getMdir() {
		return mdir;
	}

	public void setMdir(String mdir) {
		this.mdir = mdir;
	}

	public String getMpro() {
		return mpro;
	}

	public void setMpro(String mpro) {
		this.mpro = mpro;
	}

	public String getMactor() {
		return mactor;
	}

	public void setMactor(String mactor) {
		this.mactor = mactor;
	}

	public String getMsup() {
		return msup;
	}

	public void setMsup(String msup) {
		this.msup = msup;
	}

	public int getMage() {
		return mage;
	}

	public void setMage(int mage) {
		this.mage = mage;
	}

	public String getMele() {
		return mele;
	}

	public void setMele(String mele) {
		this.mele = mele;
	}

	public Date getMrdate() {
		return mrdate;
	}

	public void setMrdate(Date mrdate) {
		this.mrdate = mrdate;
	}

	public Date getMidate() {
		return midate;
	}

	public void setMidate(Date midate) {
		this.midate = midate;
	}

	public int getMrcount() {
		return mrcount;
	}

	public void setMrcount(int mrcount) {
		this.mrcount = mrcount;
	}

	public String getMurl() {
		return murl;
	}

	public void setMurl(String murl) {
		this.murl = murl;
	}

	public String getMrepo() {
		return mrepo;
	}

	public void setMrepo(String mrepo) {
		this.mrepo = mrepo;
	}

	public int getMwcon() {
		return mwcon;
	}

	public void setMwcon(int mwcon) {
		this.mwcon = mwcon;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public String getMsynop() {
		return msynop;
	}

	public void setMsynop(String msynop) {
		this.msynop = msynop;
	}



	public String getMruntime() {
		return mruntime;
	}



	public void setMruntime(String mruntime) {
		this.mruntime = mruntime;
	}

	
	
}
