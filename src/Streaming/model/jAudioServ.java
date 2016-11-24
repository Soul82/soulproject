package Streaming.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

import org.apache.catalina.Server;
import org.apache.commons.io.IOUtils;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;

import Streaming.pojo.MP3reposit;

@org.springframework.stereotype.Component
public class jAudioServ {
	@Autowired
	streamingServ stream;

	public void jTagger() {
		try {
			String decoding = "ISO-8859-1";
			String encoding = "EUC-KR";
			// DB 데이터 가져오기
			List<MP3reposit> li = stream.ListMp3();
			// DB에서 [가수-제목] 으로 파일 이름 설정하기
			String name = li.get(2).getArtist() + "-" + li.get(2).getTitle();
			System.out.println(name);
			//URL url2 = new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/TWICE-TT.mp3");
			// DB에 있는 해당 노래의 url가져오기
			File file = new File(name + ".mp3");
			// 이 밑으로 audio 정보 가져오는거
			String url = li.get(2).getUrl();
			System.out.println(url);
			if("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/한동근-이 소설의 끝을 다시 써보려 해.mp3".equals(url)){
				System.out.println("!!!!!!!!");
			}
			
			System.out.println("%EA%B8%B1%EC%8A%A4+");
			System.out.println(URLEncoder.encode("긱스", "iso-8859-1"));
			System.out.println(URLEncoder.encode("긱스", "utf-8"));
			System.out.println(URLEncoder.encode("긱스", "EUC-KR"));
			//System.out.println(URLEncoder.encode("긱스", "iso-8859-1"));
			//System.out.println(URLEncoder.encode("긱스", "iso-8859-1"));
			
			String enStr = URLEncoder.encode(url, "utf-8");
			System.out.println(enStr);
			
			//URL u = new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/"+URLEncoder.encode(name,"ISO-8859-1")+".mp3");
			//URL u = new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/"+URLEncoder.encode(name,"utf-8")+".mp3");
			URL u = new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/"+URLEncoder.encode("TWICE-TT","utf-8")+".mp3");

			FileCopyUtils.copy(u.openStream(), new FileOutputStream(file));

			MP3File mp3 = (MP3File) AudioFileIO.read(file);
			System.out.println(mp3);
			// ID3v24Tag tag24 = mp3.getID3v2TagAsv24();
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

			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void jTag() {
		try {
		String decoding = "ISO-8859-1";
		String encoding = "EUC-KR";
		File file = new File("temp.mp3");

		URL u = new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/%EC%95%84%EC%9D%B4%EC%98%A4%EC%95%84%EC%9D%B4+(I.O.I)-%EB%84%88%EB%AC%B4%EB%84%88%EB%AC%B4%EB%84%88%EB%AC%B4.mp3");

		FileCopyUtils.copy(u.openStream(), new FileOutputStream(file));

		MP3File mp3 = (MP3File) AudioFileIO.read(file);
		// ID3v24Tag tag24 = mp3.getID3v2TagAsv24();
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

		file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
