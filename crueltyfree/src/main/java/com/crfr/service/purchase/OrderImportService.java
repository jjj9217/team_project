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
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.crfr.vo.CertificationsVo;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service("oImportService")
@RequiredArgsConstructor
public class OrderImportService implements PurchaseService {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_CERTIFICATION_URL = "https://api.iamport.kr/certifications/";
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
	
	public Map<String, String> getInfo(String token, String mId) {//mId는 인증시 id
		String name = "";
		String gender = "";
		String birth = "";
		String birthday = "";
		String unique_key = "";
		String phone = "";
		
		HttpClient client = HttpClientBuilder.create().build(); 
        HttpGet get = new HttpGet(IMPORT_CERTIFICATION_URL + mId); 
        get.setHeader("Authorization", token); 
        try { 
            HttpResponse res = client.execute(get);
            ObjectMapper mapper = new ObjectMapper(); 
            String body = EntityUtils.toString(res.getEntity()); 
            JsonNode rootNode = mapper.readTree(body); 
            JsonNode resNode = rootNode.get("response"); 
            name = resNode.get("name").asText(); 
            gender = resNode.get("gender").asText(); 
            birth = resNode.get("birth").asText(); 
            birthday = resNode.get("birthday").asText(); 
            unique_key = resNode.get("unique_key").asText(); 
            phone = resNode.get("phone").asText();   
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        
        System.out.println("name: "+name);
        System.out.println("gender: "+gender);
        System.out.println("birth: "+birth);
        System.out.println("birthday: "+birthday);
        System.out.println("unique_key: "+unique_key);
        System.out.println("phone: "+phone);
        
        String modifiedDate = birthday.replace("-", "");
        
        Map<String, String> result = new HashMap<String, String>();
        result.put("name", name);
        result.put("gender", gender);
        result.put("birth", birth);
        result.put("birthday", modifiedDate);
        result.put("unique_key", unique_key);
        result.put("phone", phone);
        return result;
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
