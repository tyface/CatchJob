/*package com.CatchJob.service;


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
	
	public List<News> searchNews(String keyword) throws Exception{
		List<News> newsList = new ArrayList<News>();
		
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+encodedKeyword;
		
		URL url = new URL(apiURL);
		
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		
		connection.setRequestMethod("GET");
		connection.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
		connection.setRequestProperty("X-Naver-Client-Secret", CLIENT_Secret);
		
		int responseCode = connection.getResponseCode();
		
		BufferedReader br = null;
		
		if(responseCode == 200) {
			br = new BufferedReader(new InputStreamReader( connection.getInputStream() ));
		}else {
			//예외발생
			br = new BufferedReader(new InputStreamReader( connection.getErrorStream() ));
		}
		
		String inputLine = null;
		
		StringBuilder sb = new StringBuilder();
		
		while( (inputLine = br.readLine()) != null ) {
			sb.append(inputLine);
		}
		br.close();
		System.out.println("네이버가 응답한 데이터 뉴스 : "+sb.toString());
		JSONObject jsonObject = new JSONObject(sb.toString());
		JSONArray items = jsonObject.getJSONArray("items");
		System.out.println(items);
		
		for(int i =0;i<items.length();i++) {
			JSONObject item = items.getJSONObject(i);
			News news = new News();
			news.setDescription(item.getString("description"));
			news.setLink(item.getString("link"));
			news.setOriginallink(item.getString("originallink"));
			news.setPubDate(item.getString("pubDate"));
			news.setTitle(item.getString("title"));
			
			newsList.add(news);
		}
		for(News news : newsList) {
			System.out.println(news);
		}
		
		return newsList;
		
	}
	
	

}
*/