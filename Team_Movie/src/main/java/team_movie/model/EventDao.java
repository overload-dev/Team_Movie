package team_movie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myEventDao")
public class EventDao {

	public static final String namespace = "team_movie.model.EventBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<EventBean> GetEventList() {
		List<EventBean> eventList = null;
		eventList = sqlSessionTemplate.selectList(namespace + ".GetEventList");
		return eventList;
	}

	public int AddEvent(EventBean eventBean) {
		int ckh = -1;
		ckh = sqlSessionTemplate.insert(namespace + ".AddEvent", eventBean);
		return ckh;
	}

	public EventBean GetEventByNum(int eenum) {
		EventBean eventBean = null;
		eventBean = sqlSessionTemplate.selectOne(namespace + ".GetEventByNum", eenum);
		return eventBean;
	}

	public int UpdateEvent(EventBean eventBean) {
		int chk = -1;
		chk = sqlSessionTemplate.update(namespace + ".UpdateEvent", eventBean);
		return chk;
	}

	public int DeleteEvent(int eenum) {
		int chk = -1;
		chk = sqlSessionTemplate.delete(namespace + ".DeleteEvent",eenum);
		return chk;
	}
}
