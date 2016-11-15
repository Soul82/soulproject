package Board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Board.model.qnaServ;
import Board.pojo.qnaVO;

@Controller
public class qnaCon {
	
	@Autowired
	qnaServ qs;
	
	@RequestMapping("/qna/qnaList")
	public ModelAndView qnaList(){
		ModelAndView mv=new ModelAndView();
		List li=qs.allView();
		mv.setViewName("board:board/qnaboard/qnalist");
		mv.addObject("data",li);
		return mv;
	}
	
	@RequestMapping("/qna/regpage")
	public ModelAndView wirtePage(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board:board/qnaboard/qnawrite");
		return mv;
	}
	
	@RequestMapping("/qna/regqna")
	public ModelAndView qnaWrite(String cate, String title,String content){
		ModelAndView mv=new ModelAndView();
		System.out.println(cate+" / "+title+" / "+content);
		int r=qs.regMemo(cate, content, title);
		if(r==1){
			mv.setViewName("board:board/qnaboard/qnalist");
		}else {
			mv.setViewName("body:board/errorpage");
		}
		return mv;
	}
	
//	@RequestMapping("/qna/view")
//	public ModelAndView qnaHit(int num){
//		ModelAndView mv=new ModelAndView();
//		System.out.println(num);
//		mv.setViewName("board:board/qnaboard/qnalist");
//		qnaVO qna=qs.hitQna(num);
//		mv.addObject("obj",qna);
//		
//		return mv;
//	}
	
}