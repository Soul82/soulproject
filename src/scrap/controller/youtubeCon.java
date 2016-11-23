package scrap.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class youtubeCon {

	@RequestMapping("/youtube/board")
	public String MVboard() {
		return "youtube/youtubeSearch";
	}
	
	@RequestMapping("/youtube/mvplay")
	public ModelAndView mvPlay(String key){
		ModelAndView mv=new ModelAndView();
		mv.addObject("key",key);
		mv.setViewName("/youtube/youtubeWatch");
		return mv;
	}

	@RequestMapping("/youtube/search")
	public ModelAndView mvSearch(String urlSearch) {
		System.out.println("���Z �˻���"+urlSearch);
		String urlPath = "https://www.youtube.com/results?search_query=" + urlSearch;
		String pageContents = "";
		StringBuilder contents = new StringBuilder();
		ModelAndView mv = new ModelAndView();
		
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
			// ������� �˻� ��� �޾ƿ���

			String searchSource = contents.toString();
			String[] vSplit = searchSource.split("data-context-item-id=\"");
			String[] video = null;

			String[] iSplit = searchSource.split("https://i.ytimg.com/vi");
//			 String[] iSplit2=searchSource.split("<img src=\"");
//			 
			String[] image = null;

			String[] tSplit = searchSource.split("aria-hidden=\"true\">");
			String[] time = null;
			
			String[] titleSplit=searchSource.split("dir=\"ltr\">");
			String [] title=null;
			ArrayList<HashMap> search = new ArrayList<>();
			
			for (int i = 0; i < 5; i++) {
				HashMap<String,String>map=new HashMap<>();
				video = vSplit[i+1].split("\"");
				time = tSplit[i+1].split("<");
				image = iSplit[i+1].split(".jpg");
				title= titleSplit[i+1].split("<");
				title= titleSplit[i+5+i].split("<");
				
				map.put("video", video[0]);
				map.put("time", time[0]);
				map.put("image", "https://i.ytimg.com/vi"+image[0]+".jpg");
				map.put("title", title[0]);
				
				search.add(map);
			}
			
			for(int i=0;i<search.size();i++){
				System.out.println(search.get(i));
			}
			
			mv.addObject("search", search);
			mv.setViewName("/youtube/youtubeList");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
