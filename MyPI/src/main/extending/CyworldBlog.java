package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class CyworldBlog extends Search {

	public CyworldBlog() {
		setBasicForm("http://blog.cyworld.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);

				if (list.get(i).contains("euc-kr")) {
					System.out.println("싸이월드 블로그가 없습니다");
					break;
				}

				if (list.get(i).contains("author")) {
					setNickName(list.get(i).replace('"', '!').split("!")[3]);
					storage.nickNameList.add(getNickName());

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQEMm-PRtTxhqlixw5B9razURdXydJ6rb-RwjsVwKRFR6ZA1Mi5rA");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("싸이월드 블로그");
					storage.siteInfoList.add(siteInfo);

				} else if (list.get(i).contains("og:image")) {
					;
					setImgUrl(list.get(i).replace('"', '!').split("!")[3]);
					storage.imgUrlList.add(getImgUrl());
					break;
				}
				i++;

			}

			br.close();
			rd.close();
			inputURL.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
