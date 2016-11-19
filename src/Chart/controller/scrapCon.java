package Chart.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Chart.model.scrapServ;
import net.htmlparser.jericho.Source;

@Controller
public class scrapCon {

	@Autowired
	scrapServ ss;

	@RequestMapping("/naver")
	public String getNaverChart() {
		String urlPath = "http://music.naver.com/listen/top100.nhn?domain=TOTAL&duration=1d";
		String pageContents = "";
		StringBuilder contents = new StringBuilder();

		try {
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			
			String naverSource=contents.toString();
			String[] naverTitle = naverSource.split("><span class=\"ellipsis\">");
			String[] title = null;

			String[] naverArtist = naverSource.split("<span class=\"ellipsis\" >");
			String[] artist = null;

			String[] navernAlbum = naverSource.split("http://musicmeta.phinf.naver.net");
			String[] album = null;

			ArrayList<HashMap> naverMusic = new ArrayList<>();

			for (int i = 1; i < 45; i++) {
				HashMap map = new HashMap();
				title = naverTitle[i].split("\\<");
				artist = naverArtist[i].split("\\<");
				artist[0]=artist[0].replaceAll("\\s+", "");
				album = navernAlbum[i].split("\\?");
				album[0]="http://musicmeta.phinf.naver.net"+album[0];
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", album[0]);
				naverMusic.add(map);
				System.out.println(map.get("title")+" / "+map.get("artist")+" / "+map.get("album"));
			}

			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
