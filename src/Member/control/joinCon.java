package Member.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class joinCon {

	@RequestMapping("/member/join")
	public String joinPage() {
		return "body:member/join";
	}
}