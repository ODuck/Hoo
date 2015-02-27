package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class NaverBlog extends Search {

	public NaverBlog() {
		setBasicForm("http://blog.naver.com/PostList.nhn?blogId=");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "MS949");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("nickName")) {
					setNickName(list.get(i).split("'")[1]);
					if (!getNickName().equals("")) {
						System.out.println("네이버블로그 닉네임 : " + getNickName());
						storage.nickNameList.add(getNickName());
					}
					break;
				}
				i++;
			}
			br.close();

			SiteInfo siteInfo = new SiteInfo();
			siteInfo.setSiteImage("https://lh4.ggpht.com/LgVIzIKFwA6PqUq3p6FJoS41c0ZC0z0Xvu6O_pMNnNIUNjnUh1Bld3A4V2FSw8QChpE=w300-rw");
			siteInfo.setUrl(getUrl());
			siteInfo.setSiteName("네이버 블로그");
			storage.siteInfoList.add(siteInfo);

		} catch (Exception e) {
			if (e.toString().contains("FileNotFoundException")) {
				System.out.println("네이버 블로그가 없습니다");
			}
		}

	}
}
