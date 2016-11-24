package Streaming.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Streaming.model.streamingServ;
import Streaming.pojo.MP3reposit;

@Controller
public class clientAlbumCon {
	@Autowired
	SqlSessionFactory fac;

	@RequestMapping("/mp3/pass")
	public ModelAndView passMusic(String mp3, HttpServletRequest req) {
		System.out.println("controller==" + mp3);
		ModelAndView mv = new ModelAndView();

		// 로그인된 세션의 아이디
		String userId = (String) req.getAttribute("userId");
		// 전달받은 값 @@로 자르기
		List<String> ar = Arrays.asList(mp3.split("@@"));

		// DB insert parameter=> HashMap
		HashMap map = new HashMap();
		map.put("my_id", userId);
		System.out.println(userId);
		// ArrayList를 Map에 담기
		for (int i = 0; i < ar.size(); i++) {
			// System.out.print(ar.get(i));
			map.put("my_title", ar.get(i));
			System.out.println(map.get("my_title"));
		}

		mv.addObject("total", ar.size());
		mv.addObject("album", map);
		mv.setViewName("/admin/selectAlbum");
		return mv;
	}

	@RequestMapping("/mp3/makeAlbum")
	public ModelAndView makeAlbum(String mp3, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/selectAlbum");

		return mv;
	}

	@Autowired
	streamingServ upServ;

	@RequestMapping("/mp3/listen")
	public ModelAndView selectList(String mp3) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mp3);
		List<String> ar = Arrays.asList(mp3.split("@@"));

		String title = null;
		for (int h = 0; h < ar.size(); h++) {
			title = ar.get(h);
			System.out.println(title);
			List<MP3reposit> li = upServ.selectMp3(title);

			ArrayList<HashMap> musicList = new ArrayList<>();
			for (int i = 0; i < li.size(); i++) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("title", li.get(i).getTitle());
				map.put("url", li.get(i).getUrl());
				musicList.add(map);
			}
			mv.addObject("music", musicList);
			mv.addObject("musicSize", musicList.size());
			mv.addObject("list", li);
			mv.setViewName("/soulplayer/player");
		}
		return mv;
	}

	@RequestMapping("/mp3/Onelisten")
	public ModelAndView selectOne(String title) {
		ModelAndView mv = new ModelAndView();

		List<MP3reposit> li = upServ.selectMp3(title);

		ArrayList<HashMap> musicList = new ArrayList<>();
		for (int i = 0; i < li.size(); i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", li.get(i).getTitle());
			map.put("url", li.get(i).getUrl());
			musicList.add(map);
		}
		mv.addObject("music", musicList);
		mv.addObject("musicSize", musicList.size());
		mv.addObject("list", li);
		mv.setViewName("/soulplayer/player");
		return mv;
	}
}
