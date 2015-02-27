package main.extending;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import main.extending.form.ExtendedStorage;
import main.extending.form.Search;
import main.extending.form.SiteInfo;

public class Cyworld extends Search {
	public Cyworld() {
		setBasicForm("http://search.cyworld.com/search/all.html?thr=sbus&ssn=043&q=");
	}

	public void searchMaterials(String coreMaterial) {

		String buffer = "";

		setUrl(getBasicForm() + coreMaterial.split("@")[0] + "%40"
				+ coreMaterial.split("@")[1]);
		ArrayList<String> list = new ArrayList<String>();
		BufferedReader br = null;
		int i = 0;
		String tid = "";

		try {
			InputStream inputURL = new URL(getUrl()).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "euc-kr");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);
				if (list.get(i).contains("nameUIOpen")) {

					tid = list.get(i).split("'")[1].split("'")[0];

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

		try {

			setUrl("http://minihp.cyworld.com/svcs/MiniHp.cy/index/" + tid
					+ "?tid=" + tid + "&urlstr=&f=&gate=_top");
			InputStream inputURL = new URL(getUrl()).openStream();

			InputStreamReader rd = new InputStreamReader(inputURL, "euc-kr");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				list.add(buffer);

				if (list.get(i).contains("검색결과가 없습니다")) {
					System.out.println("싸이월드가 없습니다");
					break;
				}

				if (list.get(i).contains("tName")) {

					String name = list.get(i).replace('"', '!').split("!")[5];

					SiteInfo siteInfo = new SiteInfo();
					siteInfo.setSiteImage("https://lh4.ggpht.com/2o1VGcBQshLa5JWsHfPdC2dhtHLe0FoMWML0UCuumcpysj7L2kJNGm8vLkDMxg38fw=w300-rw");
					siteInfo.setUrl("http://minihp.cyworld.com/pims/main/pims_main.asp?tid="
							+ tid);
					siteInfo.setSiteName("싸이월드");
					storage.siteInfoList.add(siteInfo);

					if (name != null && name.length() != 0) {

						ExtendedStorage.realName = name;

					}
				}

				if (list.get(i).contains("mailto")) {
					String email2 = list.get(i).split(":")[1].replace('"', '!')
							.split("!")[0];
					if (email2 != null && email2.length() != 0) {

						ExtendedStorage.realEmail = email2;

					}
				}

				if (list.get(i).contains("생년월일")) {
					String birthday2 = list.get(i).split(">")[4].split("<")[0];
					if (birthday2 != null && birthday2.length() != 0) {

						ExtendedStorage.realBirthday = birthday2;

					}
				}

				if (list.get(i).contains("미니홈피 주소")) {

					setNickName(list.get(i).split("/")[3]);
					storage.nickNameList.add(getNickName());
				}

				if (list.get(i).contains("swfphotoPath")) {
					setImgUrl(list.get(i).replace('"', '!').split("!")[5]);
					// storage.imgUrlList.add(getImgUrl());
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
