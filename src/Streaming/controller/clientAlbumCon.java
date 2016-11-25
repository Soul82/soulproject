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
		String userid=(String)session.getAttribute("userId");
//		List<String> ar = Arrays.asList(mp3.split("@@"));
		List<HashMap> m=upServ.albumList(userid);
		
		mv.addObject("m",m);
		mv.addObject("total", m.size());
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
			mv.setViewName("/admin/selectAlbum");
			mv.addObject("album",map);
			return mv;
		}else{
			System.out.println("��� ����");
			return mv;
		}
	}


	//������ �뷡���
	@RequestMapping("/mp3/listen")
	public ModelAndView selectList(String mp3,int num) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mp3);
		String[] titles = mp3.split("@@");

		ArrayList<HashMap> musicList = new ArrayList<>();
		for (int h = 0; h < titles.length; h++) {
			String title = titles[h];
			System.out.println("��"+title);
			MP3reposit li = upServ.selectOneMp3(num);
			
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("title", li.getTitle());
				map.put("url", li.getUrl());
				musicList.add(map);
		}
		mv.addObject("music", musicList);
		mv.addObject("musicSize", musicList.size());
		mv.setViewName("/soulplayer/player");
		return mv;
	}

	
	//������ �Ѱ� ���
	@RequestMapping("/mp3/Onelisten")
	public ModelAndView selectOne(int num) {
		ModelAndView mv = new ModelAndView();
		
		MP3reposit li = upServ.selectOneMp3(num);
		
		ArrayList<HashMap> musicList = new ArrayList<>();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", li.getTitle());
			map.put("url", li.getUrl());
			musicList.add(map);
		mv.addObject("music", musicList);
		mv.addObject("musicSize", musicList.size());
		mv.setViewName("/soulplayer/player");
		
		return mv;
	}
	
}
