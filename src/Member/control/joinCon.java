package Member.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class joinCon {

	@RequestMapping("/member/joinPage")
	public String joinPage() {
		return "body:member/join";
	}
	
	@RequestMapping("/member/joinConfirm")
	public ModelAndView join(String img,String id,String pass, String mail, String name, String gender, int birthYear, int birthMonth, int birthDay){
		ModelAndView mv=new ModelAndView();
		System.out.println(img+" / "+id+" / "+pass+" / "+mail+" / "+name+" / "+gender+" / "+birthYear+" / "+birthMonth+" / "+birthDay);
		
		int birth=(birthYear+birthMonth+birthDay);
		System.out.println("생년월일=="+birth);
		
		mv.setViewName("body:member/joinComplete");
		return mv;
	}
}