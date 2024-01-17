package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel {
	public String execute(HttpServletRequest request)
	{
		request.setAttribute("msg", "게시판 추가");
		return "insert.jsp"; 
		//해당내용을 list.jsp로 보내라는 뜻
		//list.jsp는 request를 받아서 출력하는 장소
	}
}
