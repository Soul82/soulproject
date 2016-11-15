package Board.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import Board.pojo.qnaVO;

@Component
public class qnaServ {

	@Autowired
	SqlSessionFactory fac;
	
	public int writeMemo(qnaVO qna){
		SqlSession ss=fac.openSession();
		int r=0;
		r=ss.insert("files.insertReview",qna);
		ss.close();
		return r;
	}
}
