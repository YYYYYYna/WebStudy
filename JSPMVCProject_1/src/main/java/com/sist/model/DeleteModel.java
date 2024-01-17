package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class DeleteModel {
	public String execute(HttpServletRequest request)
	{
		request.setAttribute("msg", "게시판 삭제");
		return "delete.jsp"; 
		//해당내용을 list.jsp로 보내라는 뜻
		//list.jsp는 request를 받아서 출력하는 장소
	}

}
