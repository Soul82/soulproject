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

		// ��ũ����
		String url = "http://music.bugs.co.kr/chart?wl_ref=m_left_02_01";
		
		// �ش� URL �������� �����´�.
		Source source = new Source(new URL(url));
		source.getAllTags();
		
		// System.out.println(source+"\"");
		// �޼ҵ� ã�⸦ ���� ���ۺ��� ������ �±׵鸸 parse �Ѵ� (?)
		source.fullSequentialParse();
		// ";\"track_title=\""
		String sour = source.toString();
		System.out.println(sour);
		
		String [] ar;
		
		ar=sour.split("name=\"\check\"\ disc_id=\"\1\"\ title=\"\");
		
	}
}
