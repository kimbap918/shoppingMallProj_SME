package com.example.service;

import java.util.*;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.CommonDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("commonService")
public class CommonService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	public List<Map<String, Object >> search(Map<String, Object> map){ 
		  
		return commonDAO.search(map);
	}

	public Map<String, Object > loginCheck(Map<String, Object> map)
	{ 
		return commonDAO.loginCheck(map);} //회원 로그인 체크
	
	public int joinCheck(Map<String, Object> map)
	{ 
		return commonDAO.joinCheck(map);}
	
	//아이디 중복체크
	public int idcheck(String id) {
	      return commonDAO.idcheck(id);
	}
		
}