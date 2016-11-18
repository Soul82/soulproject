package Chart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Chart.model.scrapServ;

@Controller
public class scrapCon {
	
	@Autowired
	scrapServ ss;
	
	@RequestMapping("/scrap")
	public void scrapCon(){
		try{
			ss.testing();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
