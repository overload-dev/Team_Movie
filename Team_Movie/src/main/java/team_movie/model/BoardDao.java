package team_movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myBoard")
public class BoardDao {
	public static final String namespace="team_movie.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int InsertComment(BoardBean board) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertComment", board);
		return cnt;
	}
	
	public List<BoardBean> getCommentListByMnum(int mnum) {
		List<BoardBean> commentList = new ArrayList<BoardBean>();
		commentList = sqlSessionTemplate.selectList(namespace + ".getCommentListByMnum", mnum);
		return commentList;
				
	}
	
	public BoardBean getCommentBynum(int bnum) {
		BoardBean board = new BoardBean();
		board = sqlSessionTemplate.selectOne(namespace + ".getCommentBynum", bnum);
		return board;
	}
	
	public int UpdateComment(BoardBean board) {
		int cnt = sqlSessionTemplate.update(namespace + ".UpdateComment", board);
		return cnt;
	}
	
	public int DeleteComment(int bnum) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteComment", bnum);
		return cnt;
	}
	
	public int UpdateReplyComment(BoardBean board) {
		int cnt = sqlSessionTemplate.update(namespace + ".UpdateReplyComment", board);
		return cnt;
	}
	
	public int InsertReplyComment(BoardBean board) {
		int cnt = sqlSessionTemplate.update(namespace + ".InsertReplyComment", board);
		return cnt;
	}
	
	public List<BoardBean> GetAllNoticeList(){
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		boardList = sqlSessionTemplate.selectList(namespace + ".GetAllNoticeList");
		return boardList;
	}
	
	public int AddNotice(BoardBean boardBean){
		int chk = -1;
		chk = sqlSessionTemplate.insert(namespace + ".AddNotice", boardBean);
		return chk;
	}	
	
	public BoardBean GetNoticeByNum(int bnum){
		BoardBean boardBean = new BoardBean();
		boardBean = sqlSessionTemplate.selectOne(namespace +".GetNoticeByNum", bnum);
		return boardBean;
	}
	
	public int UpdateNotice(BoardBean boardBean){
		int chk = -1;
		chk = sqlSessionTemplate.update(namespace + ".UpdateNotice", boardBean);
		return chk;
	}

	
	
	
	public int DeleteFirstComment(int mnum) {
		int cnt = sqlSessionTemplate.update(namespace + ".DeleteFirstComment", mnum);
		return cnt;
	}
	
	public int totalCommentByNum(int mnum) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".totalCommentByNum", mnum);
		return cnt;
	}
	
	
	
	public int DeleteNotice(int bnum){
		int chk = -1;
		chk = sqlSessionTemplate.delete(namespace +".DeleteNotice", bnum);
		return chk;
	}
	
	public List<BoardBean> GetNoticeForMain(){
		List<BoardBean> noticeMainList = null;
		noticeMainList = sqlSessionTemplate.selectList(namespace + ".GetNoticeForMain");
		return noticeMainList; 
	}
}
