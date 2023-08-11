package com.crfr.service.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service("oImportService")
@RequiredArgsConstructor
public class OrderImportService implements PurchaseService {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String KEY = "2333044406010422";
	public static final String SECRET = "G5jlFvQX7iRnEcM8NoTDPn6Nvay4KypmQwjQdfMUeVIzBn3EkeAqWlqiuFBMutXsK2jJGvSoXZj33Zeu"; 
	
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
        Map<String,String> map =new HashMap<String,String>(); 
        map.put("imp_key", KEY); 
        map.put("imp_secret", SECRET);
        try { post.setEntity(new UrlEncodedFormEntity(convertParameter(map))); 
	        HttpResponse res = client.execute(post); 
	        ObjectMapper mapper = new ObjectMapper(); 
	        String body = EntityUtils.toString(res.getEntity()); 
	        JsonNode rootNode = mapper.readTree(body); 
	        JsonNode resNode = rootNode.get("response"); 
	        result = resNode.get("access_token").asText(); 
	    } catch (Exception e) { 
	        e.printStackTrace(); 
	    }         
		return result;
	}
	
	public int cancelPay(String token, String merchant_uid) {
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
        		
		
        Map<String, String> map = new HashMap<String, String>();
        post.setHeader("Authorization", token);   
        map.put("merchant_uid", merchant_uid);
        
        String temp = "";
        try { 
        	post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
	        HttpResponse res = client.execute(post);
	        ObjectMapper mapper = new ObjectMapper();
	        String enty = EntityUtils.toString(res.getEntity());
	        JsonNode rootNode = mapper.readTree(enty);
	        temp = rootNode.get("response").asText();
	    } catch (Exception e) {
	    	e.printStackTrace(); 
	    }
	    if (temp.equals("null")) {
	    	System.err.println("환불실패"); return -1;		    
		} else { 
	        System.err.println("환불성공"); return 1; 
	    }
	}
	
	//  Http요청 파라미터를 만들어 주는 메서드
    public static List<NameValuePair> convertParameter(Map<String,String> paramMap){
        List<NameValuePair> paramList = new ArrayList<NameValuePair>();
        Set<Map.Entry<String,String>> entries = paramMap.entrySet();
        for(Map.Entry<String,String> entry : entries) {
            paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        } return paramList;
    }	
}
