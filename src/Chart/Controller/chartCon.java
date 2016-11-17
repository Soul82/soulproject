package Chart.Controller;

import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class chartCon {

	@RequestMapping("/chart/json")
	public void jsonChart(HttpServletRequest resq) {
		/* 공통부분 */
		try {
			ModelAndView mv=new ModelAndView();
			
			URL url = new URL("http://apis.skplanetx.com/melon/charts/todaytopsongs?count=100&page=1&version=1");
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			JSONObject object = (JSONObject) JSONValue.parse(isr);

			/* Object로 받을 경우 */
			JSONObject head = (JSONObject) object.get("melon");
			System.out.println(head.get("menuId").toString());
			System.out.println(head.get("count").toString());
			System.out.println(head.get("page").toString());
			System.out.println(head.get("totalPages").toString());
			System.out.println(head.get("songs").toString());

			/* Array로 받을 경우 */
			JSONArray bodyArray = (JSONArray) object.get("song");
			for (int i = 0; i < bodyArray.size(); i++) {
				JSONObject data = (JSONObject) bodyArray.get(i);
				System.out.println(data.get("songId").toString());
				System.out.println(data.get("songName").toString());
				System.out.println(data.get("albumId").toString());
				System.out.println(data.get("albumName").toString());
				System.out.println(data.get("currentRank").toString());
				System.out.println(data.get("pastRank").toString());
				System.out.println(data.get("rankDay").toString());
				System.out.println(data.get("playTime").toString());
				System.out.println(data.get("isTitleSong").toString());
				System.out.println(data.get("isHitSong").toString());
				System.out.println(data.get("rankisAdultDay").toString());
				System.out.println(data.get("isFree").toString());
				
			}
			
			JSONArray bodyArray2 = (JSONArray) object.get("artist");
			for (int i = 0; i < bodyArray2.size(); i++) {
				JSONObject data = (JSONObject) bodyArray.get(i);
				System.out.println(data.get("artistId").toString());
				System.out.println(data.get("artistName").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/split")
	public void split(){
		String s="onclick='bugs.wiselog.area('list_tr_14_chart');bugs.music.addTrackToMyAlbum(this,'30448581'); ' track_title='그런 밤' class='btn addAlbu'>내 앨범에 담기<";
		String [] ar;
		
		ar=s.split("`");
		for(int i=0; i<ar.length;i++){
			String[] a=ar[1].split("'");
			System.out.println(a[0]);
		}
		
	}
}