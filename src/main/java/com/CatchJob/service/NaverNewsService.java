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

@Service
public class NaverNewsService {
	
	//clientID:B6T6LLj5_TTgOXd1wlgN
	//client secret : b2ZjsJWAg6
	private static final String CLIENT_ID = "B6T6LLj5_TTgOXd1wlgN";
	private static final String CLIENT_Secret = "b2ZjsJWAg6";
	
	//네이버에 검색어 전달해서 결과 받아옴
	//결과(json)를 파싱해서 내가 원하는 모양으로 바꿈..
	//내가 원하는 모양 : 책 정보가 여러 개 들어있는 모양
	// List<Book>
	
	public void searchNews(String keyword) throws Exception{
		
		
		
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+encodedKeyword;
		
		//요청시에, client id 와 secret을 같이 넘겨주어야 한다. 
		URL url = new URL(apiURL);
		
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		
		connection.setRequestMethod("GET");
		connection.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
		connection.setRequestProperty("X-Naver-Client-Secret", CLIENT_Secret);
		
		int responseCode = connection.getResponseCode();
		
		BufferedReader br = null;
		
		if(responseCode == 200) {
			//정상호출
			//정상적으로 호출되었으면 데이터가 있다. >> 데이터를 받아와서 가공
			//데이터의 형태는 json형태의 문자열 
			// "{'title': ~~}"
			br = new BufferedReader(new InputStreamReader( connection.getInputStream() ));
		}else {
			//예외발생
			br = new BufferedReader(new InputStreamReader( connection.getErrorStream() ));
		}
		
		String inputLine = null;
		
		StringBuilder sb = new StringBuilder();
		
		while( (inputLine = br.readLine()) != null ) {
			//버퍼에서 읽어온 문자열을 계속 연결 
			sb.append(inputLine);
		}
		br.close();
		
		System.out.println("네이버가 응답한 데이터 뉴스 : "+sb.toString());

//		
//		JSONObject jsonObject = new JSONObject(sb.toString());
//		
//		JSONArray items = jsonObject.getJSONArray("items");
//		System.out.println("items:  "+items);

		
	}

}
*/