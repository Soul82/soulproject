package Chart.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;

import net.htmlparser.jericho.Source;

@Component
public class scrapServ {
	public void testing() throws MalformedURLException, IOException, RestClientException, URISyntaxException {

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
//		System.out.println(sour);
		
		String [] ar;
		ar=sour.split("value=\"30448832\" name=\"check\" disc_id=\"1\" title=\"");
		String []ao=ar[1].split("\"");
//		System.out.println(ar[0]);
		
		//=====테스트하기======
//		String ae="<td class=\"check\"><input type=\"checkbox\" value=\"30448832\" name=\"check\" disc_id=\"1\" title=\"가끔 (feat. Crush, 기리보이) \"></td>";
//		String [] aear;
//		aear=ae.split("name=\"check\" disc_id=\"1\" title=\"");
//		System.out.println(aear[0]);
//		System.out.println(aear[1]);
//		String []ao=aear[1].split("\"");
//		System.out.println(ao[0]);
	}
}
