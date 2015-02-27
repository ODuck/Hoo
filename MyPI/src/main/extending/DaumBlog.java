package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class DaumBlog extends Search {
	public DaumBlog() {
		setBasicForm("http://blog.daum.net/");
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
				if (list.get(i).contains("frame src")) {
					setUrl("http://blog.daum.net"
							+ list.get(i).replace('"', '!').split("!")[1]
									.replace("&amp;", "&"));
					break;
				}
				i++;
			}
			br.close();
			rd.close();
			inputURL.close();
			inputURL = new URL(getUrl()).openStream();
			rd = new InputStreamReader(inputURL);
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("author")) {
					setNickName(list.get(i).replace('"', '!').split("!")[3]);
					storage.nickNameList.add(getNickName());
				} else if (list.get(i).contains("profileImg")) {
					setImgUrl(list.get(i).replace('"', '!').split("!")[3]);
					storage.imgUrlList.add(getImgUrl());
					break;
				}
				i++;
			}

			br.close();
			rd.close();
			inputURL.close();

			SiteInfo siteInfo = new SiteInfo();
			siteInfo.setSiteImage("http://m1.daumcdn.net/svc/image/U03/common_icon/50B477DF063B790002");
			siteInfo.setUrl(getUrl());
			siteInfo.setSiteName("다음 블로그");
			storage.siteInfoList.add(siteInfo);

		} catch (Exception e) {
			if (e.toString().contains("FileNotFoundException")) {
				System.out.println("다음 블로그가 없습니다");
			}
		}

	}
}
