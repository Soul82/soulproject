package Streaming.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import Streaming.pojo.MP3reposit;

@Component
public class streamingServ {
	@Autowired
	SqlSessionFactory fac;
	
	@Autowired
	s3upload s3;
	@Autowired
	jAudioServ ja;
	public boolean insertmp3(MultipartFile f,String artist,String title,String mv){
		try{
			String oriname=artist+"-"+title+".mp3";
			s3.uploadmp3(f, oriname);
			String url="https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/"+oriname;
			
			MP3reposit mp3up=new MP3reposit();
				mp3up.setArtist(artist);
				mp3up.setTitle(title);
				mp3up.setMv(mv);
				mp3up.setUrl(url);
				mp3up.setOriname(oriname);
			
			SqlSession ss=fac.openSession();
			ss.insert("mp3.insertmp3",mp3up);
			ss.close();
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public List ListMp3(){
		SqlSession ss=fac.openSession();
		List li=ss.selectList("mp3.reglist");
		ss.close();
		return li;
	}
	
	public void songinfo(String artistp,String titlep){
		SqlSession ss=fac.openSession();
		HashMap map=ja.jTagger(artistp, titlep);
		System.out.println(map.get("title"));
		
		ss.close();
		
	}
	
	
	
}
