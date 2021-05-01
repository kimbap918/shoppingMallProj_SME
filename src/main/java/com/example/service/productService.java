package com.example.service;

import java.util.*;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.ProductDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("productService")
public class productService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ProductDAO")
	private ProductDAO productDAO;
	
	/*
	 * 제품 상세보기
	 */
	public List<Map<String, Object >> detailPage(Map<String, Object> map) {
		 return productDAO.detailPage(map); 
	 }

	 /*
	  * 메인에 제품 내용 뿌리기
	  */
	public List<Map<String, Object >> getList(Map<String, Object> map){ 
		return productDAO.getList(map);
	}
		
	/*
	 * 장바구니에 하나 넣기
	 */
	public List<Map<String, Object >> addcart(Map<String, Object> map){ 
		return productDAO.addcart(map);
	}

	/*
	 * 구매페이지
	 */
	public List<Map<String, Object >> checkcart(Map<String, Object> map){ 
		return productDAO.checkcart(map);
	}
	
	/*
	 * 결제페이지
	 */
	public List<Map<String, Object >> order(Map<String, Object> map){ 
		return productDAO.order(map);
	}
		
	/*
	 * 장바구니 페이지
	 */ 
	public List<Map<String, Object >> resultcart(Map<String, Object> map){ 
		return productDAO.resultcart(map);
	}

	/*
	 * 장바구니삭제
	 */
	public int deletecart(Map<String, Object> map){ 
		return productDAO.deletecart(map);
	}

	/*
	 * 장바구니 아작스
	 */
	public int cart(Map<String, Object>map){
		return	productDAO.cart(map);
	}
	
	/*
	 * 주문번호로 배송조회
	 */
	public List<Map<String, Object >> myitem(Map<String, Object> map){ 
		return productDAO.myitem(map);
	}

	/*
	 * 유효성
	 */
	public List<Map<String, Object >> cartcheck(Map<String, Object> map){ 
		return productDAO.cartcheck(map);
	}
	
}