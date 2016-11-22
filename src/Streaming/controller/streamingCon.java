package Streaming.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Streaming.model.streamingServ;

@Controller
public class streamingCon {
	@Autowired
	streamingServ upServ;
	
	@RequestMapping("/admin/reg")
	public String soundCould() {

		return "body:admin/adminpage";
	}

	
	@RequestMapping("/admin/mp3up")
	public ModelAndView uploadPage(@RequestParam(name="mp3")MultipartFile f,
	String artist,String title,String mv){
		ModelAndView mav=new ModelAndView();
		boolean r=upServ.insertmp3(f, artist,title,mv);
		if(r==true){
			System.out.println("등록 성공 제바루ㅜㅜㅜㅜ");
			mav.addObject("list",upServ.callmp3());
			mav.setViewName("/admin/mp3list");
//			mav.setViewName("/soulplayer/soulPlayer");
		}else{
			System.out.println("망함");
		}
		return mav;
	}
}
