package Streaming.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AlbumSer {
	@Autowired
	SqlSessionFactory fac;
	public HashMap songinfo(int num){
		HashMap map= new HashMap();
		
		 return map;
	}
}
