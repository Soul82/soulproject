package Streaming.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Streaming.model.streamingServ;
import Streaming.pojo.MP3reposit;

@Controller
public class streamingCon {
	@Autowired
	streamingServ upServ;

	// JSON ������� jplayer���� �������ֱ�
//	@RequestMapping("/json/soulPlayer")
//	public ModelAndView soulPlayer(){
//		ModelAndView mv=new ModelAndView();
//		List<MP3reposit> li=upServ.ListMp3();
//		String json="{title:&nbsp;"+li.get(1).getTitle()+",<br/>"+"mp3:&nbsp;"+li.get(1).getUrl()+",},";
//		System.out.println(json);
//		mv.addObject("json",json);
//		mv.setViewName("/soulplayer/player");
//		return mv;
//	}
	
	// ������ mp3 ���������
	@RequestMapping("/admin/reg")
	public String soundCould() {
		return "body:admin/adminpage";
	}
	
	//��� �� ��µǴ� ����Ʈ ������
	@RequestMapping("/admin/reglist")
	public ModelAndView mp3list() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", upServ.ListMp3());
		mav.setViewName("body:admin/mp3list");

		return mav;
	}

	// ������ ��� ���� (insert mp3 file)
	@RequestMapping("/admin/mp3up")
	public ModelAndView uploadPage(@RequestParam(name = "mp3") MultipartFile f, 
			String artist, String title, String mv) {
		ModelAndView mav = new ModelAndView();
		boolean r = upServ.insertmp3(f, artist, title, mv);
		if (r == true) {
			System.out.println("��� ���� ���ٷ�̤̤̤�");
			mav.addObject("list", upServ.ListMp3());
			mav.setViewName("/admin/mp3list");
		} else {
			System.out.println("����");
		}
		return mav;
	}
	
	//List �������� Play Music ����
	@RequestMapping("/playmusic")
	public ModelAndView playmusic(){
		ModelAndView mav = new ModelAndView();
		List<MP3reposit> li=upServ.ListMp3();
		
		for(int i=0;i<li.size();i++){
			HashMap<String, String> map=new HashMap<String, String>();
				map.put("title", li.get(i).getTitle());
				map.put("url", li.get(i).getUrl());
				mav.addObject("map",map);
				mav.addObject("mapsize",map.size());
		}
//		mav.addObject("title", li.get(1).getTitle());
//		mav.addObject("url", li.get(1).getUrl());
		mav.addObject("list",li);
		mav.setViewName("/soulplayer/player");
		return mav;
	}
}
