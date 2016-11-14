package Member.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import Member.pojo.Member;

@Component
public class joinServ {
	@Autowired
	SqlSessionFactory fac;
	
	public int joinVO(Member m){
		SqlSession ss = fac.openSession();
		int r=0;
		try{
			r+=ss.insert("member.join",m);	
			if(r==1){
				ss.commit();
			}else{
				ss.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			System.out.println("Exception error¹ß»ý!!");
		}finally{
			ss.close();
		}
		return r;
	}
}
