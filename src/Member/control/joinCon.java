package Member.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Member.model.joinServ;
import Member.pojo.Member;

@Controller
public class joinCon {
	@Autowired
	joinServ js;
	
	@RequestMapping("/member/joinPage")
	public String joinPage() {
		return "body:member/join";
	}
	
	@RequestMapping("/member/joinConfirm")
	public ModelAndView join(String img,String id,String pass, String mail, String name, String gender, String birthYear, String birthMonth, String birthDay){
		ModelAndView mv=new ModelAndView();
		System.out.println(img+" / "+id+" / "+pass+" / "+mail+" / "+name+" / "+gender+" / "+birthYear+" / "+birthMonth+" / "+birthDay);
		
		String birth=birthYear+birthMonth+birthDay;
		int notice=0;
		Member mem=new Member();
			mem.setId(id);
			mem.setPass(pass);
			mem.setBirth(birth);
			mem.setGender(gender);
			mem.setImg(img);
			mem.setMail(mail);
			mem.setName(name);
			mem.setNotice(notice);
		int r=js.joinVO(mem);
		if(r==1){
			mv.setViewName("body:member/joinComplete");
			mv.addObject("joinCom",mem);
		}else{
			System.out.println("회원가입실패요");
		}
		
		return mv;
	}
}