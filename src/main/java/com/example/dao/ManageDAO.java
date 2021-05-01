package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
//기록저장소 
@Repository("ManageDAO") 
@SuppressWarnings("unchecked")
public class ManageDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	
	//관리자 페이지 유저목록 보기
	public List<Map<String, Object>> userList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("manage.userList", map);}  
	
	public int updateUser(Map<String, Object> map) { 
		return (Integer) update("manage.updateUser", map);} 
	
	public int deleteUser(Map<String, Object> map){ 
		return (Integer) delete("manage.deleteUser", map);} 
	//관리자 페이지 물품목록 보기
	public List<Map<String, Object>> productList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("manage.productList", map);} 
		
	public int deleteProduct(Map<String, Object> map){ 
		return (Integer) delete("manage.deleteProduct", map);}
	//관리자 페이지 주문목록 보기
	public List<Map<String, Object>> orderList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("manage.orderList", map);} 
	
	public int updateOrder(Map<String, Object> map) { 
		return (Integer) update("manage.updateOrder", map);} 
	
	public int deleteOrder(Map<String, Object> map){ 
		return (Integer) delete("manage.deleteOrder", map);}
	
	public int updateMember(Map<String, Object> map) {
		return (Integer) update("common.updateMember", map);
	} 
}