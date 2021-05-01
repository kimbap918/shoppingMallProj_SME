package com.example.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("unchecked")
public class CommonUtils {
	private static final Logger log = Logger.getLogger(CommonUtils.class);
	
	// 매개채 없는 해싱(암호화)
	// 실행 예시 > String encrypt = getEncrypt(password);
	public static String getEncrypt(String input) {
        String ret = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(input.getBytes());
            byte[] byteData = md.digest();
            
            StringBuffer sb = new StringBuffer();
            
            for (Byte b : byteData) sb.append(Integer.toString((b & 0xFF) + 0x100, 16).substring(1));
            
            ret = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return ret;
    }
	
	// Start Hashing for salt
	
	// 실행 예시 1 > String encrypt = getEncrypt(password, generateSalt());
	// 실행 예시 2 > String encrypt = getEncrypt(password, salt);
	
	public static String getEncrypt(String source, String salt) {
        return getEncrypt(source, salt.getBytes());
    }
	
	public static String getEncrypt(String input, byte[] salt) {
        String ret = null;
        
        byte[] a = input.getBytes();
        byte[] bytes = new byte[a.length + salt.length];
        
        System.arraycopy(a, 0, bytes, 0, a.length);
        System.arraycopy(salt, 0, bytes, a.length, salt.length);
        
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(input.getBytes());
            
            byte[] byteData = md.digest();
            
            StringBuffer sb = new StringBuffer();
            for (Byte b : byteData) 
            	sb.append(Integer.toString((b & 0xFF) + 0x100, 16).substring(1));
            
            ret = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return ret;
    }
	
	public static String generateSalt() {
        Random random = new Random();
        byte[] salt = new byte[8];
        //256개의 임의의 숫자. -128 ~ +127 까지 생성
        random.nextBytes(salt); 
        //System.out.println(Arrays.toString(salt));
        
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < salt.length; i++) {
            // byte 값을 Hex 값으로 바꾸기.
            sb.append(String.format("%02x",salt[i]));
        }
        
        //System.out.println("salt : "+sb.toString());
        return sb.toString();
    }
	
	// End of Hashing for salt
	
	/* Map 출력 */
	public static void printMap(Map<String,Object> map){
		Iterator<Entry<String,Object>> iterator = map.entrySet().iterator();
		Entry<String,Object> entry = null;
		log.debug("--------------------printMap--------------------\n");
		while(iterator.hasNext()){
			entry = iterator.next();
			log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
		}
		log.debug("");
		log.debug("------------------------------------------------\n");
	}

	/* List 출력 */
	public static void printList(List<Map<String,Object>> list){
		Iterator<Entry<String,Object>> iterator = null;
		Entry<String,Object> entry = null;
		log.debug("--------------------printList--------------------\n");
		int listSize = list.size();
		for(int i=0; i<listSize; i++){
			log.debug("list index : "+i);
			iterator = list.get(i).entrySet().iterator();
			while(iterator.hasNext()){
				entry = iterator.next();
				log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
			}
			log.debug("\n");
		}
		log.debug("------------------------------------------------\n");
	}

	public String functionTransition(String s) {
		try {
			// Create MD5 Hash
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.update(s.getBytes());
			byte messageDigest[] = digest.digest();

			// Create Hex String
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < messageDigest.length; i++)
				hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
			return hexString.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* list<map> to json */
	public static JSONArray convertListToJson(List<Map<String, Object>> bankCdList) {
		JSONArray jsonArray = new JSONArray();
		for (Map<String, Object> map : bankCdList) {
			jsonArray.add(convertMapToJson(map));
		}
		return jsonArray;
	}

	/* map to json */
	public static JSONObject convertMapToJson(Map<String, Object> map) {
		JSONObject json = new JSONObject();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			// json.addProperty(key, value);
			json.put(key, value);
		}
		return json;
	}

}
