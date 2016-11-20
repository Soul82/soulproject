package Streaming.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class streamingCon {

	@RequestMapping("/music/search")
	public String soundCould() {

		return "body:streaming/1";
	}

	@RequestMapping("/music/play")
	public void soundPlay() {
		URLConnection conn = null;
		try{
		conn = new URL("https://soundcloud.com/1990han/sm-station-x-exo-dancing-king-cover").openConnection(); // fill in the correct http
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
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/tagger")
	public void tagger(){
			String decoding = "ISO-8859-1";
	        String encoding = "EUC-KR";
	        File file = new File("ParkHyoShin-Breath.mp3");
	        try{
	        MP3File mp3 = (MP3File) AudioFileIO.read(file);
	//  ID3v24Tag tag24 = mp3.getID3v2TagAsv24();
	        AbstractID3v2Tag tag2 = mp3.getID3v2Tag();
	 
	        Tag tag = mp3.getTag();
	        String title = tag.getFirst(FieldKey.TITLE);
	        String artist = tag.getFirst(FieldKey.ARTIST);
	        String album = tag.getFirst(FieldKey.ALBUM);
	        String year = tag.getFirst(FieldKey.YEAR);
	        String genre = tag.getFirst(FieldKey.GENRE);
	 
	        System.out.println("Tag : " + tag2);
	        System.out.println("Song Name : " + title);
	        System.out.println("Artist : " + artist);
	        System.out.println("Album : " + album);
	        System.out.println("Year : " + year);
	        System.out.println("Genre : " + genre);
        }catch(Exception e){
        	e.printStackTrace();
        }
	}
}
