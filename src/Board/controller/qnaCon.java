package Board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Board.model.qnaServ;

@Controller
public class qnaCon {
	
	@Autowired
	qnaServ qs;
	
	@RequestMapping("")
	public ModelAndView wirteCon(){
		ModelAndView mv=new ModelAndView();
		
		return mv;
	}
}
