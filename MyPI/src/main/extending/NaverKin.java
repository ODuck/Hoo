package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class NaverKin extends Search {
	public NaverKin() {
		setBasicForm("http://kin.naver.com/profile/");
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

				if (list.get(i).contains("content=\"none\""))
					System.out.println("네이버 지식인 페이지가 없습니다.");

				if (list.get(i).contains("og:title")) {
					setNickName(list.get(i).split(" ")[2].replace('"', '!')
							.split("!")[1]);
					if (!coreMaterial.equals(getNickName())) {
						storage.nickNameList.add(getNickName());
					}

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://lh5.ggpht.com/mNkYMueGE34aH1vRv2zs13NOv6gHyK39Gcj7mz-M2WTIYTxyUVnC5QtFxrSE6OD_ZQM=w300-rw");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("네이버 지식인");
					storage.siteInfoList.add(siteInfo);

				}
				i++;
			}
			br.close();

		} catch (Exception e) {
			System.out.println("네이버지식인 : " + e);
		}

	}

}
