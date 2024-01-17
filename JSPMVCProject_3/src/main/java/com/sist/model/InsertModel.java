package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel implements Model {

	 @Override
	public String handleRequest(HttpServletRequest request) {
		//화면이동
		
		return "board/insert.jsp";
	}

}
