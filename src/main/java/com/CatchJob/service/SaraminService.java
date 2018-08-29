package com.CatchJob.service ;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.CatchJob.model.Saramin;



@Service
public class SaraminService {
	
	public List<Saramin> searchSaramin(String keywords) throws Exception{
		List<Saramin> saraminList = new ArrayList<Saramin>();    	
		System.out.println("---------------------------------svs----------------------------------------------------");
		//BufferedReader br = null;
        //DocumentBuilderFactory 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
		DocumentBuilder builder;
        Document doc = null;
		
		StringBuilder urlBuilder = new StringBuilder("http://api.saramin.co.kr/job-search"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("keywords","UTF-8") + "=" + URLEncoder.encode(keywords, "UTF-8")); /* 키워드*/
		urlBuilder.append("&" + URLEncoder.encode("count","UTF-8") + "=" + URLEncoder.encode("6", "UTF-8")); /* 키워드*/
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
         XPathExpression expr2 = xpath.compile("//job/expiration-timestamp");
         NodeList nodeList2 = (NodeList) expr2.evaluate(doc, XPathConstants.NODESET);
         XPathExpression expr3 = xpath.compile("//job/url");
         NodeList nodeList3 = (NodeList) expr3.evaluate(doc, XPathConstants.NODESET);
        
         try {
        	 
         }catch(NullPointerException e){
        	 System.out.println("error 입니다....");
         }
         for (int i = 0; i < nodeList.getLength(); i++) {
        	 Saramin saramin  = new Saramin();
             NodeList child = nodeList.item(i).getChildNodes();
             NodeList child1 = nodeList1.item(i).getChildNodes();
             NodeList child2 = nodeList2.item(i).getChildNodes();
             NodeList child3 = nodeList3.item(i).getChildNodes();
             for (int j = 0; j < child.getLength(); j++) {
//                 System.out.println(i+".---------------");
//                 System.out.println("href:"+child.item(j).getAttributes().getNamedItem("href").getTextContent());
//                 System.out.println("name:"+child.item(j).getTextContent());
            	 
            	 long time = Integer.parseInt(child2.item(j).getTextContent());
            	 long unixTime = time * 1000;
                 
                 Date date = new Date(unixTime);
                 String expirationTimestamp = date.toString();
                 
                 String month = expirationTimestamp.substring(4, 7);
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
	     		 String dayOfWeek = expirationTimestamp.substring(0, 3);
                 switch(dayOfWeek) {
	                 case "Mon": dayOfWeek = "월";	break;
	                 case "Tue": dayOfWeek = "화";	break;
	                 case "Wed": dayOfWeek = "수";	break;
	                 case "Thu": dayOfWeek = "목";	break;
	                 case "Fri": dayOfWeek = "금";	break;
	                 case "Sat": dayOfWeek = "토";	break;
	                 case "Sun": dayOfWeek = "일";	break;
                 }
                 
                 expirationTimestamp ="~"+ month+"/"+expirationTimestamp.substring(8, 10)+" ("+dayOfWeek+")";
                 System.out.println("expirationTimestamp: "+expirationTimestamp);
                 
                 saramin.setExpirationTimestamp(expirationTimestamp);
            	 
            	 
            	 
            	 
                 saramin.setHref(child.item(j).getAttributes().getNamedItem("href").getTextContent());
                 saramin.setName(child.item(j).getTextContent());                 
                 
                 saramin.setTitle(child1.item(0).getTextContent());
                
                 String location = child1.item(1).getTextContent();
                 StringTokenizer st = new StringTokenizer(location, ",");
                 String tempStr = "";
                 ArrayList<String> arr = new ArrayList<String>();
                 
                 String strLocation = "";
                 while(st.hasMoreTokens()) {
                	 String token = st.nextToken();
                	 //System.out.println("token: "+token);
                	 StringTokenizer st1 = new StringTokenizer(token, "&gt;");
                	 
                	 if(st1.hasMoreTokens()) {
                		 
                		 String str1 = st1.nextToken().trim();
                		 if(st1.hasMoreTokens()) {
                			 
                			 String str2 = st1.nextToken().trim();
                			 if(!str1.equals(tempStr)) {
                				 tempStr = str1;
                				 //arr.add(temp2);
                				 strLocation = strLocation+str1+" > ";
                			 }
                			 strLocation = strLocation+str2+", ";                		 
                		 }
                	 }
                	 
//                	 if(st1.hasMoreTokens()) {
//                		 String st2 = st1.nextToken();
//                		 arr.add(st2);
//                		 strLocation = strLocation+st2+",";                		 
//                	 }
                	 //System.out.println("token2: "+token2);
                	 /* 경기 */
//                	 if(!tempStr.equals(temp2)) {
//                		 tempStr = temp2;
//                		 arr.add(temp2);
//                		 strLocation = strLocation+temp2+">";
//                	 }
                	 /* 고양시 */ //전체 일 경우 값이 예외 발생해서, 조건문으로 줌.
//                	 if(st1.hasMoreTokens()) {
//                		 String st2 = st1.nextToken();
//                		 arr.add(st2);
//                		 strLocation = strLocation+st2+",";                		 
//                	
//                	 }
                	 //System.out.println("str1: "+str1);                	 
                	 //System.out.println("str2: "+str2);
                 }
                // System.out.println("arr: "+arr);
                // System.out.println("strLocation: "+strLocation);
                 strLocation = strLocation.substring(0, strLocation.length()-2);
                 saramin.setLocation(strLocation);
               //  System.out.println("strLocation: "+strLocation);
                 
                 saramin.setJobType(child1.item(2).getTextContent());
                 saramin.setIndustry(child1.item(3).getTextContent());
                 saramin.setJobCategory(child1.item(4).getTextContent());
                 saramin.setOpenQuantity(child1.item(5).getTextContent());
                 saramin.setExperienceLevel(child1.item(6).getTextContent());
                 saramin.setRequiredEducationLevel(child1.item(7).getTextContent());
                 
                 saramin.setUrl(child3.item(j).getTextContent());
//	             for (int j1 = 0; j1 < child1.getLength(); j1++) {
//	                 //Node node = child1.item(j1);
//	                 System.out.println(child1.item(j1).getNodeName()+":"+child1.item(j1).getTextContent());
//	             }             
                 System.out.println(saramin);
                 System.out.println("-------------");
                 saraminList.add(saramin);
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
         return saraminList;
	}
	        
}
