package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class Dreamwiz extends Search {
	public Dreamwiz() {
		setBasicForm("http://blog.dreamwiz.com/");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";
		setUrl(getBasicForm() + coreMaterial);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;

		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "utf-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("개설되지 않은")) {
					System.out.println("드림위즈 블로그가 없습니다.");
					break;
				}
				if (list.get(i).contains("blog.dreamwiz.com")) {

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWu03i2ipHNBvsQb5aOUdo2YOry4Bkx1EfL6Zm8VuKu_WwVXtS");
					siteInfo.setUrl(getUrl());
					siteInfo.setSiteName("드림위즈 블로그");
					storage.siteInfoList.add(siteInfo);

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
