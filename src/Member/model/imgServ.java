package Member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

import javax.servlet.ServletContext;


@Component
public class imgServ {
	@Autowired
	ServletContext app;
	
	public String imgSave(MultipartFile img,String id){
		String imgname ="";
		if(img.isEmpty())
		return "no";
		try{
			imgname=img.getOriginalFilename();
			String dir= app.getRealPath("/");
			System.out.println(dir);
			File save = new File(dir,id+imgname);
			img.transferTo(save);
		}catch (Exception e){
			
		}
	  return imgname;
	}
}
