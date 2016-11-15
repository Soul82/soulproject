package Board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Board.model.reviewServ;

@Controller
public class reviewCon {
	@Autowired
	reviewServ rs;
	@RequestMapping("/board/review")
	public ModelAndView sasd(HttpSession session){
		ModelAndView mav =new ModelAndView();
		String Id = (String)session.getAttribute("userId");
		mav.addObject("userid", Id);
		mav.setViewName("board:board/review/write");
		return mav;
	}
	@RequestMapping("/music/review")
	public ModelAndView write(HttpServletRequest req,HttpSession session){
		
			String Id = (String)session.getAttribute("userId");
		int g= Integer.parseInt(req.getParameter("star-input"));
		String c=req.getParameter("comment");
		System.out.println(g+"//"+c);
		
		HashMap map = new HashMap();
		map.put("id", Id);
		map.put("musictitle", "¼û");
		map.put("comments", c);
		map.put("grade", g);
		boolean b=rs.reviewin(map);
		ModelAndView mav= new ModelAndView();
		if(b==true){
			mav.setViewName("board:board/review/reviewc");
			
		}else{
			mav.setViewName("board:board/review/reviewf");
		}
		
		return mav;
	}
	
	
}

