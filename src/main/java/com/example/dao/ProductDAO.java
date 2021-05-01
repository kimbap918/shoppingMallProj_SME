package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
//기록저장소 
@Repository("ProductDAO") 
@SuppressWarnings("unchecked")
public class ProductDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 상품 자세히 보기
	 */
	public List<Map<String, Object>> detailPage(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.detailPage", map);
	}
	
	/*
	 * 상품테이블 호출
	 */
	public List<Map<String, Object>> getList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.getList", map);
	} 
	
	/*
	 * 장바구니
	 */
	public List<Map<String, Object>> addcart(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.addcart", map);
	}
	
	/*
	 * 구매페이지
	 */
	public List<Map<String, Object>> checkcart(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.checkcart", map);
	}

	/*
	 * 장바구니삭제
	 */
	public int deletecart(Map<String, Object> map) {
		return (Integer) delete("product.deletecart", map);
	}

	/*
	 * 선택한 물건 결제
	 */
	public List<Map<String, Object>> order(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.order", map);
	}

	/*
	 * 장바구니호출
	 */	
	public List<Map<String, Object>> resultcart(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.resultcart", map);
	}

	/*
	 * 장바구니추가 아작스
	 */
	public int cart(Map<String, Object> map) {
		return (Integer) insert ("product.cart", map);
	}

	/*
	 * 주문번호로 배송조회
	 */
	public List<Map<String, Object>> myitem(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.myitem", map);
	}

	/*
	 * 장바구니유효성
	 */
	public List<Map<String, Object>> cartcheck(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("product.cartcheck", map);
	}
}