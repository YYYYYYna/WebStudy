package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
/*
 *    1. DispatcherServlet
 *       => WEB-LIB => application에 있는 클래스명을 읽는다
 *       => 대기
 *       => init은 서버구동시 한번만 수행 => 그후 service 호출시마다 나옴
 *    2. 사용자 접속 : service()
 *       => 사용자가 URL 전송
 *          main/main.do
 *       => 전체 XML에 등록된 model을 읽어서
 *          => @RequestMapping을 찾아서 메소드 호출
 */
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../main/home.jsp");
		//request.setAttribute("main_jsp", "../store/store_main.jsp");
		return "../main/main.jsp";
	}
}
