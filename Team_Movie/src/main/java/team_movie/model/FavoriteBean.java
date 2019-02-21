package team_movie.model;

public class FavoriteBean {
	private int fnum; //고유번호
	private int funum; // 회원 고유번호
	private int fmnum; // 즐겨찾기 대상 영화 고유 번호 (TMOVIE 테이블 고유 번호)	
	private int ftype; // 좋아요 0 / 즐겨찾기 1 여부
	
	public FavoriteBean(){
		
	}
	
	public FavoriteBean(int fnum, int funum, int fmnum, int ftype) {
		super();
		this.fnum = fnum;
		this.funum = funum;
		this.fmnum = fmnum;
		this.ftype = ftype;
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
	public int getFtype() {
		return ftype;
	}
	public void setFtype(int ftype) {
		this.ftype = ftype;
	}
	
	
	
}
