package team_movie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myLatestviewDao")
public class LatestviewDao { 

	public static final String namespace="team_movie.model.LatestviewBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	 

	public void InsertViewChart(int vmnum, int vunum) {
		
		LatestviewBean bean = new LatestviewBean(0,0,vmnum,vunum);
		
		sqlSessionTemplate.update(namespace+".InsertViewChart",bean);
		
	}



	public List<LatestviewBean> ViewContentList(int vmnum , int vunum) {
		
		System.out.println("중복되는데이찾기 다오");
		LatestviewBean bean = new LatestviewBean(0,0,vmnum,vunum);
		
		List<LatestviewBean> list=sqlSessionTemplate.selectList(namespace+".ViewContentList" , bean);
		System.out.println("중복되는데이찾기 다오 완료");

		return list;
	}



	public void ViewContentRefresh(int vunum) {
		
		int cnt = sqlSessionTemplate.delete(namespace + ".ViewContentRefresh",vunum);
	}

}
  