package team_movie.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyMovieDao")
public class MovieDao {
	private final String namespace = "team_movie.model.MovieBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MovieDao() {

	}

	public List<MovieBean> GetMovieList() {
		List<MovieBean> movies = new ArrayList<MovieBean>();
		movies = sqlSessionTemplate.selectList(namespace + ".GetMovieList");
		return movies;
	}

	public List<MovieBean> GetMovieListByGenre(String genre) {
		List<MovieBean> movieByGenre = new ArrayList<MovieBean>();
		movieByGenre = sqlSessionTemplate.selectList(namespace + ".GetMovieListByGenre", genre);
		return movieByGenre;
	}

	public int GetTotalCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount");
		return cnt;
	}

	public MovieBean GetMovieByNum(int mnum) {
		MovieBean movie = new MovieBean();
		movie = sqlSessionTemplate.selectOne(namespace + ".GetMovieByNum", mnum);
		return movie;
	}

	public int MovieLikeUpdate(int mnum) {
		int cnt = sqlSessionTemplate.update(namespace + ".MovieLikeUpdate", mnum);
		return cnt;
	}

	public int MovieUnLikeUpdate(int mnum) {
		int cnt = sqlSessionTemplate.update(namespace + ".MovieUnLikeUpdate", mnum);
		return cnt;
	}

	public int AddMovie(MovieBean movieBean) {
		int getnum = 0;

		// DB�궫�엯
		sqlSessionTemplate.insert(namespace + ".AddMovie", movieBean);

		// num �쉷�뱷
		getnum = sqlSessionTemplate.selectOne(namespace + ".GetLasttMovie_seq");

		return getnum;
	}

	public MovieBean GetFavoriteCon(int fmnum) {
		System.out.println("DAO fmnum : "+fmnum);
		MovieBean mBean = new MovieBean();
		mBean = sqlSessionTemplate.selectOne(namespace+".GetFavoriteCon",fmnum);
		
		return mBean;
	}
	
	public void UpdateContents(MovieBean movieBean){
		int chk = -1;
		
		chk = sqlSessionTemplate.update(namespace + ".UpdateContents", movieBean);
		
		if(chk > 0){
			System.out.println("update clear");
		}else{
			System.out.println("update fail");
		}
	}
	
	public void DeleteContents(int mnum){
		int chk = -1;
		chk = sqlSessionTemplate.delete(namespace + ".DeleteContents", mnum);
		
		if(chk > 0){
			System.out.println("delete clear");
		}else{
			System.out.println("delete fail");
		}
	}

	public List<MovieBean> GetMemberMovieList(int mwcon) {
		
		List<MovieBean> memMovie = sqlSessionTemplate.selectList(namespace+".GetMemberMovieList",mwcon);
		return memMovie;
	}

	public List<MovieBean> GetGenreMemberMovieList(String gname) {
		List<MovieBean> memGenreMovie = sqlSessionTemplate.selectList(namespace+".GetGenreMemberMovieList",gname);

		return memGenreMovie;
	}

	public List<MovieBean> GetFreeMovie() {
		List<MovieBean> freeMovie = sqlSessionTemplate.selectList(namespace+".GetFreeMovie");
		
		return freeMovie;
	}

	public int GetFreeCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetFreeCount");
		return cnt;
	}

	public int GetMemCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetMemCount");
		return cnt;
	}

	
}
