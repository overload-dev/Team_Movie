package team_movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myLatestviewDao")
public class LatestviewDao { 

	public static final String namespace="team_movie.model.LatestviewBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<LatestviewBean>  GetLatestView(int vunum) {
		System.out.println("vunum :"+vunum);
		
		List<LatestviewBean> viewList=new ArrayList<LatestviewBean>();
		
		viewList =sqlSessionTemplate.selectList(namespace+".GetLatestView",vunum);
		
		System.out.println("시청한 목록 갯수:" + viewList.size());
		
		return viewList;
	}




	public void InsertViewChart(int vmnum, int vunum) {
		
		LatestviewBean bean = new LatestviewBean(0,0,vmnum,vunum);
		
		sqlSessionTemplate.update(namespace+".InsertViewChart",bean);
		
		
	}

	

	public List<LatestviewBean> GetLatestViewMovieNum(int vmnum,int vunum) {
		
		List<LatestviewBean> viewList =null; 
		
		LatestviewBean bean = new LatestviewBean(0,0,vmnum,vunum);
		
		viewList =sqlSessionTemplate.selectList(namespace+".GetLatestViewMovieNum",bean);
		
		return viewList;
	}







	
}
 