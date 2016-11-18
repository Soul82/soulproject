package Chart.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;

import net.htmlparser.jericho.Source;

@Component
public class scrapServ {
	
	
	public HashMap testing() throws MalformedURLException, IOException, RestClientException, URISyntaxException {
		HashMap map=new HashMap<>();
		// 링크연결
		String url = "http://music.bugs.co.kr/chart?wl_ref=m_left_02_01";
		
		// 해당 URL 페이지를 가져온다.
		Source source = new Source(new URL(url));
		source.getAllTags();
		
		// System.out.println(source+"\"");
		// 메소드 찾기를 위해 시작부터 끝까지 태그들만 parse 한다 (?)
		source.fullSequentialParse();
		// ";\"track_title=\""
		
		String sour = source.toString();
		String []splitTitle=sour.split("name=\"check\" disc_id=\"1\" title=\"");
		String []title=null;
		
		String []splitArtist=sour.split("\" artist_disp_nm=\"");
		String []artist=null;
		
		String []splitAlbum=sour.split("\"http://image.bugsm.co.kr/album/images/");
		String []album=null;
		for(int i=1;i<101;i++){
			title=splitTitle[i].split("\"");
			artist=splitArtist[i].split("\"");
			album=splitAlbum[i].split("\"");
//			System.out.println(title[0]+" - "+artist[0]);
//			System.out.println("http://image.bugsm.co.kr/album/images/"+album[0]);
			map.put("title", title);
			map.put("artist", artist);
			map.put("album", album);
		}
		return map;
	}
}
