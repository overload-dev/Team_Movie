package team_movie.model;

public class FavoritBean {
	private int fnum; //고유번호
	private int funum; // 회원 고유번호
	private int fmnum; // 즐겨찾기 대상 영화 고유 번호 (TMOVIE 테이블 고유 번호)	
	
	public FavoritBean(){
		
	}
	
	public FavoritBean(int fnum, int funum, int fmnum) {
		super();
		this.fnum = fnum;
		this.funum = funum;
		this.fmnum = fmnum;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public int getFunum() {
		return funum;
	}
	public void setFunum(int funum) {
		this.funum = funum;
	}
	public int getFmnum() {
		return fmnum;
	}
	public void setFmnum(int fmnum) {
		this.fmnum = fmnum;
	}
	
	
	
}
