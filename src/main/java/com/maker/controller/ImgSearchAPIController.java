package com.maker.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

@Component
public class ImgSearchAPIController {
	
	public static String result(String txt) {
		String clientId = "PwtkZjgBVzDGv4ELfT3C";
	    String clientSecret = "mnQW7YQUmB";
	    String text = null;
	    try {
	    	text = URLEncoder.encode(txt, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        throw new RuntimeException("검색어 인코딩 실패",e);
	    }
	    try {
	    	String apiURL = "https://openapi.naver.com/v1/search/image.json?query=" + text;

		    Map<String, String> requestHeaders = new HashMap<>();
		    requestHeaders.put("X-Naver-Client-Id", clientId);
		    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		    JSONObject responseBody = get(apiURL,requestHeaders);
		    if(responseBody != null) {
		    	JSONArray arrayList = (JSONArray) responseBody.get("items");
			    if(arrayList.size() != 0 ) {
			    	JSONObject resultList = (JSONObject) arrayList.get(0);
			    	String imgLink = (String) resultList.get("thumbnail");
				    System.out.println("썸네일 호출");
				    return imgLink;
			    } else {
			    	System.out.println("호출할 썸네일이 없음");
				    return "";
			    }
		    } else {
		    	System.out.println("호출할 responsebody가 없음");
		    	return "";
		    }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	return "";
	    }
	    
	    
	    
	}


	private static JSONObject get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }

	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	            try {
	            	System.out.println("JSON 호출");
					return (JSONObject) new JSONParser().parse(readBody(con.getInputStream()).toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        } else { // 오류 발생
//	            try {
	            	System.out.println("JSON 호출 중 오류 발생");
					return null;
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청과 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
	    System.out.println("JSON 호출 실패");
		return null;
	}

	private static HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}

	private static StringBuilder readBody(InputStream body){
	    InputStreamReader streamReader = null;
		try {
			streamReader = new InputStreamReader(body, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			throw new RuntimeException("StreamReader 응답을 읽는 데 실패했습니다.", e1);
		}

	    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	        StringBuilder responseBody = new StringBuilder();

	       
	        while (lineReader.ready()) {
	            responseBody.append(lineReader.readLine());
	        }

	        return responseBody;
	    } catch (IOException e) {
	        throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	    }
	}
}