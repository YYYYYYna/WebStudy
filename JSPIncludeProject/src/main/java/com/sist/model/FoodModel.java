package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class FoodModel {
	//do하고 jsp 확장자 헷갈릴때 구별법
	//파일넘어갈때 : jsp
	//이동할때 : do
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/fDetail.do")
	public String food_fDetail(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../food/fDetail.jsp");
		return "../main/main.jsp";
	}
}
