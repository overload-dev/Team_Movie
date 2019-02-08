package team_movie.model;

import java.sql.Timestamp;

public class MovieBean {
	private int mnum;
	private String mname;
	private String mgenre;
	private String mdir;
	private String mpro;
	private String mactor;
	private String msup;
	private int mage;
	private int mele;
	private Timestamp mrdate;
	private Timestamp midate;
	private int mrcount;
	private String murl;
	private String mrepo;
	private int mwcon;

	public MovieBean() {

	}

	public MovieBean(int mnum, String mname, String mgenre, String mdir, String mpro, String mactor, String msup,
			int mage, int mele, Timestamp mrdate, Timestamp midate, int mrcount, String murl, String mrepo, int mwcon) {
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

	public int getMele() {
		return mele;
	}

	public void setMele(int mele) {
		this.mele = mele;
	}

	public Timestamp getMrdate() {
		return mrdate;
	}

	public void setMrdate(Timestamp mrdate) {
		this.mrdate = mrdate;
	}

	public Timestamp getMidate() {
		return midate;
	}

	public void setMidate(Timestamp midate) {
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

}
