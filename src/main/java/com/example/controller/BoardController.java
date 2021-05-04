package com.example.controller;

//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.BoardService;
//import com.example.service.productService;

@Controller
@RestController
/*@RequestMapping(value = "/board")*/
public class BoardController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "BoardService")
	BoardService boardService = new BoardService();

	/*
	 * 게시판
	 * 게시판 글 작성
	 */
	@RequestMapping(value = "boardwrite.do", method = RequestMethod.GET)
	public ModelAndView boardwrite(@RequestParam Map<String, Object> map) {
		ModelAndView mv = new ModelAndView("/boardwrite");

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/boardWriteAjax.do", method = RequestMethod.POST)
	public JSONObject boardWriteAjax(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		log.debug("Request Parameter " + map); // 콘솔 로그 출력

		JSONObject jobj = new JSONObject();
		jobj.put("code", 400);

		int cnt = boardService.boardwrite(map);

		log.info("cnt : " + cnt);
		if (cnt > 0) {
			jobj.put("code", 200);
		}
		return jobj;
	}

	// 게시판 삭제
	@ResponseBody
	@RequestMapping(value = "/boarddelete.do", method = RequestMethod.POST)
	public JSONObject boarddelete(@RequestBody String bno, @RequestParam Map<String, Object> map,
			HttpServletRequest req) {

		log.info("삭제 bno Parameter : " + bno);

		JSONObject jobj = new JSONObject();
		jobj.put("code", 400);

		int rs = boardService.boarddelete(bno);
		if (rs > 0) {
			jobj.put("code", 200);
			req.getSession().setAttribute("userInfo", map);
		}

		return jobj;
	}

	@ResponseBody
	@RequestMapping(value = "/boardupdate.do", method = RequestMethod.POST)
	public JSONObject boardupdate(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		log.info("수정 : " + map);

		JSONObject jobj = new JSONObject();
		jobj.put("code", 400);

		int rs = boardService.boardupdate(map);
		if (rs > 0)
			jobj.put("code", 200);

		return jobj;
	}

	@RequestMapping(value = "boardread.do", method = RequestMethod.GET)
	public ModelAndView boardread(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/boardread");
		Map<String, Object> boardread = boardService.boardread(map);

		log.info("boardread 결과 : " + boardread);

		mv.addObject("boardread", boardread);
		return mv;
	}

	@RequestMapping(value = "boardlist.do", method = RequestMethod.GET)
	public ModelAndView boardlist(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/boardlist");
		List<Map<String, Object>> list = boardService.boardlist(map);

		log.debug("search SQL result : " + list);
		mv.addObject("list", list);
		return mv;
	}
}