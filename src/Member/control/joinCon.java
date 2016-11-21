package Member.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Member.model.imgServ;
import Member.model.joinServ;
import Member.pojo.Member;

@Controller
public class joinCon {
	@Autowired
	joinServ js;
	@Autowired
	imgServ imgser;
	
	@RequestMapping("/member/joinPage")
	public String joinPage() {
		return "body:member/join";
	}
	
	@RequestMapping("/member/joinConfirm")
	public ModelAndView join(@RequestParam(name="img") MultipartFile img,String id,String pass, String mail, String name, String gender, String birthYear, String birthMonth, String birthDay){
		ModelAndView mv=new ModelAndView();
		System.out.println(id+" / "+pass+" / "+mail+" / "+name+" / "+gender+" / "+birthYear+" / "+birthMonth+" / "+birthDay);
		String birth=birthYear+birthMonth+birthDay;
		int notice=0;
		String is= imgser.imgSave(img,id);
		System.out.println(is);
		Member mem=new Member();
			mem.setId(id);
			mem.setPass(pass);
			mem.setBirth(birth);
			mem.setGender(gender);
			mem.setImg(is);
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
	
	@RequestMapping("/member/joinAjax.it")
	public ModelAndView existCheck(String id){
		boolean b = js.exist(id);
		ModelAndView mav = new ModelAndView("/member/checkResult");
		mav.addObject("rst", b);
		
		return mav;
	}
}