package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class Twitter extends Search {
	public Twitter() {
		setBasicForm("https://twitter.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream InputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(InputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains(
						"https://twitter.com/account/suspended"))
					System.out.println("정지된 트위터 계정입니다.");

				if (list.get(i).contains("트위터의")) {
					setNickName(list.get(i).substring(18).split(" ")[0]);
					storage.nickNameList.add(getNickName());

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300-rw");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("트위터");
					storage.siteInfoList.add(siteInfo);

				} else if (list.get(i).contains("profile_images")) {
					setImgUrl(list.get(i).replace('"', '@').split("@")[1]);
					storage.imgUrlList.add(getImgUrl());
					;
					break;
				}
				i++;
			}
			br.close();

		} catch (Exception e) {
			if (e.toString().contains("FileNotFoundException")) {
				System.out.println("트위터가 없습니다");
			}
		}

	}
}
