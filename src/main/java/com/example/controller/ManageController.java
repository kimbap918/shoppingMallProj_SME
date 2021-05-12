package com.example.controller;

import java.util.HashMap;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

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

import com.example.service.ManageService;
//import com.example.service.productService;

@Controller
@RestController
public class ManageController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ManageService")
	ManageService manageService = new ManageService();

	@RequestMapping(value = "manage.do", method = RequestMethod.GET)
	public ModelAndView manage(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/manage");

		return mv;
	}

	@RequestMapping(value = "userList.do", method = RequestMethod.GET)
	public ModelAndView userList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/userList");

		List<Map<String, Object>> list = manageService.userList(map);

		log.debug("search SQL result : " + list);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/modUserList.do", method = RequestMethod.POST)
	public ModelAndView modUserList(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		ModelAndView mv = new ModelAndView("/userList");

		log.info("modUserList map : " + map);

		int rs = manageService.updateUser(map);

		log.info("modUserList rs : " + rs);
		mv.addObject("rs", rs);

		List<Map<String, Object>> list = manageService.userList(null);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/listDelete.do", method = RequestMethod.GET)
	public ModelAndView listDelete(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.info("listDelete.do RequestParam : " + map);
		ModelAndView mv = new ModelAndView("/userList");

		int rs = manageService.deleteUser(map);
		mv.addObject("rs", rs);

		List<Map<String, Object>> list = manageService.userList(null);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/productList");

		List<Map<String, Object>> list = manageService.productList(map);

		log.debug("search SQL result : " + list);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "prodListDelete.do", method = RequestMethod.GET)
	public ModelAndView prodListDelete(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.info("prodListDelete.do RequestParam : " + map);
		ModelAndView mv = new ModelAndView("/productList");

		int rs = manageService.deleteProduct(map);
		mv.addObject("rs", rs);

		List<Map<String, Object>> list = manageService.productList(null);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "orderList.do", method = RequestMethod.GET)
	public ModelAndView orderList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/orderList");

		List<Map<String, Object>> list = manageService.orderList(map);

		log.debug("search SQL result : " + list);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/modOrderList.do", method = RequestMethod.POST)
	public ModelAndView modOrderList(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		ModelAndView mv = new ModelAndView("/orderList");

		log.info("modOrderList map : " + map);

		int rs = manageService.updateOrder(map);

		log.info("modOrderList rs : " + rs);
		mv.addObject("rs", rs);

		List<Map<String, Object>> list = manageService.orderList(null);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "orderListDelete.do", method = RequestMethod.GET)
	public ModelAndView orderListDelete(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.info("orderListDelete.do RequestParam : " + map);
		ModelAndView mv = new ModelAndView("/orderList");

		int rs = manageService.deleteOrder(map);
		mv.addObject("rs", rs);

		List<Map<String, Object>> list = manageService.orderList(null);
		mv.addObject("list", list);

		return mv;
	}

	/*
	 * JSONObject Key => code value 의미 200 : Success 400 : Error
	 */

	@ResponseBody
	@RequestMapping(value = "/modMember.do", method = RequestMethod.POST)
	public HashMap<String, Object> modMember(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		log.info("수정하는 회원이 보낸 정보 Parameter : " + map);

		//JSONObject jobj = new JSONObject();
		HashMap<String,Object> jobj = new HashMap<String,Object>();
		jobj.put("code", 400);

		int rs = manageService.updateMember(map);

		if (rs > 0) {
			jobj.put("code", 200);
			req.getSession().setAttribute("userInfo", map);
		}

		return jobj;
	}

}