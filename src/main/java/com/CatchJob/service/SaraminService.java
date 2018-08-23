package com.CatchJob.service ;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.CatchJob.model.News;
import com.CatchJob.model.Saramin;



@Service
public class SaraminService {
	
	public void searchSaramin(String keyword) throws Exception{
		List<Saramin> nList = new ArrayList<Saramin>();    	
    	
		//BufferedReader br = null;
        //DocumentBuilderFactory 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
		DocumentBuilder builder;
        Document doc = null;
		
		StringBuilder urlBuilder = new StringBuilder("http://api.saramin.co.kr/job-search"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("keywords","UTF-8") + "=" + URLEncoder.encode("삼성", "UTF-8")); /*시도(행정자치부 법정동 주소코드 참조)*/
		URL url = new URL(urlBuilder.toString());
		System.out.println(urlBuilder);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String result = "";
		String line;
		while ((line = rd.readLine()) != null) {
			 result = result + line.trim();
		}
		rd.close();
		conn.disconnect();
		System.out.println("서비스: "+result.toString());
		//XML 파싱하기
		 InputSource is = new InputSource(new StringReader(result));
		 builder = factory.newDocumentBuilder();
         doc = builder.parse(is);
		
         XPathFactory xpathFactory = XPathFactory.newInstance();
         XPath xpath = xpathFactory.newXPath();
         
         /* 1. company */
         XPathExpression expr = xpath.compile("//job/company");
         NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
         XPathExpression expr1 = xpath.compile("//job/position");
         NodeList nodeList1 = (NodeList) expr1.evaluate(doc, XPathConstants.NODESET);
         
         for (int i = 0; i < nodeList.getLength(); i++) {
        	 Saramin saramin  = new Saramin();
             NodeList child = nodeList.item(i).getChildNodes();
             NodeList child1 = nodeList1.item(i).getChildNodes();
             
             for (int j = 0; j < child.getLength(); j++) {
//                 System.out.println(i+".---------------");
//                 System.out.println("href:"+child.item(j).getAttributes().getNamedItem("href").getTextContent());
//                 System.out.println("name:"+child.item(j).getTextContent());
                 saramin.setHref(child.item(j).getAttributes().getNamedItem("href").getTextContent());
                 saramin.setName(child.item(j).getTextContent());
                 saramin.setTitle(child1.item(0).getTextContent());
                 saramin.setLocation(child1.item(1).getTextContent());
                 String location = child1.item(1).getTextContent();
                 StringTokenizer st = new StringTokenizer(location, ",");
                 String tempStr = "";
                 ArrayList<String> arr = new ArrayList<String>();
                 while(st.hasMoreTokens()) {
                	 String token = st.nextToken();
                	 StringTokenizer st1 = new StringTokenizer(token, " &gt; ");
                	 String temp2 = st1.nextToken();
                	 
                	 if(!tempStr.equals(temp2)) {
                		 
                		 tempStr = temp2;
                		 arr.add(temp2);
                	 }
                	 
                	 String temp3 = st1.nextToken();
                	 arr.add(temp3);
                 }
                 System.out.println(arr);
                
                 System.out.println("-------------");
                 saramin.setJobType(child1.item(2).getTextContent());
                 saramin.setIndustry(child1.item(3).getTextContent());
                 saramin.setJobCategory(child1.item(4).getTextContent());
                 saramin.setOpenQuantity(child1.item(5).getTextContent());
                 saramin.setExperienceLevel(child1.item(6).getTextContent());
                 saramin.setRequiredEducationLevel(child1.item(7).getTextContent());
//	             for (int j1 = 0; j1 < child1.getLength(); j1++) {
//	                 //Node node = child1.item(j1);
//	                 System.out.println(child1.item(j1).getNodeName()+":"+child1.item(j1).getTextContent());
//	             }             
//                 System.out.println(saramin);
             }
       //      nList.add(nodeMap);
         }
         /* 2. position */
//         for (int i = 0; i < nodeList1.getLength(); i++) {
//        	 Map<String, Object> nodeMap  = new HashMap<String, Object>();
//             
//             
//             for (int j = 0; j < child1.getLength(); j++) {
//                 Node node = child1.item(j);
//                 System.out.println(i+"-"+j+"."+node.getTextContent());
//             }
//             //nList.add(nodeMap);
//            // System.out.println("2. "+nList);
//         }
       //  System.out.println(nList);
//		JSONObject jsonObject = new JSONObject(sb.toString());
//		JSONArray items = jsonObject.getJSONArray("items");
//		System.out.println(items);
		
		//==================================================================================================================================
//	  		JSONObject jsonObject = new JSONObject(sb.toString());
//	  		
//	  		//응답받은 json 객체에서 실제 책 정보를 포함하고 있는 jsonarray 가져오기
//	  		JSONArray items = jsonObject.getJSONArray("items");
//	  		
//	  		for(int i =0;i<items.length();i++) {
//	  			//json array(책 여러권 정보) 반복하면서 한권의 데이터 꺼내오기 
//	  			JSONObject item = items.getJSONObject(i);
//	  			Book book = new Book();
//	  			book.setTitle(item.getString("title"));
//	  			book.setAuthor(item.getString("author"));
//	  			book.setDescription(item.getString("description"));
//	  			book.setDiscount(item.getInt("discount"));
//	  			book.setImage(item.getString("image"));
//	  			book.setIsbn(item.getString("isbn"));
//	  			book.setLink(item.getString("link"));
//	  			book.setPrice(item.getInt("price"));
//	  			book.setPubdate(item.getString("pubdate"));
//	  			book.setPublisher(item.getString("publisher"));
//	  			
//	  			bookList.add(book);
//	  		}
//	  		
//	  		System.out.println("검색 도서 목록 : " + bookList)
//	    
//	    
	}
	        
}
