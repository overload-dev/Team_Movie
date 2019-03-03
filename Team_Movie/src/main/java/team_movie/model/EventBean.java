package team_movie.model;

public class EventBean {
	private int eenum;
	private int emnum;
	private String eimg;
	private String emname; //no use on table
	
	
	public EventBean(){
		
	}
	public EventBean(int eenum, int emnum, String eimg, String emname) {
		
		super();
		this.eenum = eenum;
		this.emnum = emnum;
		this.eimg = eimg;
		this.emname = emname;
		
	}
	public int getEenum() {
		return eenum;
	}
	public void setEenum(int eenum) {
		this.eenum = eenum;
	}
	public int getEmnum() {
		return emnum;
	}
	public void setEmnum(int emnum) {
		this.emnum = emnum;
	}
	public String getEimg() {
		return eimg;
	}
	public void setEimg(String eimg) {
		this.eimg = eimg;
	}
	
	
	public String getEmname() {
		return emname;
	}
	public void setEmname(String emname) {
		this.emname = emname;
	}
	
	
	
	
}
