package main.search;

import java.util.ArrayList;
import java.util.HashMap;

import main.extending.form.ExtendedStorage;
import main.logon.LogonDBBean;
import main.logon.LogonDataBean;

public class SearchDic {

	String memberEmail = "";
	ExtendedStorage storage;

	public SearchDic(String memberEmail) {
		this.memberEmail = memberEmail;
		storage = null;
	}

	private static ArrayList<String> searchWordList;

	public static ArrayList<String> getSearchWordList() {

		if (searchWordList == null) {
			searchWordList = new ArrayList<String>();
		}

		return searchWordList;
	}

	private static String imgSearchWord;

	public static String getImgSearchWord() {

		return imgSearchWord;
	}

	public void setImgSearchWord(String imgSearchWord) {
		this.imgSearchWord = imgSearchWord;
	}

	// generate searchword dictionary
	public void bindingWord(HashMap<String, String> map) {
		searchWordList = null;
		imgSearchWord = "";

		ArrayList<String> singleWord = new ArrayList<String>();
		ArrayList<String> complexWord = new ArrayList<String>();
		int singleGrammar;
		int complexGrammar;

		String[] singleBinding = { "\"" + map.get("id") + "\"",
				"\"" + map.get("email") + "\"",
				"\"" + map.get("homephone") + "\"",
				"\"" + map.get("cellphone") + "\"",
				"\"" + map.get("address") + "\"" };

		String[] complexBinding = {
				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("cellphone") + "\"",
				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("school") + "\"",

				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("workplace") + "\"",

				"\"" + map.get("name") + "\"" + "+AND+" + "\""
						+ map.get("email") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("email2") + "\"",
				"\"" + map.get("name") + "\"" + "+AND+" + "\"" + map.get("id")
						+ "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\"" + map.get("email")
						+ "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("email2") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname1") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname2") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname3") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname4") + "\"",
				"\"" + map.get("id") + "\"" + "+AND+" + "\""
						+ map.get("nickname5") + "\""

		};

		if ((!map.get("name").equals("null"))
				&& (!map.get("occupation").equals("null"))) {
			setImgSearchWord("\"" + map.get("name") + "\"" + "+"
					+ map.get("workplace") + "+OR+" + map.get("school"));
		}

		else {
			setImgSearchWord("\"" + map.get("email") + "\"");
		}

		singleGrammar = singleBinding.length;
		for (int i = 0; i < singleGrammar; i++) {
			singleWord.add(singleBinding[i]);
		}

		for (int i = 0; i < singleWord.size(); i++) {

			getSearchWordList().add(removeNull(singleWord).get(i));
			System.out.println(getSearchWordList().size());

		}

		complexGrammar = complexBinding.length;
		for (int i = 0; i < complexGrammar; i++) {
			complexWord.add(complexBinding[i]);
		}

		getSearchWordList().addAll(removeNull(complexWord));

	}

	public ArrayList<String> removeNull(ArrayList<String> list) {

		int size = list.size();

		for (int i = 0; i < size; i++) {

			if (list.get(i).contains("null")) {

				list.remove(i);
				i--;
				size--;

			}
		}
		return list;
	}

}
