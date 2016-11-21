package Main.control;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.htmlparser.jericho.Source;

@Controller
public class mainCon {

	@RequestMapping({"/","/index"})
	public ModelAndView main() {
		try {
			ModelAndView mv = new ModelAndView();
			// ��ũ����
			String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";
			String mnetSite = "http://www.mnet.com/chart/TOP100/20161118";

			// bugs
			Source bugSource = new Source(new URL(bugsStie));
			bugSource.getAllTags();
			bugSource.fullSequentialParse();

			String sourBugs = bugSource.toString();
			String[] bugsTitle = sourBugs.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title = null;

			String[] bugsArtist = sourBugs.split("\" artist_disp_nm=\"");
			String[] artist = null;

			String[] bugsAlbum = sourBugs.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album = null;

			ArrayList<HashMap> bugs = new ArrayList<>();

			for (int i = 1; i < 101; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}
			
			// Mnet
			Source mnetSource = new Source(new URL(mnetSite));
			mnetSource.getAllTags();
			mnetSource.fullSequentialParse();
			String sourMnet = mnetSource.toString();
			String[] mnetTitle = sourMnet.split("class=\"btn_recom\" title=\"");

			String[] mnetArtist1 = sourMnet.split("class=\"MMLIInfo_Artist\"");
			String[] mnetArtist2 = mnetArtist1[1].split(">");

			String[] mnetAlbum = sourMnet.split("target=\"_self\"><img src=");
			// String []mnetArtist2=null;
			ArrayList<HashMap> mnet = new ArrayList<>();

			for (int i = 1; i < 51; i++) {
				HashMap map = new HashMap();
				title = mnetTitle[i].split("-");
				artist = mnetArtist2[i].split("<");
				album = mnetAlbum[i].split("alt");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", album[0]);
				mnet.add(map);
			}

			mv.addObject("bugs", bugs);
			mv.addObject("mnet", mnet);
			mv.setViewName("t:nav");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/soulPlayer")
	public ModelAndView soulPlayer(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/soulplayer/soulPlayer");
		return mv;
	}
}
