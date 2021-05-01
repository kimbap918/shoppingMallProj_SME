package com.example.service;

import java.util.*;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.ManageDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("ManageService")
public class ManageService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ManageDAO")
	private ManageDAO ManageDAO;
	
	//관리자 유저목록 페이지
	public List<Map<String, Object>> userList(Map<String, Object> map) 
	{ 
		return ManageDAO.userList(map);} 
	
	public int updateUser(Map<String, Object> map)
	{ 
		return ManageDAO.updateUser(map);} 
	
	public int deleteUser(Map<String, Object> map)
	{ 
		return ManageDAO.deleteUser(map);} 
	
	//관리자 물품목록
	public List<Map<String, Object>> productList(Map<String, Object> map) 
	{ 
		return ManageDAO.productList(map);} 
	
	public int deleteProduct(Map<String, Object> map)
	{ 
		return ManageDAO.deleteProduct(map);} 
	
	//관리자 주문목록
	public List<Map<String, Object>> orderList(Map<String, Object> map) 
	{ 
		return ManageDAO.orderList(map);} 
	
	public int updateOrder(Map<String, Object> map)
	{ 
		return ManageDAO.updateOrder(map);} 
	
	public int deleteOrder(Map<String, Object> map)
	{ 
		return ManageDAO.deleteOrder(map);} 
	//회원 정보 수정
	public int updateMember(Map<String, Object> map){
		return ManageDAO.updateMember(map);
	}

}