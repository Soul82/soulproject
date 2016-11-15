package Board.model;

import java.util.List;

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
	
	public int regMemo(String cate, String content, String title){
		SqlSession ss=fac.openSession();
		int r=0;
		qnaVO qvo=new qnaVO();
			qvo.setCate(cate);
			qvo.setContent(content);
			qvo.setTitle(title);
		r=ss.insert("qnaboard.insertMemo",qvo);
		ss.close();
		return r;
	}
	
	public List allView(){
		SqlSession ss=fac.openSession();
		List li=ss.selectList("qnaboard.getList");
		ss.close();
		return li;
		
	}
	
	public qnaVO hitQna(int num){
		SqlSession ss=fac.openSession();
		int rst=0;
		rst+=ss.update("qnaboard.count",num);
		if(rst==0){
			return null;
		}else{
			qnaVO li=ss.selectOne("qnaboard.getList",num);
			ss.close();
			return li;
		}
	}
}
