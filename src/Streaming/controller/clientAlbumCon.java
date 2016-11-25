package Streaming.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	streamingServ upServ;
	
	//������ �뷡 ����Ʈ �޾Ƽ� �ٹ� ���� ������ ���
	@RequestMapping("/mp3/pass")
	public ModelAndView passMusic(String mp3, HttpSession session) {
		System.out.println("controller==" + mp3);
		ModelAndView mv = new ModelAndView();
		session.setAttribute("mp3", mp3);
////		 ���޹��� �� @@�� �ڸ���
		List<String> ar = Arrays.asList(mp3.split("@@"));
////		 ArrayList�� Map�� ���
//		for (int i = 0; i < ar.size(); i++) {
//			// DB insert parameter=> HashMap
//			session.setAttribute("album", ar);
//		}
		
		mv.addObject("total", ar.size());
		mv.setViewName("/admin/selectAlbum");
		return mv;
	}
	

	//������ �뷡 ���� �ٹ����� ������ ==> ���⼭ �ٹ� ���� ���
	@RequestMapping("/mp3/makeAlbum")
	public ModelAndView makeAlbum(String name, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("�ٹ��̸�"+name);
		
		// �α��ε� ������ ���̵�(userid)
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		
		// db�� ���� �뷡����(title)
		String title=(String) session.getAttribute("mp3");
		System.out.println("�Ѿ�� �뷡?==>"+title);
		HashMap map=new HashMap();
			map.put("my_id", userId);
			map.put("albumname", name);
			map.put("my_title", title);
		int r=upServ.makeAlbum(map);
		
		if(r==1){
			System.out.println("�ٹ� ����");
			mv.setViewName("/11");
			mv.addObject("album",map);
			return mv;
		}else{
			System.out.println("��� ����");
			return mv;
		}
	}


	//������ �뷡���
	@RequestMapping("/mp3/listen")
	public ModelAndView selectList(String mp3) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mp3);
		List<String> ar = Arrays.asList(mp3.split("@@"));

		String title = null;
		for (int h = 0; h < ar.size(); h++) {
			title = ar.get(h);
			System.out.println(title);
			
			List<MP3reposit> li = upServ.selectOneMp3(title);

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

	
	//������ �Ѱ� ���
	@RequestMapping("/mp3/Onelisten")
	public ModelAndView selectOne(String title) {
		ModelAndView mv = new ModelAndView();
		
		List<MP3reposit> li = upServ.selectOneMp3(title);
		
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
