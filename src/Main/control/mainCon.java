package Main.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainCon {

	@RequestMapping("/index")
	public String main() {

		return "t:home";
	}
}
