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

public class DaumSearch {
	private static final String daum = "http://apis.daum.net/search/";
	private static final String key = "&apikey=d3e3b817ed7f274dc721bda8eb9bdd1e8d6eeac7";
	private ArrayList<SearchResult> result = new ArrayList<SearchResult>();
	private String query;
	private String category;
	private String searchPage;
	private int limit;

	public DaumSearch(String query, int limit, String category) {
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

			SearchResult searchResult = new SearchResult("Daum", title, url,
					snippet, searchPage, resultNumber);
			result.add(searchResult);
		}

		return result;
	}

	private String buildSearchUrl() {
		// Required parameters
		StringBuilder request = new StringBuilder(daum);
		request.append(category + "?");
		request.append("q=" + query);
		request.append(key);

		// Optional parameters
		request.append("&result=" + limit);

		System.out.println("다음API XML 주소 : " + request);

		searchPage = request.toString();

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
