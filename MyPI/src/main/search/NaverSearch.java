package main.search;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class NaverSearch {
	private static final String naver = "http://openapi.naver.com/search?";
	private static final String key = "key=e9f2af290088b3d1d298ced9a41c4263";
	private ArrayList<SearchResult> result = new ArrayList<SearchResult>();
	private String query;
	private String category;
	private int limit;
	private String searchPage;

	public NaverSearch(String query, int limit, String category) {
		this.query = query;
		this.limit = limit;
		this.category = category;
	}

	public ArrayList<SearchResult> getResult() {
		// Initialize
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		InputStream is;
		Document document = null;
		try {
			builder = factory.newDocumentBuilder();
			is = new ByteArrayInputStream(getXMLResult().getBytes("UTF-8"));
			document = builder.parse(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.getDocumentElement().normalize();

		// Get Data
		Element root = document.getDocumentElement();
		NodeList list = root.getElementsByTagName("item");

		// Make SearchResult ArrayList
		for (int i = 0; i < list.getLength(); i++) {
			Node node = list.item(i);
			Element element = (Element) node;

			String title = null;
			String url = null;
			String snippet = null;
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				url = element.getElementsByTagName("link").item(0)
						.getTextContent();
				title = element.getElementsByTagName("title").item(0)
						.getTextContent();
				title = title.replaceAll(
						"<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");

				snippet = element.getElementsByTagName("description").item(0)
						.getTextContent();
			}
			int resultNumber = i + 1;

			SearchResult searchResult = new SearchResult("Naver", title,
					urlConversion(url), snippet, searchPage, resultNumber);

			result.add(searchResult);
		}

		return result;
	}

	// url 변환
	public String urlConversion(String originURL) {
		URL url = null;
		try {
			url = new URL(originURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.addRequestProperty("User-Agent", "Mozilla/4.0");
			con.setConnectTimeout(5000);
			con.setReadTimeout(3000);

			InputStream is = con.getInputStream();
			url = con.getURL();
			is.close();

		} catch (Exception e) {

			e.printStackTrace();

		}
		return url.toString();
	}

	private String buildSearchUrl() {
		// Required parameters
		StringBuilder request = new StringBuilder(naver);
		request.append(key);
		request.append("&query=" + query.split("_")[0]);
		request.append("&ie=UTF-8");

		request.append("&target=" + category); // category 조정
		request.append("&display=" + limit); // 결과값 제한 조정

		System.out.println("네이버API XML 주소 : " + request);

		searchPage = request.toString();
		System.out.println("네이버 searchPage : " + searchPage);
		return request.toString();
	}

	private String getXMLResult() {
		HttpURLConnection conn = null;
		StringBuffer readBuffer = new StringBuffer();

		try {
			// Build Query
			URL url = new URL(buildSearchUrl());
			// 연결
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/xml");
			// 읽기
			InputStreamReader isr = new InputStreamReader(
					conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			// 결과저장
			String read;
			while ((read = br.readLine()) != null) {
				readBuffer.append(read);
			}
			// 닫기
			br.close();
			isr.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		return readBuffer.toString();
	}
}
