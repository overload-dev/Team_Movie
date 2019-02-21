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
}
