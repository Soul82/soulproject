package scrap.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;

import net.htmlparser.jericho.Source;

@Component
public class scrapServ {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean create(String albumName, String title, String userId){
		
		System.out.println("##" + userId + " / " + albumName + " / " + title);
		
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
			map.put("id", userId);
			map.put("album", albumName);
			map.put("title", title);
		
		int r = sql.insert("mp3.insertalbum", map);
		sql.close();
		if(r>0){
			// System.out.println("¼º°ø");
			return true;
		}else{
			return false;
		}
	}	
}
