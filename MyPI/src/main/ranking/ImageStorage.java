package main.ranking;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class ImageStorage {
	private static ArrayList<String> imgUrlList;

	public static ArrayList<String> getImgUrlList() {
		if (imgUrlList == null) {
			imgUrlList = new ArrayList<String>();
		}

		return imgUrlList;
	}
	
	public static void init() {
		imgUrlList = null;
	}

	public static void deleteBlank() {
		int count = imgUrlList.size();
		BufferedReader br;

		System.out.println("deleteBlank : 사이즈 : " + count);
		for (int i = 0; i < count; i++) {
			try {
				URL url = new URL(imgUrlList.get(i));
				HttpURLConnection con = (HttpURLConnection) url
						.openConnection();

				con.addRequestProperty("User-Agent", "Mozilla/4.0");
				con.setConnectTimeout(5000);
				con.setReadTimeout(3000);

				InputStream inputURL = con.getInputStream();
				InputStreamReader rd = null;

				rd = new InputStreamReader(inputURL);
				br = new BufferedReader(rd);

				rd.close();
				br.close();

			} catch (Exception e) {
				System.err.println("에러가 났습니다 : " + e);

				imgUrlList.remove(i);
				i--;
				count--;
			}

		}
		System.out.println("최종 이미지 사이즈 : " + imgUrlList.size());
	}
}
