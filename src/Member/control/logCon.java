package Member.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Member.model.logServ;

@Controller
public class logCon {
	@Autowired
	logServ ls;
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping("/member/logview")
	public String loginView() {
		return "body:member/login";
	}
	
	@RequestMapping("/member/login")
	public ModelAndView proceed(HttpSession session, @RequestParam(name="id")String id, String pass){
		ModelAndView mav = new ModelAndView();
		System.out.println(id+"@@"+ pass);
		int rst = ls.logCheck(id, pass);
		
		if(rst==1) {
			session.setAttribute("userId", id);
			mav.setViewName("redirect:/index");	// redirect:   ��δ� �伳���� ���ʿ� �ٸ� ������Ƶ� ��η� ��û ��ȯ
		}else {
			mav.setViewName("body:member/loginFail");
		}
		return mav;
	}
}
