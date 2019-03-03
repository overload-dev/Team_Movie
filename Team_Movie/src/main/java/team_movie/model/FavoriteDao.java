package team_movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyFavorite")
public class FavoriteDao {
	public static final String namespace="team_movie.model.FavoriteBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int MovieLikeInsert(FavoriteBean favor) {
		int cnt = sqlSessionTemplate.insert(namespace + ".MovieLikeInsert", favor);
			
		return cnt;
	}
	
	public int MovieLikeDelete(FavoriteBean favor) {
		int cnt = sqlSessionTemplate.insert(namespace + ".MovieLikeDelete", favor);
		return cnt;
	}
	
	public int MovieBookmarkInsert(FavoriteBean favor) {
		int cnt = sqlSessionTemplate.insert(namespace + ".MovieBookmarkInsert", favor);
		return cnt;
	}
	
	public int MovieBookmarkDelete(FavoriteBean favor) {
		int cnt = sqlSessionTemplate.insert(namespace + ".MovieBookmarkDelete", favor);
		return cnt;
	}
	
	public int GetLikeCount(FavoriteBean favor) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetLikeCount", favor);
		return count;
	}
	
	public int GetBookmarkCount(FavoriteBean favor) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetBookmarkCount", favor);
		return count;
	}
	//회원이선택한 즐겨찾기전부를 가져오는 메서드
	public List<FavoriteBean> GetFavofiteAllData(Integer unum) {
		List<FavoriteBean> Lists = new ArrayList<FavoriteBean>();
		
		Lists = sqlSessionTemplate.selectList(namespace+".GetFavofiteAllData",unum);
		return Lists;
	}
}
