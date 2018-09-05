package com.CatchJob.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.CatchJob.model.News;

@Service
public class NaverNewsService {

	private static final String CLIENT_ID = "B6T6LLj5_TTgOXd1wlgN";
	private static final String CLIENT_Secret = "b2ZjsJWAg6";
	//네이버 뉴스 api 
	public List<News> searchNews(String keyword) throws Exception {
		List<News> newsList = new ArrayList<News>();
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8"); 
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + encodedKeyword;
		URL url = new URL(apiURL);
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
		connection.setRequestProperty("X-Naver-Client-Secret", CLIENT_Secret);
		int responseCode = connection.getResponseCode();
		BufferedReader br = null;
		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		} else {
			// 예외발생
			br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
		}
		String inputLine = null;
		StringBuilder sb = new StringBuilder();
		
		while ((inputLine = br.readLine()) != null) {
			sb.append(inputLine);
		}
		br.close();
		
		JSONObject jsonObject = new JSONObject(sb.toString());
		if(jsonObject.has("errorCode")) { 
			if(jsonObject.get("errorCode").equals("080")) {
				return null;
			}
		}else{
			JSONArray items = jsonObject.getJSONArray("items");
			
			for (int i = 0; i < items.length(); i++) {
				JSONObject item = items.getJSONObject(i);
				News news = new News();
				news.setDescription(item.getString("description"));
				news.setLink(item.getString("link"));
				news.setOriginallink(item.getString("originallink"));
				String pubDate = item.getString("pubDate");
				pubDate = (pubDate.substring(5, 16)).replaceAll(" ", "");
				String month = pubDate.substring(2, 5);
				switch (month) {
				case "Jan": month = "01";	break;
				case "Feb": month = "02";	break;
				case "Mar": month = "03";	break;
				case "Apr": month = "04";	break;
				case "May": month = "05";	break;
				case "Jun": month = "06";	break;
				case "Jul": month = "07";	break;
				case "Aug": month = "08";	break;
				case "Sep": month = "09";	break;
				case "Oct": month = "10";	break;
				case "Nov": month = "11";	break;
				case "Dec": month = "12";	break;
				}
				String standardDate = pubDate.substring(5,9)+"-"+month+"-"+pubDate.substring(0, 2);
				news.setPubDate(standardDate);
				news.setTitle(item.getString("title"));
				newsList.add(news);
			}
		}
		
		return newsList;
	}
}
