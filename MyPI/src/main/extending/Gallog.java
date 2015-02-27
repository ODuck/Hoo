package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class Gallog extends Search {
	public Gallog() {
		setBasicForm("http://gallog.dcinside.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream InputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(InputURL, "utf-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);

				if (list.get(i).contains("error_top")) {
					System.out.println("갤로그가 없습니다.");
					break;
				}

				if (list.get(i).contains("pfNickView")) {
					if (list.get(i).split(">")[1].contains("<U"))
						setNickName(list.get(i).split(">")[2].split("<")[0]);
					else
						setNickName(list.get(i).split(">")[1].split("<")[0]);

					storage.nickNameList.add(getNickName());

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://lh6.ggpht.com/NRyDtq-pg84zE188hTkcVj8gzo3KYfXWrOm1VuO1HBHsIJQs44AM_mIxMsXbE7BQp34=w300-rw");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("디시인사이드 갤로그");
					storage.siteInfoList.add(siteInfo);

				}
				i++;
			}
			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
