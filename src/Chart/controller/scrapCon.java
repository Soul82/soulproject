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

//	 @RequestMapping("/melon")
	public ModelAndView melonCon() {
		ModelAndView mv = new ModelAndView();
		// melon
		try {
			String melonSite = "http://www.melon.com/chart/day/index.htm";
			Source melonSource = new Source(new URL(melonSite));
			melonSource.getAllTags();
			melonSource.fullSequentialParse();

			String sourMelon = melonSource.toString();
			System.out.println("멜론 소스::" + sourMelon);
			// String []melonTitle=sourMelon.split("class=\"btn_icon play\"
			// title=\"");
			// String []melonTitle2=melonTitle[1].split("<div class=\"ellipsis
			// rank02\" ><a href=\"");
			// String []title=null;
			//
			//// String []melonArtist=sourMelon.split("artist");
			//// String []artist=null;
			////
			//// String []melonAlbum=sourMelon.split("/images/");
			//// String []album=null;
			//
			// ArrayList<HashMap> melon=new ArrayList<>();
			//
			// for(int i=1;i<51;i++){
			// HashMap map=new HashMap();
			// title=melonTitle[i].split("title=\"");
			//// artist=melonArtist[i].split("\"");
			//// album=melonAlbum[i].split("\"");
			// map.put("title", title[0]);
			//// map.put("artist", artist[0]);
			//// map.put("album", album[0]);
			// melon.add(map);
			// System.out.println(map.get("title"));
			// }
			// // mv.addObject("melon",melon);
			// // mv.setViewName("body:chart/bugsChart");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/melon")
	public String getHttpHTML() {
		String urlPath = "http://www.melon.com/chart/day/";
//		String urlPath = "http://www.mnet.com/chart/top100/";
		String pageContents = "";
		StringBuilder contents = new StringBuilder();

		try {

			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				// System.out.println(pageContents);
				contents.append(pageContents);
				contents.append("\r\n");
			}

			buff.close();

			System.out.println("되냐?"+contents.toString());
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
