package Streaming.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Controller
public class streamingCon {

	@RequestMapping("/music/search")
	public String soundCould() {

		return "body:streaming/1";
	}

	
	@RequestMapping("/mp3up")
	public String upload(){
		return "/soulplayer/mp3Upload";
	}
	
	@RequestMapping("/music/play")
	public void soundPlay() {
		URLConnection conn = null;
		try {
			conn = new URL("https://soundcloud.com/1990han/sm-station-x-exo-dancing-king-cover").openConnection(); // fill
																													// in
																													// the
																													// correct
																													// http
			// address
			InputStream is = conn.getInputStream();

			OutputStream outstream = new FileOutputStream(new File("c:/users/admin/test.mp3")); // fill
																								// in
			byte[] buffer = new byte[4096];
			int len;

			while ((len = is.read(buffer)) > 0) {
				outstream.write(buffer, 0, len);
				System.out.println(len);
			}
			outstream.close(); // in a finally block of course
			is.close();
			System.out.println("DONE!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
