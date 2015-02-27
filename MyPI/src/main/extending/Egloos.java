package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class Egloos extends Search {
	public Egloos() {
		setBasicForm(".egloos.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl("http://" + coreMaterial + getBasicForm());
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream InputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(InputURL);
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				list.add(buffer);

				if (list.get(i).contains("블로그가 존재하지 않습니다")) {
					System.out.println("이글루가 없습니다.");
					break;
				}

				if (i == 5 && list.get(i).contains("author")) {

					setNickName((list.get(i).substring(29).replace('"', '!')
							.split("!")[1]));
					storage.nickNameList.add(getNickName());

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://lh4.ggpht.com/aqtv6-0J9Aoczc1T663jms8fngcFG0BFl7oEZHQYIgFUxbp3INij-Mzlkl2wiK-QxZAi=w300-rw");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("이글루스 블로그");
					storage.siteInfoList.add(siteInfo);

				}
				if (list.get(i).contains("img src")) {
					setImgUrl((list.get(i).split("<")[2].replace('"', '!')
							.split("!")[1]));
					storage.imgUrlList.add(getImgUrl());
					break;
				}
				i++;
			}
			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
