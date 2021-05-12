package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
//import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//import com.example.service.CommonService;
import com.example.service.productService;

@Controller
@RestController
public class ProductController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "productService")
	productService productService = new productService();

	/*
	 * 메인페이지 제품페이지랑 연결됨
	 */
	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/main");

		List<Map<String, Object>> list = productService.getList(null);
		mv.addObject("list", list);
		mv.addObject("map", map);

		System.out.println("list출력" + list);
		System.out.println("map출력" + map);

		return mv;
	}

	/*
	 * 제품관련 맵핑 시작 
	 * 제품 상세페이지 String product_code는 where절에 넣기 위해서 생성
	 */
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public ModelAndView product(@RequestParam Map<String, Object> map,
			@RequestParam("product_code") String product_code) {
		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/detail");

		System.out.println("test" + product_code);

		List<Map<String, Object>> get = productService.detailPage(map);
		mv.addObject("get", get);
		mv.addObject("map", map);

		System.out.println("list출력" + get);
		System.out.println("map출력" + map);

		return mv;
	}

	/*
	 * 장바구니에 바로 추가 후 페이지 전환 용
	 * 만든이유는 장바구니페이지로 바로들어가는 것도
	 * 같이 이용하기 위해서 암튼 그럼
	 */
	@RequestMapping(value = "addcart.do", method = RequestMethod.POST)
	public ModelAndView addcart(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("redirect:/resultcart.do");

		List<Map<String, Object>> cart = productService.cartcheck(map);
		System.out.println("cart출력" + cart);
		List<Map<String, Object>> addcart = productService.addcart(map);
		
		System.out.println("addcart출력" + addcart);
		mv.addObject("addcart", addcart);
		return mv;
	}

	/*
	 * 장바구니유효성
	 */
	@RequestMapping(value = "cartcheck.do", method = RequestMethod.POST)
	public ModelAndView cartcheck(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("redirect:/addcart.do");

		List<Map<String, Object>> hi = productService.cartcheck(map);

		System.out.println("테스트 출력 : " + hi);
		mv.addObject("테스트 출력 : ", hi);
		return mv;
	}
	
	
	/*
	 * 장바구니담기 아작수
	 */
	@ResponseBody
	@RequestMapping(value = "/cartAjax.do", method = RequestMethod.POST)
	public HashMap<String, Object> cartAjax(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter " + map); // 콘솔 로그 출력

		//JSONObject jobj = new JSONObject();
		HashMap<String,Object> jobj = new HashMap<String,Object>();
		jobj.put("code", 400);

		int cnt = productService.cart(map);

		log.info("cnt : " + cnt);
		if (cnt > 0) {
			jobj.put("code", 200);
		}
		return jobj;
	}

	/*
	 * 장바구니 삭제기능
	 */
	@RequestMapping(value = "delcart.do", method = RequestMethod.GET)
	public ModelAndView delcart(@RequestParam Map<String, Object> map, HttpSession session) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("redirect:/resultcart.do");

		Map<?, ?> info = (Map<?, ?>) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") != null) {
			map.put("table", "shop_db.customer_cart");
		} else {
			map.put("table", "shop_db.noncustomer_cartt");
		}
		int cart = productService.deletecart(map);

		mv.addObject("cart", cart);
		System.out.println("cart출력 : " + cart);
		System.out.println("info출력 : " + info);
		return mv;
	}

	/*
	 * 장바구니페이지
	 */
	@RequestMapping(value = "resultcart.do", method = RequestMethod.GET)
	public ModelAndView cartlist(@RequestParam Map<String, Object> map, HttpSession session) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/resultcart");

		Map<?, ?> info = (Map<?, ?>) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") != null) {
			map.put("table", "shop_db.customer_cart");
			map.put("id", info.get("id"));
		} else {
			map.put("table", "shop_db.noncustomer_cart");
			map.put("id", session.getId());
		}

		List<Map<String, Object>> list = productService.resultcart(map);
		mv.addObject("list", list);
		mv.addObject("map", map);

		System.out.println("resultcart출력" + list);
		System.out.println("map출력" + map);

		return mv;
	}

	/*
	 * 결제페이지
	 */

	@RequestMapping(value = "order.do", method = RequestMethod.POST)
	public ModelAndView order(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/order");
		List<String> box = Arrays.asList(req.getParameterValues("box"));
		log.debug(box);
		map.put("box", box);
		List<Map<String, Object>> list = productService.checkcart(map);
		mv.addObject("list", list);

		System.out.println("확인용 : " + list);

		return mv;
	}

	/*
	 * 
	 * 1. parametervalues 를 이용해서 code pr size color qty price [필요한거만] 변수에 담는다. <-
	 * CLEAR 2. 반복문을 돌리면서 [어차피 저 요소들의 배열 길이는 똑같음] list.add해준다. <- CLEAR 3. list 를
	 * map에 넣어준다. <- CLEAR 4. 결제처리하는 service함수에다가 map을 넣어준다. <- CLEAR 5. sql문을 짠다 <-
	 * CLEAR
	 * 
	 * 2021-1-31 name부분 수정
	 */
	@RequestMapping(value = "bill.do", method = RequestMethod.POST)
	public ModelAndView bill(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/bill");

		// 1번
		String[] prodCode = req.getParameterValues("prodCode");
		String[] prodName = req.getParameterValues("prodName");
		String[] size = req.getParameterValues("size");
		String[] color = req.getParameterValues("color");
		String[] qty = req.getParameterValues("qty");
		String[] price = req.getParameterValues("price");

		// 2번
		List<Map<String, Object>> carts = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < price.length; i++) {
			Map<String, Object> columns = new HashMap<String, Object>();
			columns.put("prodCode", prodCode[i]);
			columns.put("prodName", prodName[i]);
			columns.put("size", size[i]);
			columns.put("color", color[i]);
			columns.put("qty", qty[i]);
			columns.put("price", price[i]);
			carts.add(columns);
		}

		// 3번
		map.put("carts", carts);
		/*
		 * log.debug(check); System.out.println("확인용! " +check); map.put("check",
		 * check);
		 */
		List<Map<String, Object>> list = productService.order(map);
		mv.addObject("list", list);

		System.out.println("확인용 : " + list);

		return mv;
	}

	/*
	 * 구매란확인
	 */
	@RequestMapping(value = "checkgoods.do", method = RequestMethod.GET)
	public ModelAndView checkgoods(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/checkgoods");

		return mv;
	}

	/*
	 * 주문번호로 상태조회
	 */
	@RequestMapping(value = "myitem.do", method = RequestMethod.POST)
	public ModelAndView myitem(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/myitem");

		List<Map<String, Object>> list = productService.myitem(map);
		mv.addObject("list", list);
		mv.addObject("map", map);

		System.out.println("list출력" + list);
		System.out.println("map출력" + map);

		return mv;
	}

}