package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.controller.RequestMapping;

public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest reqeust,HttpServletResponse response)
	{
		reqeust.setAttribute("main_jsp", "../member/join.jsp"); //이문장의뜻은 "main.jsp"안에 "../member/join.jsp"를 출력시키란말
		return "../main/main.jsp";
	}
}
