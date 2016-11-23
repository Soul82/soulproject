package jAudio;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.springframework.util.FileCopyUtils;

public class JAudioTest {
	public static void main(String[] args) throws Exception {
		String decoding = "ISO-8859-1";
		String encoding = "EUC-KR";
		File file = new File("temp.mp3");
		
		URL u =	new URL("https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/%EC%95%84%EC%9D%B4%EC%98%A4%EC%95%84%EC%9D%B4+(I.O.I)-%EB%84%88%EB%AC%B4%EB%84%88%EB%AC%B4%EB%84%88%EB%AC%B4.mp3");
		
		FileCopyUtils.copy(u.openStream(), new FileOutputStream(file));
		
		MP3File mp3 = (MP3File) AudioFileIO.read(file);
//		 ID3v24Tag tag24 = mp3.getID3v2TagAsv24();
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
	}
}
