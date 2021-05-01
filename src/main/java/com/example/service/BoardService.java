package com.example.service;

import java.util.*;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("BoardService")
public class BoardService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardDAO")
	private BoardDAO BoardDAO;
		
		/*
		 * 게시판부분
		 * 게시판 수정
		 */
		public int boardupdate(Map<String, Object> map){
			return BoardDAO.boardupdate(map);
		}

		/*
		 * 게시판 삭제
		 */
		public int boarddelete(String bno){
			return BoardDAO.boarddelete(bno);
		}

		/*
		 * 게시판목록
		 */
		public List<Map<String, Object>> boardlist(Map<String, Object> map) {
			return  BoardDAO.boardlist(map);
		}
		
		/*
		 * 게시판글쓰기
		 */
		public Map<String, Object> boardread(Map<String, Object>map) {
			return BoardDAO.boardread(map);
		}
		
		//글쓰기 기능
		public int boardwrite(Map<String, Object>map){
			return BoardDAO.boardwrite(map);
		}
}