package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
//기록저장소 
@Repository("BoardDAO") 
@SuppressWarnings("unchecked")
public class BoardDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	
	//게시판
	public int boardwrite(Map<String, Object> map) {
		return (Integer) insert ("board.boardwrite", map);
	}
	
	//게시판 수정
	public int boardupdate(Map<String, Object> map) { 
		return (Integer) update("board.boardupdate", map);
	}
	
	//게시판 삭제
	public int boarddelete(String bno){ 
		return (Integer) delete("board.boarddelete", bno);} 

	/*
	 * 게시판읽기
	 */
	public Map<String, Object > boardread(Map<String, Object> map) { 
		return (Map<String, Object >) selectOne ("board.boardread", map);
	}
	
	/*
 	* 게시판리스트부르기
	*/
	public List<Map<String, Object >> boardlist(Map<String, Object> map) { 
		return  (List<Map<String, Object >>) selectList ("board.boardlist", map);
	}
			   
}