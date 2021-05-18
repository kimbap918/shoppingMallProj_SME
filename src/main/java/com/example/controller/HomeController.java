package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.CommonService;

@Controller
@RestController
public class HomeController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "commonService")
	CommonService commonService = new CommonService();

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public ModelAndView loginTest(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/login");

		mv.addObject("map", map);

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
	public HashMap<String, Object> idcheck(@RequestBody String id) {

		log.info("id check Parameter : " + id);
		
		//JSONObject jobj = new JSONObject();
		HashMap<String,Object> jobj = new HashMap<String,Object>();
		jobj.put("cnt", 0);

		int cnt = commonService.idcheck(id);
		if (cnt > 0) {
			jobj.put("cnt", cnt);
		}

		return jobj;
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(@RequestParam Map<String, Object> map) throws Exception {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/mypage");

		return mv;
	}

	@RequestMapping(value = { "join.do" }, method = RequestMethod.GET)
	public ModelAndView join(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/join");

		return mv;
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/search");

		List<Map<String, Object>> list = null;
		list = commonService.search(map);
		System.out.println("출력 : " + list);

		log.debug("search SQL result : " + list);

		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest req) {

		HttpSession s = req.getSession();

		ModelAndView mv = new ModelAndView("redirect:/");

		if (s.getAttribute("userInfo") != null)
			mv.addObject("msg", "사이트에서 안전하게 로그아웃 되었습니다.");
		s.invalidate();

		return mv;
	}
	
	// 여기에 받아오는 MAP은 사용자가 JSP에서 입력한 값을 받아오는 MAP key value
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST) // 매핑 요청 값, 방법
	public ModelAndView loginCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		log.debug("Request Parameter : " + map); 
		
		
		ModelAndView mv = new ModelAndView("redirect:/");
		if(req.getParameter("id").equals("admin") && req.getParameter("pwd").equals("admin")) {
			HttpSession s = req.getSession();
			map.put("admin_id", "admin");
			map.put("admin_name", "관리자");
			s.setAttribute("admin", map);
			s.setMaxInactiveInterval(30 * 60);
			mv.addObject("msg", "관리자 로그인 성공");
		} 
		
		Map<String, Object> userInfo = commonService.loginCheck(map);
		if (userInfo != null) { // 널 체크
			HttpSession s = req.getSession(); // 세션 생성
			s.setAttribute("userInfo", userInfo); // 세션에 속성값 부여
			s.setMaxInactiveInterval(30 * 60); // 세션 시간	
			mv.addObject("msg", "로그인 성공"); // 성공 확인
		}
		else {
			mv.addObject("msg", "아이디 및 비밀번호를 다시 확인해주세요."); // 실패 확인
			mv.setViewName("/login");
		}		
		return mv;
	}

		

		

	@RequestMapping(value = "joinCheck.do", method = RequestMethod.POST) 
	public ModelAndView joinCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) { //

		log.debug("Request Parameter " + map); 

		ModelAndView mv = new ModelAndView("redirect:/"); 
		int rs = commonService.joinCheck(map);

		if (rs > 0) { 
			HttpSession s = req.getSession(); 
			s.setAttribute("userInfo", map); 
			mv.addObject("msg", "회원가입 성공");

		} else {
			mv.setViewName("redirect:/join.do");
			mv.addObject("msg", "회원가입 실패");
		}

		return mv;
	}

}