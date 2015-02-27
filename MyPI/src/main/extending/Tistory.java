package main.extending;

import main.extending.form.Search;
import main.extending.form.SiteInfo;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Tistory extends Search {
	public Tistory() {
		setBasicForm("http://");
	}

	public void searchMaterials(String coreMaterial) {

		Document doc;
		setUrl(getBasicForm() + coreMaterial + ".tistory.com");

		try {
			doc = Jsoup.connect(getUrl()).get();

			SiteInfo siteInfo = new SiteInfo();
			siteInfo.setSiteImage("https://lh3.ggpht.com/XJv1v_rHNeMXCBmTauDbepxVgIOhArGVZMCBt0UoC3QJLm3YpQ-gLRRmc0wRlFQXyN0=w300-rw");
			siteInfo.setUrl(getUrl());
			siteInfo.setSiteName("티스토리 블로그");
			storage.siteInfoList.add(siteInfo);

			Elements text = doc.select("div.author");
			Elements img = doc.select("div.wrapBottomM div.profileImageWrap");

			for (Element e : text) {
				System.out.println(e.html());
				setNickName(e.html().toString().split(" ")[3]);
				storage.nickNameList.add(getNickName());
			}

			for (Element e : img) {
				System.out.println(e.html());
				setImgUrl(e.html().split(" ")[5].replace('"', ' ').split(" ")[1]);
				storage.imgUrlList.add(getImgUrl());
			}

		} catch (Exception e) {
			if (e.toString().contains("FileNotFoundException")
					&& e.toString().contains("404")) {
				System.out.println("티스토리가 없습니다.");
			} else if (e.toString().contains(
					"Server returned HTTP response code")) {
				System.out.println("정지된 티스토리 블로그 입니다.");
			} else
				System.out.println(e.toString());
		}

	}
}
